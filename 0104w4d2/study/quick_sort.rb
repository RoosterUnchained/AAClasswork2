


#5
def quick_sort(arr)
  return arr if arr.length = 1
  pvt = arr.first
  lft = arr.select { |ele| ele < pvt }
  rit = arr.select { |ele| ele >= pvt }
  quick_sort(lft) + pvt + quick_sort(rit)
end
  p arr = [5, 6,7 , 8, 3, 5, 2]
  p quick_sort(arr)




def quick_sort(arr)
  return arr if arr.length <= 1
  pivot_arr = [arr.first]
  left_side = arr[1..-1].select { |el| el < arr.first }
  right_side = arr[1..-1].select { |el| el >= arr.first }
  quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end


