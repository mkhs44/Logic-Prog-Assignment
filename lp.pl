sum-up-numbers-simple(L, N) :-        /* define function */
  sum-up-list(L, Value),              /* recursive call */
  Value is N.                         /* check if value is equal to N */

sum-up-list([], 0).                   /* declare helper function */
sum-up-list([First|Last], Value) :-
    sum-up-list(Last, SumLast),         /* pass in next value and recurse */
    Value is First + SumLast.           /* add values */
sum-up-list([First|Last], Value) :-
  \+number(First),                      /* check value is not a number */           
