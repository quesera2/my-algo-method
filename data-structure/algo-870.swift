// ハッシュの衝突
// https://algo-method.com/tasks/870
let B = 30
let M = 1000003

// ローリングハッシュを作成
func hashValue(_ str: String) -> Int {
    var hash: Int = 0
    var digit: Int = 1
    for scalar in str.unicodeScalars.reversed() {
        hash += (Int(scalar.value) - 96) * digit
        hash %= M
        digit *= B
    }
    return hash % M
}

let N = Int(readLine()!)
let S = readLine()!.split(separator: " ").map { String($0) }

var counter = Array(repeating: 0, count: M + 1)
for s in S {
    counter[hashValue(s)] += 1
}

var result = 0
for c in counter {
    result = max(result, c)
}
print(result)
