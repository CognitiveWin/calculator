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

Observations:
- Display II shows a placeholder when the triplet of information is incomplete.
- (12) shows that multiple operators in a row overwrite the previous.
- (14, 15) shows that multiple operands in a row are concatenated.
= The '=' operator executes the calculation.

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

*Note: for the purposes of this challenge I'm going to use / insted of ÷.*

The flow that pops out here is:
1. User inputs as Infix
2. Calculaton transforms to Postfix
3. Postfix calculated
4. Displayed

A quick search reveals an algorithm that can be used to transform Infix to Postfix is known as Shunting Yard.

## Development

### Shunting Yard

The (Shunting Yard)[https://en.wikipedia.org/wiki/Shunting-yard_algorithm] algorithm is old-school. It was developed by (Edsger Dijkstra])[https://en.wikipedia.org/wiki/Edsger_Dijkstra] around 1961.

The algorithm uses a stack and a queue for managing tokens, the elements of the infix input. As an input is read it is pushed onto the output queue (if a number) or the operator queue (if an operator). If an operator has a higher precedence than the top most operator then each operator is popped and pushed onto the output queue. When the operator stack is empty, the new operator is pushed onto it.

This introduces a few interesting concepts that we will need to model:
- operator precedents; (x, /) > (+, -)
- stacks; first in last out (FILO)
- queues; first in first out (FIFO)

Taking our 6x5+3/2-6 example:

Input 6: Output.push(6)

| Operator | Output |
| -------- | ------ |
|          |      6 |

Input x: Operator.push(x)

| Operator | Output |
| -------- | ------ |
|        x |      6 |

Input 5: Output.push(5)

| Operator | Output |
| -------- | ------ |
|          |      5 |
|        x |      6 |

Input +: precedent(+) < precedent(x), Operator.pop(x), Output.push(x), Operator.push(+)

| Operator | Output |
| -------- | ------ |
|          |      x |
|          |      5 |
|        + |      6 |

Input 3: Ouput.push(3)

| Operator | Output |
| -------- | ------ |
|          |      3 |
|          |      x |
|          |      5 |
|        + |      6 |

Input /: Operator.push(/)

| Operator | Output |
| -------- | ------ |
|          |      3 |
|          |      x |
|        / |      5 |
|        + |      6 |

Input 2: Output.push(2)

| Operator | Output |
| -------- | ------ |
|          |      2 |
|          |      3 |
|          |      x |
|        / |      5 |
|        + |      6 |

Input -: precedent(-) < precedent(/), Output.push(/), Output.push(+)

| Operator | Output |
| -------- | ------ |
|          |      + |
|          |      / |
|          |      2 |
|          |      3 |
|          |      x |
|          |      5 |
|        - |      6 |

Input 6:  Output.push(6)

| Operator | Output |
| -------- | ------ | 
|          |      6 | 
|          |      / | 
|          |      2 | 
|          |      3 | 
|          |      x | 
|          |      5 | 
|        - |      6 | 

End: Output.push(-)

| Operator | Output |
| -------- | ------ |
|          |      - |
|          |      6 |
|          |      / |
|          |      2 |
|          |      3 |
|          |      x |
|          |      5 |
|          |      6 |

### Postfix Evaluation

See [Postfix expression evaluation](https://en.wikipedia.org/wiki/Reverse_Polish_notation#Postfix_evaluation_algorithm) for more details.

Postfix expressions are evaluated two operands and one operator at a time, which sees the postfix expression reduce as it is each triplet is evaluated.

Taking the postfix expression, `6 5 x 3 2 / + 6 - ` and working through an example.

Token 6: Output.push(6)

| Output |
| ------ |
|      6 |

Token 5: Output.push(5)

| Output |
| ------ |
|      6 |
|      5 |

Token x: x As this is an operand, we pop two tokens from the stack and multiply them. Output.push(6 x 5)

| Output |
| ------ |
|     30 |

Token 3: Output.push(3)

| Output |
| ------ |
|     30 |
|      3 |

Token 2: Output.push(2)

| Output |
| ------ |
|     30 |
|      3 |
|      2 |

Token /: Operand, so pop two and push the result, Output.pop(3), Output.pop(2), Output.push(3/2)

| Output |
| ------ |
|     30 |
|    1.5 |

Token +: Operand, so pop two and push the result, Output.pop(1.5), Output.pop(30), Output.push(1.5 + 30)

| Output |
| ------ |
|     30 |
|    1.5 |

Token 6: Output.push(6)

| Output |
| ------ |
|   31.5 |
|      6 |

Token -: Operand, so Output.pop(6), Output.pop(31.5), Output.push(31.5-6)

| Output |
| ------ |
|   25.5 |

And it's evaluated.

### Unit Testing

I'm opting to use [The Art of Unit Testing](http://osherove.com/blog/2005/4/3/naming-standards-for-unit-tests.html) for naming standards.

For example, each test name follows the pattern *UnitOfWork_StateUnderTest_ExpectedBehavior*.

