class Array

  def my_each(&prc)
    i=0
    while i < self.size
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_map(&prc)
    arr = []
    self.my_each {|el| arr << prc.call(el)}
    arr
  end


  def my_select(&prc)
    arr = []
    self.my_each {|el| arr << el if prc.call(el)}
    arr
  end

  def my_inject(&prc)
    acc = self.first
    self[1..-1].my_each { |el| acc = prc.call(acc,el) }
    acc
  end

  def my_sort!(&prc)
    n = self.size

    begin
      swapped = false
      1.upto(n - 1) do |i|
        if prc.call(self[i-1], self[i]) == 1
          self[i-1], self[i] = self[i], self[i-1]
          swapped = true
        end
      end
    end while swapped # repeats if something is swapped

    self
  end

  def my_sort(&prc)
    my_dup = self.dup
    my_dup.my_sort!(&prc)
  end

end

def eval_block(*args, &prc)
  return "NO BLOCK GIVEN" unless block_given?

  prc.call(*args)

end
