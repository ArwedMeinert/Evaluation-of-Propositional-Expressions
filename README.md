# Evaluation-of-Propositional-Expressions
---
In the course "MatLab II" we were given a practical project at the end of the semester. I got to program a MatLab/Octave program to evaluate logical expressions in the form of 

~A|B<->B#A

The [program](https://github.com/ArwedMeinert/Evaluation-of-Propositional-Expressions/blob/main/Programme/HauptprogrammAussagenlogik.m) can evaluate an expression in the form given above and generate the truth-table. The program can also evaluate propositional expressions given in a "real language" (German) such as: 

"Arbeit impliziert Geld oder Essen" (eng: "Work implies money or food")

To evaluate the expression above, it first converts it to the short form.

A->GvE

and after that generates the truth Table.


As an example, the Expression "B or not S implies B and S or W" would be in the short Form:

b|~s->b&s|w

would create the Truth-Table: 
| B | S | W | Solution|
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 1 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 |

The Table above shows the state of the variables B, S, W and if the expression in itself is true with the given truth values. In this case, the expression is true, when B and S are false, and W is true and so on. The program can evaluate expressions with up to 24 individual variables. If the expression is given in the short form, the program can also evaluate brackets correctly (eg. (b|~s)->((b&s)|w)).
