var arr = [1, 2, 3, 4, 5]

for v in arr {
    print(v)
}

arr = arr.map{$0 * 3}
print(arr)

let even = arr.filter{$00 % 2 == 0}
print(even)

let evenSum = even.reduce(0, +)
print(evenSum)


var dict = ["foo": 11, "bar": 22, "hoge": 1000]

for (k, v) in dict {
    print("key:" + k + " value:" + String(v))
}
print(dict)

let tupleDict = dict.map{ ($0.0 + "aaa", $0.1 * 2) }
print(tupleDict)

dict = dict.mapValues{$0 / 2}
print(dict)

print(dict.filter{$0.key == "hoge"})

var arr2:[String] = [String]()
arr2 += ["fuga"]
print(arr2)