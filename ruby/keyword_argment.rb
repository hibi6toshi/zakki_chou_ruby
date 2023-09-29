def test(key: "key")
  p key
end

test() # "key"
test(key: "test_str") # "test_str"
h = {key: "hash"}
# test(h) :`test': wrong number of arguments (given 1, expected 0) (ArgumentError)
test(**h) # "hash"

test(key: word="word_str") # "word_str"

def test2(key: (def_key = "key"))
  p "key is #{key}"
  p "def_key is #{def_key}"
end

test2()
# "key is key"
# "def_key is key"

test2(key: "given_key")
# "key is given_key"
# "def_key is "
# memo: def_key.nil? => true
