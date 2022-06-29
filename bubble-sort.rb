def bubble_sort(array)
  original_array = array.clone  #sorting_pass is destructive, so we clone the original array object to keep a reference to the original.
  partially_sorted_array = sorting_pass(array)
  return partially_sorted_array if sorted?(original_array, partially_sorted_array) == true  #This checks if the array is already sorted from the start by checking if there's any difference between the sorted array and the original one.
  stored_values = []
  stored_values.push(partially_sorted_array.last)
  partially_sorted_array.pop  #This command and the previous two are for optimization purposes. Since we know the last value in each iteration will be sorted, there no point in iterating on it, so it's taken out of the array-to-be-sorted and saved for the final return. 
  (array.length - 1).times do
    comparison_array = partially_sorted_array.clone
    partially_sorted_array = sorting_pass(partially_sorted_array)
    return partially_sorted_array.push(stored_values).flatten if sorted?(comparison_array, partially_sorted_array) == true
    stored_values.unshift(partially_sorted_array.last)
    partially_sorted_array.pop
  end
  partially_sorted_array.push(stored_values).flatten
end

def sorting_pass(array)
  i = 0
  array.each do |item|
    if i == array.length - 1
      return array
    elsif item > array[i + 1]
      x = array[i]
      array[i] = array[i + 1]
      array[i + 1] = x
      i += 1
    else i += 1
    end
  end
end

def sorted?(input_array, sorted_array)
  return true if input_array == sorted_array
  return false
end

bubble_sort([4,3,78,2,0,2])