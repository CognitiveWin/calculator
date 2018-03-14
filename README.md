# calculator

A little while ago I was asked to write some code for an interview. I was short on time then, but the idea was sufficiently interesting that I wanted to pursue.

And given I've never had much in the way of viewable code, it feels like a convenient opportunity to create some.

Here goes.

## Requirements

Inputs:

‘0’, ‘1’, ‘2’, ‘3’, ‘4’, ‘5’, ‘6’, ‘7’, ‘8’, ‘9’, ‘+', ‘-’, ‘x’, ‘÷’, ‘=’, ‘C’

### Outputs:

1. Display I showing input and calculated result. (Maximum of 10 digits.)
2. Display II showing alternative input and calculated result. (Maximum of 10 digits.)

### Behaviour:

| Step  | Key  | Display I         | Display II        |
| ----- | ---- | ----------------- | ----------------- |
| 1     |      | Ready             | Ready             |
| 2     | 6    | 6                 | 6                 |
| 3     | x    | 6x                | 6 ? x             |
| 4     | 5    | 6x5               | 6 5 x             |
| 5     | +    | 6x5+              | 6 5 x ? +         |
| 6     | 3    | 6x5+3             | 6 5 x 3 +         |
| 7     | ÷    | 6x5+3÷            | 6 5 x 3 ? ÷+      |
| 8     | 2    | 6x5+3÷2           | 6 5 x 3 2 ÷+      |
| 9     | -    | 6x5+3÷2-          | 6 5 x 3 2 ÷ + ? - |
| 10    | 6    | 6x5+3÷2-6         | 6 5 x 3 2 ÷ + 6 - |
| 11    | =    | 25.5              | 25.5              |
| 12    | +    | 25.5+             | 25.5 ? +          |
| 13    | -    | 25.5-             | 25.5 ? -          |
| 14    | 3    | 25.5-4            | 25.5 4 -          |
| 15    | 0    | 25.5-40           | 25.5 40 -         |
| 16    | =    | -14.5             | -14.5             |

Note: one of the key inputs has been changed to protect the ~innocent~ interviews.

## Journey

- [ ] Setup project 
- [ ] Work out what I'm doing
- [ ] Make unit tests from the steps
- [ ] Get coding

### Setup project

Just added a basic Xcode project with unit tests and UI tests.

### Work out what I'm doing

I did a little bit of searching to discover that Display II is displaying postfix notation. This is when the operator follows a pair of operands. Summarising [Wiki](https://en.wikipedia.org/wiki/Reverse_Polish_notation): Display I is simply the input

- operands follow operators
- multiple operations follow the second operand
- parantheses are not required

This last bit is interesting. Take, for example, the test case in step 10 before the equality.

6x5+3÷2-6

This can be calculated in various ways:

- Postfix: ((6x5)+(3/2)) - 6 = (30 + 1.5) -6 = 25.5
- Infix: (((6*5)+3)/2)-6 = ((30+3)/2)-6 = (33/2)-6 = ((33)/2)-6 = 16.5-6 = 10.6

What we can tell from this, is the interview challenge is expecting a postfix approach to calculation. Which is a shame, because otherwise I could have used NSExpressions to do some of this work.

The scenarios, best described by (Tutorials Point)[https://www.tutorialspoint.com/data_structures_algorithms/expression_parsing.htm] are:

| Type | Infix             | Postfix           |
| ---- | ----------------- | ----------------- |
| 1    | a + b             | a b +             |
| 2    | (a + b) x c       | a b + c x         |
| 3    | a x (b + c)       | a b c + x         |
| 4    | a / b + c / d     | a b / c d / +     |
| 5    | (a + b) x (c + d) | a b + c d + x     |
| 6    | ((a + b) x c) - d | a b + c x d -     |

I'm trying hard to read ahead too much, and I lack a true compsci background, this feels like a stack problem.

The challenge doesn't really deal with parentheses (yay!) so we're mainly interested, for now, in type 1 and 4.

Time for some TDD, I think.

## Unit Testing

I'm opting to use [The Art of Unit Testing](http://osherove.com/blog/2005/4/3/naming-standards-for-unit-tests.html) for naming standards.

For example, each test name follows the pattern *UnitOfWork_StateUnderTest_ExpectedBehavior*.

