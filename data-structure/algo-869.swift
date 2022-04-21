// アナグラムになる確率
// https://algo-method.com/tasks/869

func hashValue(_ str: String) -> Int {
    return str.unicodeScalars.sorted().hashValue
}

let N = Double(readLine()!)!
let S = readLine()!.split(separator: " ").map { String($0) }

let hashesDictionary = Dictionary(S.map { (hashValue($0), 1) }, uniquingKeysWith: +)

let result = hashesDictionary
    .filter { (k, v) in v != 1 }
    .reduce(into: 0.0) { (r, e) in
    let (_, value) = e
    r += (Double(value) / N) * ((Double(value - 1)) / (N - 1))
}

print(result)
