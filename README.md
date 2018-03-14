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

| Step        | Key         | Display I   | Display II       |
| ----------- | ----------- | ----------- | ---------------- |
| 1           |             | Ready       | Ready            |
| 2           | 6           | 6           | 6                |
| 3           | x           | 6x          | 6? x             |
| 4           | 5           | 6x5.        | 65 x.            |
| 5           | +           | 6x5+        | 65 x ? +         |
| 6           | 3           | 6x5+3       | 65 x 3 +         |
| 7           | ÷           | 6x5+3÷      | 6 5 x 3 ? ÷+     |
| 8           | 2           | 6x5+3÷2     | 6 5 x 3 2 ÷+     |
| 9           | -           | 6x5+3÷2-    | 6 5 x 3 2 ÷ +? - |
| 10          | 6           | 6x5+3÷2-6   | 6 5 x 3 2 ÷ +6 - |
| 11          | =           | 25.5        | 25.5             |
| 12          | +           | 25.5+       | 25.5 ? +         |
| 13          | -           | 25.5-       | 25.5 ? -         |
| 14          | 3           | 25.5-3      | 25.5 3 -         |
| 15          | 0           | 25.5-30     | 25.5 30 -        |
| 16          | =           | -4.5        | -4.5             |

## Journey

- [ ] Setup project 
- [ ] Work out what I'm doing
- [ ] Make unit tests from the steps
- [ ] Get coding
