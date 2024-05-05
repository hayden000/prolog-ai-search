/* Question 2 - Part A */

dfs([Head|Tail],PathFound):- /* The base case for depth first search */
    arc(Head,Node), /* See if paths are connected */
    goal(Node), /* See if goal node is reached */
    append([Node],[Head|Tail],Route), /* Add to the path */
    reverse(Route,PathFound). /* We traversed the route backwards */
dfs([Head|Tail],PathFound):-
    arc(Head,Node),
    \+member(Node,Tail), /* See if there is a loop and avoid it */
    append([Node],[Head|Tail],Route),
    dfs(Route,PathFound).

/* Question 2 - Part B */

dldfs([Head|Tail],_,Solution):-
    arc(Head, Node),
    goal(Node),
    append([Node],[Head|Tail],Path),
    reverse(Path, Solution).

dldfs([Head|Tail],D,Solution):-
    arc(Head,Node),
    \+member(Node,Tail),
    append([Node],[Head|Tail],Path),
    length(Path,PathLength),
    \+PathLength>D,
    dldfs(Path,D,Solution).

/* Question 2 - Part C */

ids(Path,Minimum,Maximum,Solution):-
    Minimum=<Maximum, /* Check that it has not reached the maximum */
    (dldfs(Path,Minimum,Solution); /* Call the search */
     ids(Path,Minimum+1,Maximum,Solution)). /* Extend the search */

/* Question 2 - Part D */

idsh(Path,D,[],Result):- /* Empty at start */
    findall(Result,dldfs(Path,D,NewHistory),NewHistory),
    !, /* Stop searching */
    idsh(Path,D+1,NewHistory,Result).
idsh(Path, D, History,Solution):-
    D>=1,
    findall(NewPath,dldfs(Path,D+1,NewPath),NewHistory),
    (History == NewHistory -> member(Solution,NewHistory); /* Test if they contain same items else deepen search */
     idsh(Path, D+1, NewHistory, Solution)).
