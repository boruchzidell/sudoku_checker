#! /usr/bin/env ruby

def duplicate?(array)
  !(array.uniq == array)
end

def regions(matrix)
  result = []
  array_start = 0
  array_end = 2
  
  0.upto(2) do |row|
    element_start = 0
    element_end = 2
  
    0.upto(2) do |column|
  
  
      element_start.upto(element_end) do |element|
        
        result << array_start.upto(array_end).map { |array| [matrix[array][element]]}
  
      end
  
      element_start += 3
      element_end += 3
    end
  
    array_start += 3
    array_end += 3
  end

  result
end

def done_or_not(matrix)
  matrix.each do |subarray|
    return 'Try again!' if duplicate?(subarray)
  end

  matrix.transpose.each do |subarray|
    return 'Try again!' if duplicate?(subarray)
  end

  regions(matrix).each do |subarray|
  return 'Try again!' if duplicate?(subarray)
end

  'Finished!'
end




p done_or_not( [[5, 3, 4, 6, 7, 8, 9, 1, 2], 
                [6, 7, 2, 1, 9, 5, 3, 4, 8],
                [1, 9, 8, 3, 4, 2, 5, 6, 7],
                [8, 5, 9, 7, 6, 1, 4, 2, 3],
                [4, 2, 6, 8, 5, 3, 7, 9, 1],
                [7, 1, 3, 9, 2, 4, 8, 5, 6],
                [9, 6, 1, 5, 3, 7, 2, 8, 4],
                [2, 8, 7, 4, 1, 9, 6, 3, 5],
                [3, 4, 5, 2, 8, 6, 1, 7, 9]]
  ) == 'Finished!'
                                
p done_or_not([ [5, 3, 4, 6, 7, 8, 9, 1, 2], 
                [6, 7, 2, 1, 9, 0, 3, 4, 9],
                [1, 0, 0, 3, 4, 2, 5, 6, 0],
                [8, 5, 9, 7, 6, 1, 0, 2, 0],
                [4, 2, 6, 8, 5, 3, 7, 9, 1],
                [7, 1, 3, 9, 2, 4, 8, 5, 6],
                [9, 0, 1, 5, 3, 7, 2, 1, 4],
                [2, 8, 7, 4, 1, 9, 6, 3, 5],
                [3, 0, 0, 4, 8, 1, 1, 7, 9]]) == 'Try again!'
