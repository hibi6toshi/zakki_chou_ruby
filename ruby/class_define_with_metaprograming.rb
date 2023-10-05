def_class = -> (sym, method_hash) do
  c = Object.const_set(sym, Class.new)
  method_hash.each do |meth, block|
    c.define_method(meth, block)
  end
end

pr = Proc.new { |i| i * 2  }
def_class.call(:A, b: pr)

p A.new.b(2)
# 4
