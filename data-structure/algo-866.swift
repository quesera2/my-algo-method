// ハッシュ
// https://algo-method.com/tasks/866

// ascii文字列を数値にするハッシュ関数
func hashValue(_ str: String) -> Int {
    var hash: Int = 0
    var digit: Int = 1
    for scalar in str.unicodeScalars {
        hash += (Int(scalar.value) - 96) * digit
        digit *= 30
    }
    return hash
}

let N = Int(readLine()!)!
let S = Dictionary(readLine()!.split(separator: " ").map { (hashValue(String($0)), 1) },
                   uniquingKeysWith: +)
let Q = Int(readLine()!)!

for _ in (0..<Q) {
    guard 
        let T = readLine(),
        let result = S[hashValue(T)]
    else {
        print(0)
        continue
    }
    print(result)
}
