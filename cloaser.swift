let f = {(a: Int, b:Int) -> Int in return a + b }
print(f(1, 2))

let f2 = {}
print(f2)

let r = {return {return {return 1}}}
print(r()()())

let d = { (a:Int) -> Int in 
    print(a)
    return 5
}
print(d(100))

func cc(ff: (Int, Int)->Int) {
    print("ccc" + String(ff(10, 50)))
}
cc(ff: 
    { (a: Int, b: Int) -> Int in 
        print(a * b)
        return 1000
    }
)

cc{ (a: Int, b: Int) -> Int in 
        print(a * b)
        return 1000
    }
