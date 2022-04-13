// 倍数クエリ
// https://algo-method.com/tasks/865

let N = Int(readLine()!)!
// 整数Aに含まれる数をマッピング
let A = Dictionary(readLine()!.split(separator: " ").map { (Int($0)!, 1) },
                   uniquingKeysWith: +)

let amax = 500_000 + 1
var cache: [Int:Int] = [:]

// 入力Aの列にvの倍数がいくつあるか求める
func computeMultiple(_ v: Int) -> Int {
    var result = 0
    // ここでvを倍々にして求めること。AをループするとO(|A|^2)となりTLEする
    for i in stride(from: v, through: amax, by: v) {
　　    result += A[i, default: 0]
    }
    return result
}

// すべての数に対して倍数を計算する
// N/1 + N/2 + N/3 + ... + N/N 回の計算を行うので、計算量はlogNで収まり間に合う
for i in (1..<amax) {
    cache[i] = computeMultiple(i)
}

let Q = Int(readLine()!)!
for _ in (0..<Q) {
    let x = Int(readLine()!)!
    print(cache[x]!)
}
