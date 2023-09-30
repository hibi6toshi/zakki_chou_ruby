class SomeClass
  def *(args)
      p "args is #{args}"
  end
  
  def test
      p "test func"
  end
end

meth = SomeClass.new
meth * "word" # "args is word"

# メソッド名*で作るとき、@はいらない