/*:
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


 This results in the following 12 cases to cover with our test:



[Next](@next)
 */

