class Superclass
  KLASS = self
  @klass = self
  def example_method
    puts self.class  # selfは呼び出したオブジェクト（インスタンスまたはサブクラス）を指す
    puts KLASS # 定数はクラスのスコープでselfしているのでSuper
    puts Superclass.instance_variable_get(:@klass)
  end
end

class Subclass < Superclass
  def example_method
    super  # スーパークラスのメソッドを呼び出す
  end
end

obj = Subclass.new
obj.example_method  # selfはobjを指す
