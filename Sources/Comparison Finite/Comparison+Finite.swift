public import Cardinal
public import Comparison
public import Comparison_Standard_Library_Integration
public import Finite
public import Finite_Ordinal
public import Ordinal
public import Pair

extension Comparison {

    public typealias Value<Payload> = Pair<Comparison, Payload>
}

extension Comparison: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { Cardinal(3) }

    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .less: Ordinal(0)
        case .equal: Ordinal(1)
        case .greater: Ordinal(2)
        }
    }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        switch ordinal.rawValue {
        case 0: self = .less
        case 1: self = .equal
        default: self = .greater
        }
    }
}
