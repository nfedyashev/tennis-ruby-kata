# Why Finite State machine approach was used in that project:

It abstracts domain logic of Deuce mode in one place which is much easier to comprehend and verify in one place.

# Why only 2 specs?

Because I wanted it to be as simple and short as possible. Test code comes at its own price needed to write & maintain it.
Theoretically these specs could have been written in more fancy way - with lambdas & expect().to change{ @obj.field1 }, on a lower level, for each use case but this would significantly increase the amount of test code.

# Why no specs for the command-line Highline app?

Because I ran out of time.

