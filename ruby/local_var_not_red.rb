x = 10

if false
  y = 5
  if false
    z = 1 
  end
  
  a1 = Math.rand
end

puts x, y.nil?, z.nil?, a1.nil?
#  => 10, true, true, true

# 宣言は、例え実行されなくても宣言とみなされます。
# https://taiyo.hatenadiary.org/entry/20130419/p1
