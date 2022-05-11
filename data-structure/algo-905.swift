// 行きがけ順
// https://algo-method.com/tasks/905

let N = Int(readLine()!)!
var box: [[Int]] = Array(repeating: [], count: N)
readLine()!.split(separator: " ")
           .map { Int($0)! }
           .enumerated()
           .forEach { (index, a) in
               box[a].append(index + 1)
           }

func rec(_ v: Int) {
    print(v, terminator: " ")
    for v2 in box[v].sorted() {
        rec(v2)
    }
}

rec(0)
print()
