# bfuck

a pretty small brainfuck

i thought the way standard brainfuck handles loops was inefficient

so intead of handling jump logic on a `[` it's handled on a `]`


this doesn't properly clean the stack so you could probably do some weird stuff
by doing an unmatched `]` after a loop exits

```ruby
# changing line 25 to this would partially fix that
i = c == "]" ? ((mem[ptr] == 0 && loop_stack.pop && i) || loop_stack.pop - 1) : i
```

but i liked the way it looked so it doesn't really matter
