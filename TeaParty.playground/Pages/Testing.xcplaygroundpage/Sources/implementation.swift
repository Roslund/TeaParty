public enum Outcome {
    case bad
    case good
    case great
}

public func teaParty(tea: Int, candy: Int) -> Outcome {
    switch (tea, candy) {
    case let(x, y) where x < 5 || y < 5:
        return .bad
    case let(x, y) where x >= 2*y || y >= 2*x:
        return .great
    default:
        return .good
    }
}
