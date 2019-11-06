# Exponentiation
# Write two versions of exponent that use two different recursions:
def exponentiate1(base, exponent)
  return base if exponent == 1
  return 1 if exponent == 0
  
  base * exponentiate1(base, exponent - 1)
end

def exponentiate2(base, exponent)
  return base if exponent == 1
  return 1 if exponent == 0
  if exponent.even?
   exponentiate2(base, exponent/ 2) ** 2      
  else 
   base * (exponentiate2(base, (exponent - 1) / 2) ** 2)
  end
  
end


# puts exponentiate1(5, 3)

# puts exponentiate2(5, 3)
# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution.

# Suggestion: Break the methods down into parts..

# Suggestion 2: Try walking through your code with Simple Examples.

# If the n == 256, about how many nested recursive steps will we run in the first case?

# How deep will we need to recurse for the second? Keep in mind that the first reduces the exponent by one for each recursion, while the second reduces it by half.

# In addition to testing your methods by running the code, try the following exercise:

# On paper, write out the value of each variable for every line in the code:

# Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 1.
# Write out what happens for base 2 and power 2.
# Make sure you can trace from the very beginning to the very end in these examples.

# How many examples do you need to walk through to be confident that it works?

# Deep dup
# The #dup method doesn't make a deep copy:

  def deep_dup(arr)
    new_arr = []
    if !arr.is_a?(Array)
      return arr
    else
      arr.each do |ele|
      new_arr << deep_dup(ele)
      end
    end
    new_arr
  end



  # parts =[
  #   ["car", "dog", "snail"],
  #   ["deer", "yoshi", "bowser"]
  # ]
  
  # dup1 = deep_dup(parts)


  # dup1[0][0] = "koopa"

  # p parts
  # p dup1

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When we dup an Array, it creates a new array to hold the elements, but doesn't recursively dup any arrays contained therein. So the dup method creates one new array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

  def fib_i(n)
    return [] if n == 0
    return [1] if n == 1
    return [1, 1] if n == 2
    fib = [1, 1]
    while fib.length < n
      fib << fib[-1] + fib[-2]
    end
    fib
  end

  def fib_r(n)
    return [] if n == 0
    return [1] if n == 1
    return [1, 1] if n == 2
    fib = []
    last = fib_r(n - 1)
    last_num = (last[-1] + fib_r(n - 2)[-1])
    last << last_num
  end

  # p fib_i(5)

  # p fib_r(18)

# You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

# Binary Search
# The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. If the target value is equal to the middle element's value, then the position is returned and the search is finished. If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array. This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).
def bsearch(arr, tar)
  return nil if arr.empty?
  mid = arr.length / 2 
  if arr[mid] == tar
    return mid 
  end

  left = arr[0...mid]
  right = arr[mid + 1..-1]
  if arr[mid] > tar 
    bsearch(left, tar)
  else
    result = bsearch(right, tar)
    return nil if result.nil?
    result + mid + 1
  end
  
end
# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

# Make sure that these test cases are working:

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# Merge Sort
# Implement a method merge_sort that sorts an Array:
require "byebug"
def merge_sort(arr)
  return [] if arr.length == 0
  return arr if arr.length == 1
  new_arr = []
  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]
  merge_left = merge_sort(left)
  merge_right = merge_sort(right)

  merge(merge_left, merge_right)
end

def merge(arr1, arr2)
  if arr1.length < arr2.length
    arr1, arr2 = arr2, arr1
  end
  
   result = []

   i = 0
  while i < arr1.length - 1
    if arr1[i] < arr2[i]
      result << arr1[i]
      result << arr2[i]
    else
      result << arr2[i]
      result << arr1[i]
    end
  end
  if !arr2.empty?
    result << arr2.shift
  end
  result
end
#   if !arr1.nil? && !arr2.nil?
#   while (arr1.length >= 1) && (arr2.length >= 1)
#     if arr1.first > arr2.first
#       result << arr1.shift
#     else
#       result << arr2.shift
#     end
#   end
# end
#     result << arr2.shift if arr1.empty? 
#     result << arr1.shift if arr2.empty?
#     result

 
  # [3, 4] [1, 5]
  # [1, 3, 4, 5]

  #We want to look at 1st ele from each array, we put smaller ele inside of result, at front, remove from OG array
  #We do this until arr is empty. 

# i = 0
# while i < arr1.length - 1
#   if arr1[i] < arr2[i]
#     result << arr1[i]
#     result << arr2[i]
#   else
#     result << arr2[i]
#     result << arr1[i]
#   end
# end

p merge_sort([9,6,7,2,9,3,2,4,3,2])

# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.
# Array Subsets
# Write a method subsets that will return all subsets of an array.

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.
# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]
# Make Change
# RubyQuiz: Make change.

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# Add the the single coin to the change returned by the recursive call. This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders. If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. Then go back and refactor your solution so that it only calculates and compares all of the different combinations. If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.