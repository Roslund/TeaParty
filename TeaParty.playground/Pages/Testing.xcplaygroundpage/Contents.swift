/*:
 [Previous](@previous)
 # Testing
 When crafting our test cases we have to be carefull: just because the input is (10...) and (10...) does not mean that the party is great. We have decided on the following test cases
 */
import XCTest

class teaPartyTests: XCTestCase {
    func testBadParty() {
        XCTAssertEqual(teaParty(tea: 4,  candy: 2  ), .bad) // 1:  (..<5)    (..<5)
        XCTAssertEqual(teaParty(tea: 4,  candy: 7  ), .bad) // 2:  (..<5)    (5..<10)
        XCTAssertEqual(teaParty(tea: 3,  candy: 14 ), .bad) // 3:  (..<5)    (10...)
        XCTAssertEqual(teaParty(tea: 6,  candy: 3  ), .bad) // 4:  (5..<10)  (..<5)
        XCTAssertEqual(teaParty(tea: 21, candy: 2  ), .bad) // 5:  (10...)   (..<5)
    }

    func testGoodParty() {
        XCTAssertEqual(teaParty(tea: 7,  candy: 9  ), .good) // 6:  (5..<10)  (5..<10)
        XCTAssertEqual(teaParty(tea: 8,  candy: 14 ), .good) // 7:  (5..<10)  (10...)
        XCTAssertEqual(teaParty(tea: 10, candy: 9  ), .good) // 8:  (10...)   (5..<10)
        XCTAssertEqual(teaParty(tea: 20, candy: 35 ), .good) // 9:  (10...)   (10...)
    }

    func testGreatParty() {
        XCTAssertEqual(teaParty(tea: 6,  candy: 12 ), .great) // 10: (5..<10)  (10...)
        XCTAssertEqual(teaParty(tea: 14, candy: 5  ), .great) // 11: (10...)   (5..<10)
        XCTAssertEqual(teaParty(tea: 30, candy: 60 ), .great) // 12: (10...)   (10...)
    }
}

teaPartyTests.defaultTestSuite.run()
