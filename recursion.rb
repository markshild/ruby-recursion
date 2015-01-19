def range(first,last)
  return [] if last < first
  range(first, last - 1) << last
end

def rec_sum(array)
  return 0 if array.empty?

  to_add = array.first

  rec_sum(array[1..-1]) + to_add
end

def iter_sum(array)
  sum = 0
  (0...array.size).each do |i|
    sum += array[i]
  end

  sum
end

def exp1(num, exp)
  return 1 if exp.zero?

  num * exp1(num, exp-1)
end

def exp2(num, exp)
  return 1 if exp.zero?
  return num if exp == 1

  if exp.even?
    val = exp2(num, exp / 2)
    val * val
  else
    val = exp2(num, (exp - 1) / 2)
    num * val * val
  end

end

class Array
  def deep_dup
    arr = []
    self.each do |el|
      if el.is_a?(Array)
        arr << el.deep_dup
      else
        arr << el
      end
    end
    arr

  end

end


def rec_fibs(n)
  return [] if n.zero?
  return [1] if n == 1
  return [1,1] if n == 2
  fib = rec_fibs(n-1)
  fib << fib[-2] + fib[-1]
end

def iter_fibs(n)
  fibs = []

  a = 1
  b = 1

  n.times do
    fibs << a
    a, b = b, a + b
  end

  fibs
end

def bsearch(array, target)
  mid = array.size / 2

  return nil if array.size == 1 && target != array[mid]

  # compare target to array[mid]
  case target <=> array[mid]
  when 1 # when target is greater
    index = bsearch(array[mid..-1], target)
    return index if index.nil?
    mid + index
  when 0 # found
    mid
  when -1 # when target is lesser
    bsearch(array[0...mid], target)
  end
end

def make_change(value, coins = [25,10,5,1])
  return [] if coins.empty?
  best = []

  coins.each do |coin|

    if value < coin
      return make_change(value, coins[1..-1])
    else
      change = make_change(value - coin, coins)
      change << coin
    end

    best = change if best.empty? || change.size < best.size
  end

  best
end


def merge(arr1,arr2)
  merged = []

  i = 0
  arr1.each do |el1|
    while i < arr2.size
      if el1 < arr2[i]
        merged << el1
        break
      else
        merged << arr2[i]
        i += 1
      end
    end

    merged << el1 if i == arr2.size
  end

  merged += arr2[i..-1] unless i == arr2.size
  merged
end


def merge_sort(array)
  return array if array.size <= 1
  #recursive split calling merge
  mid = array.size/2
  merge(
    merge_sort(array[0,mid]), merge_sort(array[mid..-1])
  )

end


def subsets(array)
  return [[]] if array.empty?

  sets = subsets(array[0...-1]).dup

  subsets(array[0...-1]).each do |sub_array|
    sub_dup = sub_array.dup
    sub_dup << array.last
    sets << sub_dup
  end

  sets
end
