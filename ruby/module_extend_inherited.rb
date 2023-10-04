module A
  def inherited(sub)
     p "sub is #{sub}"
  end
end

# extend はモジュールをクラスメソッドとして取り込む。
# なので、上記のinheritedはclass Bに取り込まれると、以下のメソッドを追加する。
# class B
#     def self.inherited(sub)
#       p "sub is #{sub}"
#     end
# end

# self.inherited は、自身のサブクラスが作成された場合に実行するメソッドなので、Bを継承すると、実行されるようになる。
class B
 extend A
end

class C < B
end

class D < C
end

# "sub is C"
# "sub is D"
