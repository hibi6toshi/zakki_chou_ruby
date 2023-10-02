class MyClass
  def initialize
    @instance_var = "Hello from instance!"
    @word = "Word"
  end
  
  def instance_method(&block)
    local_var = "Hello from local!"
    yield(self) # selfが必要
    block.call(self) # selfが必要
  end
end

obj = MyClass.new

obj.instance_method do |o|
  puts "#{@instance_var} + #{o.instance_variable_get(:@word)}" # インスタンス変数にブロック内でアクセス
end

# + Word
# + Word
