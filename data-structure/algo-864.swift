// Q6. 一致する確率
// https://algo-method.com/tasks/864
let N = Double(readLine()!)!
// 重複する数を辞書から得る
let A = Dictionary(readLine()!.split(separator: " ").map { ($0, 1.0) },
                   uniquingKeysWith: +)
// それぞれの数について2つ選んだとき一致する確率を算出して合算する
let result = A.values
              .filter { $0 > 1 }
              .map { ($0 / N) * (($0 - 1) / (N - 1)) }
              .reduce(0.0, +)

print(result)
