// 文字列の種類数
// https://algo-method.com/tasks/879

let _ = readLine()
// Setを使う場合、O(NlogN)となり、Dictionaryより遅いらしい
let s = Set(readLine()!.split(separator: " "))
print(s.count)
