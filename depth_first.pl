choose(Head, [Head|Tail], Tail). /* Selects first item */

combine(ExpandedPaths,Rest,Paths):- /* Appends the paths with deepest node first */
    append(ExpandedPaths,Rest,Paths).

