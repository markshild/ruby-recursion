def sum_recur(array)
  return 0 if array.empty?

  to_add = array.first

  sum_recur(array[1..-1]) + to_add
end

def includes?(array, item)
  return false if array.empty?

  return true if array.first == item

  includes?(array[1..-1], item)
end

def num_occur(array, item)
  return 0 if array.empty?

  occur = num_occur(array[1..-1], item)
  occur += 1 if array.first == item
  occur
end

def add_to_twelve?(array)
  return false if array.size <= 1

  return true if array[0] + array[1] == 12

  add_to_twelve?(array[1..-1])
end

def sorted?(array)
  return [] if array.empty?
  return true if array.size == 1

  return sorted?(array[1..-1]) if array[0] <= array[1]

  false
end

def reverse(num)
  return num if num < 10

  str = num.to_s

  running_string = reverse(str[1..-1].to_i).to_s
  running_string << str[0]
  running_string.to_i
end
