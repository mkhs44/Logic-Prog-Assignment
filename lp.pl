/* Question 1 */
sum-up-numbers-simple(L, N) :-          /* define sum simple function */
  sum-up-list(L, Value),                /* recursive call */
  Value is N.                           /* check if value is equal to N */

sum-up-list([], 0).                     /* if list is empty, return 0 */
sum-up-list([First|Last], Value) :-     /* declare helper function */
    number(First),                      /* check if value is a number */
    sum-up-list(Last, SumLast),         /* pass in next value and recurse */
    Value is First + SumLast.           /* add values */
sum-up-list([First|Last], Value) :-
  \+number(First),                      /* check if value is not a number */
  sum-up-list(Last, Value).             /* if value is not a number, emit */

/* Question 2 */
sum-up-numbers-general(L, N) :-         /* define sum general function */
  [First|Last] = L,                     /* assign new list */
  sum-up-list-gen(L, Value).            /* recursive call */

sum-up-list-gen([], 0).                 /* if list is empty, return 0 */
sum-up-list-gen([[]], 0).               /* if nested list is empty, return 0 */
sum-up-list-gen([First|Last], Value) :- /* declare helper function */
  number(First),                        /* check if value is a number */
  sum-up-list-gen(Last, SumLast),       /* pass in next value and recurse */
  Value is First + SumLast.             /* add values */
sum-up-list-gen([First|Last], Value) :-
  atom(First),                          /* check if value is a list */
  sum-up-list-gen(Last, Value).         /* if value is a list, recurse */
sum-up-list-gen([First|Last], Value) :-
  sum-up-list-gen(Last, SumLast),       /* pass in next value and recurse */
  Value is First + SumLast.             /* add nested values */

  /* Question 4 */
common-unique-elements([],_,[]).                                  /* take two list as parameters, checks if they are the same */
common-unique-elements([First|Last], ListTwo, [First|Value]) :-   /* declare function */
  member(ListTwo, First),                                         /* check if value is a member of list */
  common-unique-elements(Last, ListTwo, Value).                   /* recurse with new list */
