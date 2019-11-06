def fib(num)
  return 1 if num == 1 || num == 2
  fib(num - 1) + fib(num - 2)
end


p fib(1) # => 1
p fib(2) # => 1
p fib(3) # => 2
p fib(4) # => 3
p fib(5) # => 5
p fib(6) # => 8
p fib(7) # => 13