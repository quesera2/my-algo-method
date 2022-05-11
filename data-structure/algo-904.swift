// 葉の個数
// https://algo-method.com/tasks/904

final class Rec: CustomStringConvertible {
    let number: Int
    var parent: Rec?
    var children: [Rec] = []

    init(_ num: Int) {
        self.number = num
    }

    var description: String {
        return "\(number)"
    }

    func isLeaf() -> Bool {
        return parent != nil && children.isEmpty
    }
}

let N = Int(readLine()!)!
let T = (0..<N+1).map { Rec($0) }
let P = readLine()!.split(separator: " ").map { Int($0)! }
for (idx, v) in P.enumerated() {
    T[idx + 1].parent = T[v]
    T[v].children.append(T[idx + 1])
}

let result = T.filter { $0.isLeaf() }.count
print(result)
