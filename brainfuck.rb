def dump(note, tape, i, ptr, mem)
  puts "||#{note}||\nc: #{tape[i]}\ni: #{i}\nptr: #{ptr}\nmem[#{ptr}]: #{mem[ptr]}"
end

def exc(prog)
  loop_stack = []
  tape       = prog.chomp.split('')
  mem        = [0]
  ptr        = 0
  i          = -1
  while ((i += 1) < tape.length) do
    c = tape[i]

    #dump("START", tape, i, ptr, mem)

    mem[ptr] = 0               if mem[ptr] == nil
    ptr += 1                   if c == ">"
    ptr -= 1                   if (c == "<" && ptr > 0)
    mem[ptr] += 1              if c == "+"
    mem[ptr] -= 1              if (c == "-" && mem[ptr] > 0)
    puts(mem[ptr].chr)         if c == "."
    mem[ptr] = gets()          if c == ","
    p mem                      if c == "?"
    loop_stack << i            if c == "["
    i = ((loop_stack.pop) - 1) if (c == "]" && mem[ptr] != 0)

    #dump("END", tape, i, ptr, mem)

  end
end

#exc(gets())
exc IO.read(gets())

