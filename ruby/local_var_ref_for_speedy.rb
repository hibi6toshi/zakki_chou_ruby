require 'benchmark'

result1= Benchmark.realtime do
  large_array = [0] * (10**4)
  
  num_arrays = 0
  large_array.each do |value|
    if value.is_a?(Array)
      num_arrays += 1
    end
  end
end
puts "処理１ #{result1}s"

result2= Benchmark.realtime do
  large_array = [0] * (10**4)
  
  num_arrays = 0
  array_class = Array
  large_array.each do |value|
    if value.is_a?(array_class)
      num_arrays += 1
    end
  end
end
puts "処理2 #{result2}s"

# Arrayは毎回参照を探しにいく。
# ローカル変数は探しにいかないので、少し早くなる。
