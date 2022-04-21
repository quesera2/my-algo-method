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

// MARK: - 別解

let _ = readLine()
let result = Dictionary(readLine()!.split(separator: " ").map { (Int($0)!, 1) },
                        uniquingKeysWith: +)
    .reduce(into: 0) { $0 += $1.1 - 1 }
print(result)
