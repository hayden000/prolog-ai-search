choose(Head,[Head|Tail],Tail).  /* Selects first item */

combine(Expansions,RestOfPaths,NewPaths):- /* Appends the paths */
    append(RestOfPaths,Expansions,NewPaths).
