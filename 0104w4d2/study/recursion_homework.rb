def ice_cream_shop(flavors, favorite)
  
end

ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
ice_cream_shop([], 'honey lavender')  # => returns false


__END__
def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

 p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6  1 2 3 4 5 6 # = factorial(4)
p gamma_fnc(8)  # => returns 5040   # = p factorial(7)
p "**************************"

def add_numbers(nums)
  return nil if nums.empty?
  return nums[0] if nums.length == 1
  nums[0] + add_numbers(nums[1..-1])
end

p add_numbers([1, 2, 3, 4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80, 34, 7]) # => returns -39
p add_numbers([]) # => returns nil

p "-----------------------"

def sum_to(n)
  return nil if n.negative?
  return 1 if n == 1
  n + sum_to(n - 1)
end

p sum_to(5)  # => returns 15  1 2 3 4 5
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil
