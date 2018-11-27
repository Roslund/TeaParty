/*:
 [Previous](@previous)
 # Implementation
 First we model the outcome as an enum:
 */
enum Outcome {
    case bad
    case good
    case great
}
//: Here we have an example implementation
func teaParty(tea: Int, candy: Int) -> Outcome {
    switch (tea, candy) {
    case let(x, y) where x < 5 || y < 5:
        return .bad
    case let(x, y) where x >= 2*y || y >= 2*x:
        return .great
    default:
        return .good
    }
}
//: [Next](@next)
