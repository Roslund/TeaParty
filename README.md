# Tea Party
We are having a party with amounts of tea and candy.
A party is good if both tea and candy are at least 5.
However, if either tea or candy is at least double the amount of the other one, the party is great.  
However, in all cases, if either tea or candy is less than 5, the party is always bad.

---------------------------------------

## Equivalence partitioning
We are goint to use Equivalence partitioning to define our test cases.
We devide each input into three ranges:  
`(..<5)`, `(5..<10)` and `(10...)`.  
If either input is less than five the party will be bad. Therfore, at least one input having to be grater than 10 for a great party to be possible.

|              | Party is bad            | Party is good    | Party is great   |
|--------------|-------------------------|------------------|------------------|
| Tea          | (..<5) (5..<10) (10...) | (5..<10) (10...) | (5..<10) (10...) |
| Candy        | (..<5) (5..<10) (10...) | (5..<10) (10...) | (5..<10) (10...) |
| Total        | 5                       | 4                | 3                |

This results in the following 12 cases to cover with our test:

|    | Party is bad |          |    | Party is good |          |     | Party is great |          |
|----|--------------|----------|----|---------------|----------|-----|----------------|----------|
| #  | Tea          | Candy    | #  | Tea           | Candy    | #   | Tea            | Candy    |
| 1  | (..<5)       | (..<5)   | 6  | (5..<10)      | (5..<10) | 10  | (5..<10)       | (10...)  |
| 2  | (..<5)       | (5..<10) | 7  | (5..<10)      | (10...)  | 11  | (10...)        | (5..<10) |
| 3  | (..<5)       | (10...)  | 8  | (10...)       | (5..<10) | 12  | (10...)        | (10...)  |
| 4  | (5..<10)     | (..<5)   | 9  | (10...)       | (10...)  |     |                |          |
| 5  | (10...)      | (..<5)   |    |               |          |     |                |          |

## Implementation
First we model the outcome as an enum:
```swift
enum Outcome {
    case bad
    case good
    case great
}
```

Here we have an example implementation
```swift
func teaParty(candy: Int, tea: Int) -> Outcome {
    switch (candy, tea) {
    case let(x, y) where x < 5 || y < 5:
        return .bad
    case let(x, y) where x >= 2*y || y >= 2*x:
        return .great
    default:
        return .good
    }
}
```

## Testing
When crafting our test cases we have to be carefull: just because the input is `(10...)` and `(10...)` does not mean that the party is great. We have decided on the following test cases
```swift
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
```
