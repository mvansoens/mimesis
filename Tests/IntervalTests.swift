import XCTest
@testable import Mimesis

final class IntervalTests: XCTestCase {

    func testPerfectFifthRatio() {
        let fifth = Interval.all.first { $0.name == "Perfect Fifth" }!
        XCTAssertEqual(fifth.ratioNumerator, 3)
        XCTAssertEqual(fifth.ratioDenominator, 2)
        XCTAssertEqual(fifth.ratioString, "3:2")
    }

    func testUpperFrequency() {
        let fifth = Interval.all.first { $0.name == "Perfect Fifth" }!
        let upper = fifth.upperFrequency(from: 220.0)
        XCTAssertEqual(upper, 330.0, accuracy: 0.001)
    }
}
