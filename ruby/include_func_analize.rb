# Your code here!

module M
  def self.included(sub)
    sub_func_owner = sub.instance_method(:func).owner
    mod_func_owner = self.instance_method(:func).owner
    is_same_func = sub_func_owner == mod_func_owner
    p "#{sub.name}: is_same_func => #{is_same_func}"

    pr = Proc.new { "defined_in_mod_func" }
    sub.define_method(:meta_func, pr)
    # sub_func = sub.instance_method(:func)
    # mod_func = self.instance_method(:func)
    # # p sub_func
    # # p mod_func
    # p sub_func == mod_func #allways return false Because A(M)#func() === M#func()
  end
  
  def func; end;
end

class A
  include M
end

class B
  include M
  
  def func
    # override!!
    "override!!"
  end
  
  def meta_func
    "defined_in_class_func"
  end
end

class C
  def func
    # override!!
    "override!!"
  end
  
  def meta_func
    "defined_in_class_func"
  end
  
  include M
end


# class X
#     include M
# end

# A.instance_method(:func) == X.instance_method(:func) #false
# A.instance_method(:func).owner == X.instance_method(:func).owner #true

# "A: is_same_func => true"
# "B: is_same_func => true"
# "C: is_same_func => false" 後からincludeだと、違うメソッド判定される。

p A.new.meta_func
p B.new.meta_func
p C.new.meta_func
# "defined_in_mod_func"
# "defined_in_class_func"
# "defined_in_mod_func"
# ↑メタプロで作るメソッドは、先にincludeすると、クラスに定義されているもので上書き。
# 後でincludeしたものは、メタプロで新たに宣言した方が有効。（def の後に改めて定義するからだと思う。）

p A.ancestors
p B.ancestors
p C.ancestors
# [A, M, Object, Kernel, BasicObject]
# [B, M, Object, Kernel, BasicObject]
# [C, M, Object, Kernel, BasicObject]

p A.new.func
p B.new.func
p C.new.func
# nil
# "override!!"
# "override!!"
# メタプロでないものは継承チェーンに従う（当たり前）
