import Cardinal
public import Comparison
public import Finite_Enumerable
import Ordinal
public import Pair

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
