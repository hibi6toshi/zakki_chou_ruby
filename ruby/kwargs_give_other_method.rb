def foo(**kwargs)
  bar(**kwargs)
  baz(**kwargs)
end

def bar(bar: nil)
  p bar
end

def baz(baz: nil)
  p baz
end

# このままだと、barやbazメソッドで受けられない。
# foo(bar: "test", baz: "tset")
# Main.rb:6:in `bar': unknown keyword: :baz (ArgumentError)

# 関係ない方も、キーワードに指定する
def bar(bar: nil, baz: nil)
  bar
end

def baz(baz: nil, bar: nil)
  baz
end

# 関係ないキーワードはいっぺんに**で受ける (**otherにすればさらに渡せる)
def bar(bar: nil, **)
  bar
end

def baz(baz: nil, **)
  baz
end

foo(bar: "test", baz: "tset")