import Foundation

/// A musical interval defined by its frequency ratio and common name.
struct Interval: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let ratioNumerator: Int
    let ratioDenominator: Int

    var ratioString: String { "\(ratioNumerator):\(ratioDenominator)" }

    /// Frequency of the upper note given a root frequency.
    func upperFrequency(from root: Double) -> Double {
        root * Double(ratioNumerator) / Double(ratioDenominator)
    }

    static let all: [Interval] = [
        Interval(name: "Unison",        ratioNumerator: 1,  ratioDenominator: 1),
        Interval(name: "Perfect Fifth", ratioNumerator: 3,  ratioDenominator: 2),
        Interval(name: "Perfect Fourth",ratioNumerator: 4,  ratioDenominator: 3),
        Interval(name: "Major Third",   ratioNumerator: 5,  ratioDenominator: 4),
        Interval(name: "Minor Third",   ratioNumerator: 6,  ratioDenominator: 5),
        Interval(name: "Octave",        ratioNumerator: 2,  ratioDenominator: 1),
    ]
}
