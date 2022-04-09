// Q6. 一致する確率
// https://algo-method.com/tasks/864
let N = Double(readLine()!)!
let A = Dictionary(readLine()!.split(separator: " ").map { ($0, 1.0) },
                   uniquingKeysWith: +)

// それぞれの整数について、2つ選んだとき一致する確率の和を出す
var result = 0.0
for (_, value) in A {
    if value > 1 {
        result += (value / N) * ((value - 1) / (N - 1))
    }
}

print(result)
