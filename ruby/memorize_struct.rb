class MetaStruct
  def self.method_missing(meth, arg=nil, &block)
    block ||= proc{arg}
    define_method(meth, &block)
  end
end

class A < MetaStruct
  b
  foo 1
  bar { 3.times.map { foo } }
end

module Memomer
  def self.extended(klass)
    mod = Module.new
    klass.prepend(mod)
    klass.instance_variable_set(:@memomer_mod, mod)
  end

  # Memomerモジュールに「memoize」メソッドを用意して、「クラスにプリペンドした無名モジュールにメソッドを定義する」という処理を行います。
  # memoizeメソッドで定義するメソッドでは、値がすでにキャッシュ済みであれば、その値を返します。
  # まだキャッシュされていなければ、superを使って元のメソッドを呼び出して値を取得してから、それをキャッシュします。

  # メモ：prependしているので、継承チェーンは Memomerで作った無名モジュール > A > MetaStruct > ...
  # 優先して呼ばれるのは、無名モジュール(Memomer産)
  # そこから適時superを呼び出し、メモ用変数に格納。
  def memoize(arg)
    iv = :"@memomer_#{arg}"
    @memomer_mod.define_method(arg) do 
      if instance_variable_defined?(iv)
        return instance_variable_get(iv)
      end
      v = super()
      instance_variable_set(iv, v)
      v
    end
  end
end

class A < MetaStruct
  extend Memomer
  memoize :bar
end

a = A.new
p a.bar

A.foo 2
p A.new.bar

p a.bar

p A.ancestors
# [#<Module:0x000014aa6f28bf30>, A, MetaStruct, Object, Kernel, BasicObject]
