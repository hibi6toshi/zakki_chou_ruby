module A
  def level
    "A of level"
  end

  def ab
    "A of ab"
  end
end

module C
  def level
    "C of level"
  end

  def bc
    "C of bc" 
  end
end

class B
  include A
  prepend C

  def level
    "B of level"
  end

  def ab
    "B of ab"
  end

  def bc
    "B of bc" 
  end
end

b = B.new

p b.level
# "C of level"
p b.ab
# "B of ab"
p b.bc
# "C of bc"
p b.class.ancestors
# [C, B, A, Object, Kernel, BasicObject]
