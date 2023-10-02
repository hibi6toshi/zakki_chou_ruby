def test(val, *args, **kwargs)
    p "#{val} #{kwargs}"
end

val = "val_value"
test(val, key: "key", name: "name")
# "val_value {:key=>\"key\", :name=>\"name\"}"

test(val, {key: "key", name: "name"})
# "val_value {}"　# treat as *args

test(val, **{key: "key", name: "name", val: })
# "val_value {:key=>\"key\", :name=>\"name\", :val=>\"val_value\"}"

test(val, **{key: "key", name: "name", val: val})
# "val_value {:key=>\"key\", :name=>\"name\", :val=>\"val_value\"}"

test({val: "var"}, **{key: "key", name: "name", val: val})
# "{:val=>\"var\"} {:key=>\"key\", :name=>\"name\", :val=>\"val_value\"}"

val = "test"
p hash = { val: }
# {:val=>"test"}
