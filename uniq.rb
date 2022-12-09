def get_unique_array(arr)
   uniq_elem = []
  arr.each_with_index  do |elem, index|
      arr.each_with_index do |sub_elem, sub_index|
      if elem == sub_elem and index < sub_index
        arr.delete_at(sub_index)
        end
      end
  end
   arr
end

arr = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6, 6]

puts get_unique_array(arr)