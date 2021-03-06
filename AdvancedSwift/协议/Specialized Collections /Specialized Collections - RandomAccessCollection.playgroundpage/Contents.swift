/*:
### RandomAccessCollection

A `RandomAccessCollection` provides the most efficient element access of all —
it can jump to any index in constant time. To do this, conforming types must be
able to (a) move an index any distance, and (b) measure the distance between any
two indices, both in `O(1)` time. `RandomAccessCollection` redeclares its
associated `Indices` and `SubSequence` types with stricter constraints — both
must be random-access themselves — but otherwise adds no new requirements over
`BidirectionalCollection`. Adopters must ensure to meet the documented `O(1)`
complexity requirements, however. You can do this either by providing
implementations of the `index(_:offsetBy:)` and `distance(from:to:)` methods, or
by using an `Index` type that conforms to `Strideable`, such as `Int`.

At first, this might seem like it doesn't add much. Even a simple
forward-traverse-only collection like our `List` can advance an index by an
arbitrary distance. But there's a big difference. For `Collection` and
`BidirectionalCollection`, `index(_:offsetBy:)` operates by incrementing the
index successively until it reaches the destination. This clearly takes linear
time — the longer the distance traveled, the longer it'll take to run.
Random-access collections, on the other hand, can just move straight to the
destination.

This ability is key in a number of algorithms, a couple of which we'll look at
in the chapter on generics. There, we'll implement a generic binary search, but
it's crucial this algorithm be constrained to random-access collections only —
otherwise it'd be far less efficient than just searching through the collection
from start to end.

Earlier, when we implemented our linked list, we wrote a custom version of
`count` because we could get it from the tags. A random-access collection can
compute the distance between its `startIndex` and `endIndex` in constant time,
which means the collection can also compute `count` in constant time out of the
box.

> Under the old Swift 2 indexing model, the capability of forward-only,
> bidirectional, or random-access traversal was a property of the index and not
> the collection. Instead of `BidirectionalCollection` and
> `RandomAccessCollection`, there were `ForwardIndexType`,
> `BidirectionalIndexType`, and `RandomAccessIndexType`. Through protocol
> extensions that were constrained on the index type, the collection would then
> have implementations for operations that depended on the index's capabilities.
> 
> The new model — where index traversal is defined in terms of a refinement of
> `Collection` — is clearer and matches the existing scheme of
> `MutableCollection` and `RangeReplaceableCollection`.

*/
