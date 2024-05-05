search(Paths, Solution):-
    choose([Node|Nodes], Paths, _),
    goal(Node),
    reverse([Node|Nodes], Solution).


search(Paths, Solution):-
    choose(Path, Paths, RestOfPaths),
    findall([NewNode|Path], expands(Path, NewNode), Expansions),
    combine(Expansions, RestOfPaths, NewPaths),
    search(NewPaths, Solution).

expands([Node|Path], NewNode):-
    arc(Node, NewNode),
    \+member(NewNode, Path).
