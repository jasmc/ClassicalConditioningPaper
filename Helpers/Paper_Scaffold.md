# Paper scaffold

Living outline of the manuscript. This file records the purpose, content, and intended placement of each part of the paper; it is not manuscript prose.

---

## Results

### Result 1 — Setup, stimuli, and experimental protocols

**Purpose:** Establish an imaging-compatible, head-fixed classical-conditioning assay in larval zebrafish and explain how its design supports measurement of a suppressive conditioned response.

**Source draft:** `sections/3_Results_1.tex`

#### 1.1 Assay rationale and initial validation

- Optovin-mediated TRPA1b photostimulation is proposed as a precisely timed aversive unconditioned stimulus (US).
- Build a head-fixed larval-zebrafish conditioning assay with automated tail tracking and controlled stimulus delivery.
- First validate the optovin-based US using Delay conditioning, an established learning configuration in larval zebrafish.

#### 1.2 Setup, conditioned stimulus, and unconditioned stimulus

- **Preparation:** Larva head-restrained in agarose; eyes and tail remain free.
- **Behavioral readout:** Automatically tracked tail kinematics.
- **Conditioned stimulus (CS):** A 10-s visual stimulus, using white or red side LEDs while basal illumination switches off.
- **Unconditioned stimulus (US):** 100-ms violet-light pulse in optovin-containing medium.
- **Immediate US effect:** Optovin activation reliably elicits vigorous tail movement.
- **Main figure placement:** Setup and stimulus schematic in Fig. 1A; dedicated US-response characterization in Sup. Fig. 1.

#### 1.3 Overall conditioning protocol

- Four phases:
  1. Priming/habituation: four CS-like stimuli alone.
  2. Pre-training: ten CS-alone trials.
  3. Training: 46 paired CS--US trials plus four CS-alone catch trials.
  4. Testing: 30 CS-alone trials.
- Training uses the 100-ms `long US`.
- **Main figure placement:** Protocol overview in Fig. 1B.
- **Supplementary placement:** Detailed protocol timing in Sup. Fig. 2A.

#### 1.4 Baseline-activity design: short USs

- Optovin stimulation both evokes strong movements and raises baseline swimming activity.
- Because the CR is measured as reduced tail vigor, a stable active baseline is necessary.
- Add 50-ms `short US` pulses:
  - During priming/habituation to initiate an active behavioral state.
  - At selected points to sustain baseline activity through the experiment.
- Short USs are not conditioning trials:
  - Never paired with the CS.
  - Separated from CS presentations by more than 30 s.
- **Outcome:** The protocol maintains sufficient, stable tail activity for detecting a conditioned suppression response.
- **Supplementary placement:** Baseline movement over the protocol in Sup. Fig. 2B.

#### 1.5 Conditioning contingencies

- **Delay:** Long US occurs 1 s before CS offset (overlaps with the CS).
- **3sTrace:** Long US occurs 3 s after CS offset.
- **10sTrace:** Long US occurs 10 s after CS offset.
- The relative CS--US timing during training distinguishes the conditioning conditions.
- **Main figure placement:** Condition-specific timing diagrams in Fig. 1B.

#### 1.6 Unpaired control protocol

- CS and US are explicitly unpaired during training, preventing a stable predictive relationship.
- CS timing is randomized.
- Nearly every control larva receives a unique randomized CS schedule to minimize accidental conditioning.
- **Interpretive role:** Provides the non-associative baseline for all subsequent learning claims.

---

### Result 2 — Suppression of tail-movement vigor as the conditioned response

**Purpose:** Define the behavioral measure of learning and show, first qualitatively in individual animals, that paired conditioning produces CS-locked suppression of tail vigor.

**Source draft:** `sections/3_Results_1.tex`

#### 2.1 Learning readout

- Learning is assessed as a change in CS-evoked tail-movement vigor across conditioning.
- Tail vigor is the rate of change of overall tail curvature over time.
- **Interpretation:** A decrease in vigor after CS onset is the candidate conditioned response (CR).

#### 2.2 Qualitative single-fish evidence

- Begin with individual fish to identify the form and timing of potential CRs before population analysis.
- Normalize each trial's tail vigor to its pre-CS baseline, accounting for baseline fluctuations across trials and animals.
- Visualize normalized vigor in trial-by-time heatmaps.
- **Primary paired example (3sTrace) fish:**
  - No clear CS-evoked modulation in pre-training.
  - Progressive decrease in vigor after CS onset during training.
  - Suppression extends from the CS into the 3-s trace interval and persists into early testing, consistent with acquisition and short-term retention.
- **Supporting paired example (Delay) fish:**
  - Shows the corresponding learned reduction during the CS--US interval and its expression in early testing.
  - Validates that the assay detects the expected response in the established Delay configuration.
- **Example control fish:**
  - No consistent CS-locked suppression.
  - Randomized US timing limits CS-aligned interpretation during training.
  - Absence of early-test anticipatory suppression supports a CS--US contingency-dependent interpretation.
- **Main figure placement:** Raw tail angle (Fig. 1C), vigor calculation (Fig. 1D), a Delay heatmap (Fig. 1E), a primary 3sTrace heatmap (Fig. 1F), and a matched control heatmap (Fig. 1G).
- **Potential supplementary material:** Additional individual examples and later learner/non-learner characterization.

#### 2.3 Unconditioned response (UR)

- Individual fish reveal the immediate optovin-evoked response to the US.
- The UR comprises high-frequency, high-amplitude tail movements followed by an immobility phase.
- Post-US immobility is strongest early in training, potentially reflecting first exposures to the US.
- **Role in the narrative:** Distinguish the direct US response from the learned, anticipatory CS-evoked suppression.
- **Supplementary placement:** US-aligned individual data and responses to short USs.

---

---

### Result 3 — Population-level learning, extinction, and the 10sTrace boundary condition

**Purpose:** Test whether the single-fish patterns generalize across larvae, quantify learned suppression and extinction, and present 10sTrace as the third main comparison in Figure 2.

**Source draft:** sections/4_Results_2.tex

#### 3.1 Population heatmaps

- Align scaled-vigor measurements to CS onset and aggregate across larvae within each condition.
- Heatmaps show mean movement intensity among fish active in a time bin, not the proportion of larvae moving.
- Interpret post-US and otherwise sparse bins accordingly.

#### 3.2 Delay and 3sTrace population evidence

- In both paired groups, CS-locked vigor suppression develops during training.
- Suppression is expressed in early CS-only testing and weakens during later testing, consistent with extinction.
- Matched unpaired controls lack sustained CS-locked suppression.
- **Main figure placement:** Figure 2A,B heatmap cohort pairs, Figure 2D,E block-level CR ratios, and Figure 2G,H trial-by-trial CR ratios.

#### 3.3 10sTrace as the third Figure 2 column

- Keep 10sTrace in the main paper as the third Figure 2 comparison, alongside Delay and 3sTrace.
- The heatmap and block-level analyses show at most a weak, statistically inconclusive population effect.
- Interpret it as a boundary condition under the present protocol: it is not evidence of successful long-trace conditioning and not a demonstrated absolute temporal limit.
- **Main figure placement:** Figure 2C heatmap cohort pair, Figure 2F block-level CR ratio, and Figure 2I trial-by-trial CR ratio.

#### 3.4 UR and control alignment

- In paired groups, the optovin-mediated UR appears at the expected US time.
- In CS-aligned unpaired controls, temporally varied US delivery disperses the UR.
- US-aligned controls show no systematic pre-US suppression or build-up.
- **Supplementary placement:** US-aligned control analysis.

#### 3.5 Block-level and trial-resolved quantification

- Define the CR ratio as response vigor relative to pre-CS baseline vigor.
- Compare final Pre-Train, Early Test, and Late Test five-trial blocks.
- Delay and 3sTrace: Early Test suppression relative to Pre-Train and matched controls; return toward baseline in Late Test.
- 10sTrace: no statistically reliable Early Test suppression.
- Trial-resolved values show acquisition during training and extinction during testing in Delay and 3sTrace.

#### 3.6 Reinforcement-specificity control

- Delay-style pairings with violet light but without optovin do not yield a detectable CR.
- This supports optovin-mediated photostimulation, rather than violet light alone, as the effective US.
- **Supplementary placement:** Sup. Fig. 3.

---

## Items to resolve when revising these Results sections

- Verify and complete background references for optovin and Delay conditioning.
- Confirm exact timing from every short US to the nearest CS.
- Add baseline movement-rate evidence and quantitative description where available.
- Confirm figure and supplementary-figure numbering.
- Confirm the final Fig. 1 panels for setup, protocol, tail angle, vigor calculation, and the Delay, 3sTrace, and unpaired-control examples; place US-response characterization in supplementary material.
- Confirm the final Figure 2 panel layout: Delay, 3sTrace, and 10sTrace as the three main columns, each with its matched control.
- Quantify the UR and post-US immobility if these effects remain part of the Results claim.
- Standardize terminology: `Pre-training` / `Training` / `Testing`; `long US` / `short US`; `Delay`, `3sTrace`, and `10sTrace`.

---

## Next sections to add

- Learner heterogeneity / individual trajectories, if retained.
- CR timing and trial-by-trial dynamics.
- Controls, boundary conditions, and supplementary analyses.
- Discussion, Methods, figures, and other manuscript sections as they are drafted.
