def fib(n)

  fib_0 = 0
  fib_1 = 1
  for n in 0..(n - 1)
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end
  return fib_1
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)



# (1,2,3,4,5,6,7,8, search for 8) expects to find 8