import SwiftUI

struct IntervalTrainerView: View {

    @StateObject private var audio = AudioEngine()

    private let rootFrequency: Double = 220.0  // A3
    private let target: Interval = Interval.all[1]  // Perfect Fifth

    @State private var sliderRatio: Double = 1.0   // 1.0 = unison, 2.0 = octave
    @State private var revealed = false
    @State private var isCorrect = false

    private var upperFrequency: Double { rootFrequency * sliderRatio }
    private var toleranceRange: ClosedRange<Double> {
        let exact = Double(target.ratioNumerator) / Double(target.ratioDenominator)
        return (exact - 0.02)...(exact + 0.02)
    }

    var body: some View {
        VStack(spacing: 32) {
            Text("Interval Trainer")
                .font(.largeTitle.bold())

            Text("Find the \(target.name)")
                .font(.title2)
                .foregroundStyle(.secondary)

            // Tone controls
            VStack(spacing: 16) {
                Button("Play root") { audio.playRoot(frequency: rootFrequency) }
                    .buttonStyle(.bordered)

                Slider(value: $sliderRatio, in: 1.0...2.0, step: 0.001)
                    .padding(.horizontal)
                    .onChange(of: sliderRatio) { _, ratio in
                        audio.playUpper(frequency: rootFrequency * ratio)
                        revealed = false
                    }

                Button("Play both") {
                    audio.playRoot(frequency: rootFrequency)
                    audio.playUpper(frequency: upperFrequency)
                }
                .buttonStyle(.bordered)
            }

            // Check answer
            Button("Check") {
                isCorrect = toleranceRange.contains(sliderRatio)
                revealed = true
                audio.stopAll()
            }
            .buttonStyle(.borderedProminent)

            // Result
            if revealed {
                VStack(spacing: 8) {
                    Text(isCorrect ? "Correct!" : "Not quite — try again")
                        .font(.headline)
                        .foregroundStyle(isCorrect ? .green : .red)

                    if isCorrect {
                        Text("\(target.name) = \(target.ratioString)")
                            .font(.title3.monospacedDigit())
                    }
                }
                .transition(.opacity)
                .animation(.easeInOut, value: revealed)
            }

            Spacer()
        }
        .padding()
        .onDisappear { audio.stopAll() }
    }
}

#Preview {
    IntervalTrainerView()
}
