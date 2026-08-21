import Cardinal_Primitives
public import Comparison_Primitives
public import Finite_Enumerable_Primitives
import Ordinal_Primitives
public import Pair_Primitives

extension Comparison {

    public typealias Value<Payload> = Pair<Comparison, Payload>
}

extension Comparison: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { 3 }

    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .less: 0
        case .equal: 1
        case .greater: 2
        }
    }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = [.less, .equal, .greater][ordinal]
    }
}
