MyAppClass = Class.new do
  class << self
    def define_classes(class_names)
      class_names.each do |class_name|
        new_class = Class.new do
          define_method(:initialize) do |*args|
            # 初期化メソッド
            puts "Initializing #{class_name} with args: #{args}"
          end

          define_method(:say_hello) do
            # クラス固有のメソッド
            puts "#{class_name} says hello!"
          end
        end

        # クラスを名前空間内に定義
        const_set(class_name, new_class)
      end
    end
  end
end

# MyAppClassクラスを使用してクラスを定義
MyAppClass.define_classes(["Person", "Car", "Animal"])

# 生成したクラスを使ってインスタンスを作成
person = MyAppClass::Person.new("Alice")
car = MyAppClass::Car.new("Tesla")
animal = MyAppClass::Animal.new("Dog")

# メソッドを呼び出し
person.say_hello # 出力: Person says hello!
car.say_hello    # 出力: Car says hello!
animal.say_hello # 出力: Animal says hello!
