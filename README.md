# Comparison Finite

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Finite-enumerable conformance for the three-valued `Comparison` result — type-level arity, ordinal indexing, and ordinal round-tripping — with zero platform dependencies.

---

## Quick Start

`Comparison` is the three-valued ordering result (`.less`, `.equal`, `.greater`) from `Comparison`. This package conforms it to `Finite.Enumerable`, so it carries its arity in the type, maps each case to an `Ordinal`, and round-trips back from an ordinal — the same isomorphism every other enumerable primitive uses.

```swift
import Comparison_Finite

// Arity lives in the type: there are exactly three comparison values.
print(Comparison.count)   // 3   (a Cardinal)

// Each value has a stable ordinal in 0..<count.
for comparison in Comparison.allCases {
    print(comparison.ordinal)   // 0, then 1, then 2
}
```

Round-trip through the ordinal — the unchecked fast path when the ordinal is trusted, the failable `init?` when it is not:

```swift
import Comparison_Finite

// Trusted ordinal: no bounds check.
let greater = Comparison(_unchecked: (), ordinal: 2)   // .greater

// Untrusted ordinal: total and safe, nil outside 0..<count.
let parsed = Comparison(2)    // Optional(.greater)
let invalid = Comparison(7)   // nil
```

The conformance also exposes `Comparison.Value`, a `Comparison` paired with an arbitrary payload — useful for carrying a comparison result alongside the operands that produced it:

```swift
import Comparison_Finite

// Comparison.Value<Payload> == Pair<Comparison, Payload>
let tagged: Comparison.Value<String> = .init(.less, "a < b")
```

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-comparison-finite.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Comparison Finite", package: "swift-comparison-finite"),
    ]
)
```

Requires Swift 6.4 and macOS 27 / iOS 27 / tvOS 27 / watchOS 27 / visionOS 27 (or the matching Linux / Windows toolchain).

---

## Architecture

One conformance target plus its test-support re-export. The main target composes the atom-owned Comparison, Finite, Pair, Cardinal, and Ordinal domains with the Finite Ordinal owner of `Finite.Enumerable`, so consumers get the complete surface from a single import.

| Product | Target | Purpose |
|---------|--------|---------|
| `Comparison Finite` | `Sources/Comparison Finite/` | Retroactively conforms `Comparison` to `Finite.Enumerable` (`count`, `ordinal`, `init(_unchecked:ordinal:)`) and adds the `Comparison.Value<Payload>` pairing. |
| `Comparison Finite Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 27 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
