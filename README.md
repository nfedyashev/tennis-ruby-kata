# Usage:

```bash
ruby app.rb                                                                                                                      
```

# Examples:

No Deuce:

```
ruby app.rb
What's the name of Player #1?  |Player #1|

What's the name of Player #2?  |Player #2|


1. Player #1
2. Player #2
Who won the point?  1
+-----------+----+
| Player #1 | 15 |
+-----------+----+
| Player #2 | 0  |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  1
+-----------+----+
| Player #1 | 30 |
+-----------+----+
| Player #2 | 0  |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  1
+-----------+----+
| Player #1 | 40 |
+-----------+----+
| Player #2 | 0  |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  1
+-----------+----+
| Player #1 Won  |
+-----------+----+
| Player #1 | 40 |
+-----------+----+
| Player #2 | 0  |
+-----------+----+
Game is over
```

Deuce:

```
What's the name of Player #1?  |Player #1|

What's the name of Player #2?  |Player #2|


1. Player #1
2. Player #2
Who won the point?  1
+-----------+----+
| Player #1 | 15 |
+-----------+----+
| Player #2 | 0  |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  1
+-----------+----+
| Player #1 | 30 |
+-----------+----+
| Player #2 | 0  |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  1
+-----------+----+
| Player #1 | 40 |
+-----------+----+
| Player #2 | 0  |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  2
+-----------+----+
| Player #1 | 40 |
+-----------+----+
| Player #2 | 15 |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  2
+-----------+----+
| Player #1 | 40 |
+-----------+----+
| Player #2 | 30 |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  2
+-----------+----+
|     Deuce      |
+-----------+----+
| Player #1 | 40 |
+-----------+----+
| Player #2 | 40 |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  1
+------------+-----------+
| Player #1 In Advantage |
+------------+-----------+
| Player #1  | 40        |
+------------+-----------+
| Player #2  | 40        |
+------------+-----------+

1. Player #1
2. Player #2
Who won the point?  2
+-----------+----+
|     Deuce      |
+-----------+----+
| Player #1 | 40 |
+-----------+----+
| Player #2 | 40 |
+-----------+----+

1. Player #1
2. Player #2
Who won the point?  2
+------------+-----------+
| Player #2 In Advantage |
+------------+-----------+
| Player #1  | 40        |
+------------+-----------+
| Player #2  | 40        |
+------------+-----------+

1. Player #1
2. Player #2
Who won the point?  2
+-----------+----+
| Player #2 Won  |
+-----------+----+
| Player #1 | 40 |
+-----------+----+
| Player #2 | 40 |
+-----------+----+
Game is over
```

-------------

See [FAQ](FAQ.md) for some explanations of technical decisions made in that project.
