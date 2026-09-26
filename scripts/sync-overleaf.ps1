param(
    [Parameter(Mandatory = $true)]
    [string]$Commit,
    [string]$PreviousCommit = ''
)

$ErrorActionPreference = 'Stop'
$repoRoot = (git rev-parse --show-toplevel).Trim()
if ($LASTEXITCODE -ne 0) { throw 'Could not locate the source repository.' }
if ($Commit -notmatch '^[0-9a-fA-F]{40,64}$') { throw 'Invalid source commit ID.' }

$tempRoot = Join-Path $env:TEMP ('overleaf-sync-' + [guid]::NewGuid().ToString('N'))
$overleafPath = Join-Path $tempRoot 'overleaf'
$sourcePath = Join-Path $tempRoot 'source'
$archivePath = Join-Path $tempRoot 'source.zip'
$overleafUrl = 'https://git@git.overleaf.com/6ab2946d7d8c506a0a1b36d9'

try {
    New-Item -ItemType Directory -Path $tempRoot | Out-Null

    git -C $repoRoot archive --format=zip --output=$archivePath $Commit
    if ($LASTEXITCODE -ne 0) { throw 'Could not export the pushed source commit.' }
    New-Item -ItemType Directory -Path $sourcePath | Out-Null
    Expand-Archive -LiteralPath $archivePath -DestinationPath $sourcePath

    git clone --branch main $overleafUrl $overleafPath
    if ($LASTEXITCODE -ne 0) { throw 'Could not clone the Overleaf project.' }

    $files = git -C $repoRoot ls-tree -r --name-only $Commit
    if ($LASTEXITCODE -ne 0) { throw 'Could not list files in the pushed source commit.' }

    foreach ($relative in $files) {
        if ($relative -in @('main.bbl', 'main.synctex.gz', 'indent.log')) { continue }
        if ($relative.StartsWith('.githooks/') -or $relative.StartsWith('scripts/') -or $relative.StartsWith('.github/')) { continue }

        $targetRelative = $relative -replace '^sections/', 'Sections/'
        $sourceFile = Join-Path $sourcePath ($relative -replace '/', '\')
        $targetFile = Join-Path $overleafPath ($targetRelative -replace '/', '\')
        $targetDirectory = Split-Path -Parent $targetFile
        if (-not (Test-Path -LiteralPath $targetDirectory)) {
            New-Item -ItemType Directory -Path $targetDirectory -Force | Out-Null
        }
        Copy-Item -LiteralPath $sourceFile -Destination $targetFile -Force
    }

    if ($PreviousCommit -match '^[0-9a-fA-F]{40,64}$' -and $PreviousCommit -notmatch '^0+$') {
        $deletedFiles = git -C $repoRoot diff --no-renames --diff-filter=D --name-only $PreviousCommit $Commit --
        if ($LASTEXITCODE -ne 0) { throw 'Could not identify files removed by the pushed commits.' }
        foreach ($relative in $deletedFiles) {
            if ($relative -in @('main.bbl', 'main.synctex.gz', 'indent.log')) { continue }
            if ($relative.StartsWith('.githooks/') -or $relative.StartsWith('scripts/') -or $relative.StartsWith('.github/')) { continue }
            $targetRelative = $relative -replace '^sections/', 'Sections/'
            $targetFile = Join-Path $overleafPath ($targetRelative -replace '/', '\')
            if (Test-Path -LiteralPath $targetFile -PathType Leaf) {
                Remove-Item -LiteralPath $targetFile -Force
            }
        }
    }

    $mainFile = Join-Path $overleafPath 'main.tex'
    $mainText = [System.IO.File]::ReadAllText($mainFile)
    $mainText = [regex]::Replace($mainText, 'sections/', 'Sections/')
    [System.IO.File]::WriteAllText($mainFile, $mainText, [System.Text.UTF8Encoding]::new($false))

    git -C $overleafPath add -A
    if ($LASTEXITCODE -ne 0) { throw 'Could not stage the Overleaf update.' }
    git -C $overleafPath diff --cached --quiet
    if ($LASTEXITCODE -eq 0) {
        Write-Output 'Overleaf already matches the pushed source commit.'
        return
    }
    if ($LASTEXITCODE -ne 1) { throw 'Could not inspect the staged Overleaf update.' }

    $authorName = (git -C $repoRoot config user.name)
    $authorEmail = (git -C $repoRoot config user.email)
    if (-not $authorName) { $authorName = 'Overleaf Sync' }
    if (-not $authorEmail) { $authorEmail = 'overleaf-sync@users.noreply.github.com' }

    git -C $overleafPath config user.name $authorName
    git -C $overleafPath config user.email $authorEmail
    git -C $overleafPath commit -m "Sync from local main ($($Commit.Substring(0, 7)))"
    if ($LASTEXITCODE -ne 0) { throw 'Could not commit the Overleaf update.' }
    git -C $overleafPath push origin main
    if ($LASTEXITCODE -ne 0) { throw 'Could not push the update to Overleaf.' }

    Write-Output 'Overleaf sync completed.'
}
finally {
    if (Test-Path -LiteralPath $tempRoot) {
        Remove-Item -LiteralPath $tempRoot -Recurse -Force
    }
}
