Artifact for SeqAss

SeqAss is a randomized cache structure using sequential associativity.
Without relying on techniques intrusive to the traditional cache structure,
such as cache skews, over-provided metadata space, and random replacement
policy, SeqAss retains the set-associative structure and supports LRU. It
achieves a defense as strong as Mirage. To be specific, SeqAss achieves
around the same defense strength with Mirage in thwarting both Evict+Time
and Prime+Probe attacks. Instead of raising cache miss rate, SeqAss
actually reduces it by 11.4%, incurring the lowest cache miss rate in all
existing randomized cache structures.
