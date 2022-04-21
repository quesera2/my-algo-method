// distinct にせよ
// https://algo-method.com/submissions/399732

let _ = readLine()
let A = readLine()!.split(separator: " ").map { Int($0)! }

// Setで解いているものの、まず[Int:Int]に値を加算して、最後に-1したものをreduceした方が高速
var distinct = Set<Int>()
var result = 0
for a in A {
    if distinct.contains(a) {
        result += 1
    } else {
        distinct.insert(a)
    }
}

print(result)
