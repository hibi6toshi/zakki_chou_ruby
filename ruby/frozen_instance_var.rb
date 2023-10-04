class Test
  attr_accessor :val_a, :val_b, :cache
  def initialize(val_a, val_b)
    @val_a = val_a
    @val_b = val_b
    @cache = {}
    freeze
  end

  def total_val
    @cache[:total] ||= @val_a * @val_b
  end
end

t = Test.new(100, 5)
p t.cache[:test] = "test" # frozenであっても、その参照先はいじれる。参照先自体は変えられない=>t.cache = {}はエラー
# t.val_a = 200 # can't modify frozen Test: #<Test:0x000014e602ccdc68 @val_a=100, @val_b=5, @cache={:test=>"test"}> (FrozenError)
# t.cache = {} # `<main>': can't modify frozen Test: #<Test:0x000015106f25db60 @val_a=100, @val_b=5, @cache={:test=>"test"}> (FrozenError)
p t.total_val
p t.inspect

# "test"
# 500
# "#<Test:0x00001551b165dea8 @val_a=100, @val_b=5, @cache={:test=>\"test\", :total=>500}>"

class MyClass
  attr_accessor :ary, :id
  def initialize
    @ary = [1, 2, 3]
    @id = 42
  end
end

obj = MyClass.new
obj.freeze

begin
  obj.id = 42
rescue
  p "id は変更できません"
end
puts obj.id # 出力: 99

# 2. @aryの要素を操作（追加、変更、削除）できます
obj.ary[0] = 99
obj.ary << 4
obj.ary.delete(2)
p obj.ary # 出力: [99, 3, 4]

# 3. @aryに別の配列を格納できない

begin
  obj.ary = [5, 6, 7] 
rescue
  p "aryは変更できません"
end
p obj.ary # 出力: [99, 3, 4]