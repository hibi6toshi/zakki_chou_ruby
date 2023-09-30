def block_args_test
  yield()
  yield(1)
  yield(1, 2, 3)
end

puts "ブロック変数を|a|で受け取る"
block_args_test do |a|
  p [a]
end
puts

puts "ブロック変数を|a, b, c|で受け取る"
block_args_test do |a, b, c|
  p [a, b, c]
end
puts

puts "ブロック変数を|*a|で受け取る"
block_args_test do |*a|
  p [a]
end
puts

# ブロック変数を|a|で受け取る
# [nil]
# [1]
# [1]

# ブロック変数を|a, b, c|で受け取る
# [nil, nil, nil]
# [1, nil, nil]
# [1, 2, 3]

# ブロック変数を|*a|で受け取る
# [[]]
# [[1]]
# [[1, 2, 3]]


# lock_args_test do |a| の場合、
# yield(1, 2, 3)　は
# [1]なのに注意
