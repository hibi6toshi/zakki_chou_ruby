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
