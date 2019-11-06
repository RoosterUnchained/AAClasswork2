def count_down(num)
  if num == 0 #= base case
    p 'lift off!'
    return
  end
  p num
  count_down(num - 1) #= recursive step
end

count_down(5)

