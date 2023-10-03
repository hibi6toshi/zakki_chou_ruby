def foo(*args, **kwargs)
  p [args, kwargs]
 end
 
# Keywords treated as keywords, good!
foo(bar: 1)
# => [[], {:bar=>1}]

# Hash treated as keywords, bad!
foo({bar: 1})
# => [[], {:bar=>1}]

def print_info(a, name:, age:)
  puts "Name: #{name}, Age: #{age} : #{a}"
end

info = { name: "John", age: 30 }

print_info("test", **info)
# Name: John, Age: 30 : test

def foo(bar, **nil)
  p "#{bar} : "
end

# これは「キーワード変数を受け付けない」ことを表しています。こうしておけば、キーワードを後から追加しても呼び出し側が壊れることはなくなります。

# foo({bar: 1}, **{bar2: 2, bar3: 3})
# ArgumentError (no keywords accepted)
