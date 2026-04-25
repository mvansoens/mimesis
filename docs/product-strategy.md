# Product Strategy

## Core Concept

Learn math by hearing and manipulating musical structure.

Instead of presenting a concept first (for example, "3:2 is a ratio"), the app lets users hear a stable interval and then reveals the math behind it.

## Learning Loop

Every lesson should follow this sequence:

1. Hear it
2. Manipulate it
3. See the math
4. Solve a challenge

If the app skips hearing or manipulation, the experience loses its core advantage.

## App Structure

### 1. Playground (Core Engine)

An interactive sound lab where users can:

- Slide frequency up and down
- Combine tones
- Tap common intervals (octave, fifth, and so on)
- Change tempo with direct visual feedback

Interaction examples:

- Two-tone slider pair for harmony exploration
- Rhythm grid for beat subdivision

### 2. Lessons (Progressive Unlock)

#### Level 1: Fractions Through Rhythm

- Tap beats and split into halves, quarters, and triplets
- Visual model: timeline or pie chart
- Goal: fill a bar correctly

Math outcomes:

- Fractions
- Division
- Time ratios

#### Level 2: Ratios Through Harmony

- Play two notes and adjust until stable/pleasant
- Reveal ratio after success (example: 3:2)

Math outcomes:

- Ratios
- Simplification
- Pattern recognition

#### Level 3: Exponents Through Pitch

- Step through semitones and observe frequency growth
- Show multiplicative pattern instead of formula-first teaching

Math outcomes:

- Exponents
- Growth patterns

#### Level 4: Waves and Shapes

- Show waveform change while combining tones

Math outcomes:

- Trigonometric intuition
- Superposition intuition

## Gamification

Challenge types:

- Tune this interval correctly
- Fix the rhythm
- Choose which option sounds right
- Guess the ratio by ear

Progression ideas:

- Unlock instruments
- Unlock more complex rhythms
- Daily challenge streaks

## Tech Stack Direction

- UI: SwiftUI
- Audio engine: AVAudioEngine (native) or AudioKit (faster synthesis workflow)
- Visuals: SwiftUI Canvas and Core Animation

## Primary Risks

1. Audio latency

Delayed sound makes interaction feel broken. Real-time audio handling is critical.

2. UX clarity

Users should feel like they are playing with sound, not doing worksheets.

3. Intuition-to-math mapping

Timing and depth of explanation matter. Reveal math only when it reinforces discovery.

## MVP Recommendation

Start with a single feature: Interval Trainer.

MVP flow:

- Play two tones
- User adjusts one tone to match target interval
- App reveals ratio and interval name

MVP learning outcomes:

- Ratio intuition
- Ear training basics
- Pattern recognition

## Expansion Ideas

- MIDI keyboard input
- Humming analysis
- AI-generated exercises
- Switchable "Math mode" and "Music mode"

## Product Reality Check

Likely to work when:

- Interaction comes before explanation
- It feels playful, not lecture-like
- Feedback is immediate and audible

Likely to fail when:

- Content becomes text-heavy slides and quizzes
- Audio is secondary to static visuals
- Math is forced rather than discovered
