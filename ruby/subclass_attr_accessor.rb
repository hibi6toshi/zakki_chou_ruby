class Parent
  attr_accessor :name
  def initialize
    # p "Parent_init"
    @name = "Name"
  end
end

p_obj = Parent.new
p p_obj.instance_variable_get(:@name)

class Child < Parent
  attr_accessor :body
  def initialize
    # super
    @body = "Body"
  end
end

p_obj = Parent.new
# p p_obj.instance_variable_get(:@name)
p p_obj.name rescue nil

c_obj = Child.new
p c_obj.name # superを呼ばないとnil ただし、アクセサは持っている 
p c_obj.instance_variable_defined?(:@name) # falseなので、defineされていない。　ただし、アクセサは持っている。
