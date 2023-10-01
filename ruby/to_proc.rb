# Your code here!
o = Object.new

# def o.to_proc
#      proc do |val|
#         p val
#         next false if val < 5
#         true
#     end
# end

# def to_proc
#     proc do |val|
#         next false if val < 5
#         true
#     end
# end

o.instance_eval{
  define_singleton_method :to_proc do
    proc do |val|
      next false if val < 5
      true
    end
  end
} 

class P
  def to_proc
    proc do |val|
      next false if val < 5
      true
    end
  end
end

p = P.new

a = [*1..10]

p a.filter(&o) 
p a.partition(&o)

# [5, 6, 7, 8, 9, 10]
# [[5, 6, 7, 8, 9, 10], [1, 2, 3, 4]]