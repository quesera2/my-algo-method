// 兄弟は誰だ？(1)
// https://algo-method.com/tasks/894
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
}

let N = Int(readLine()!)!
let T = (0..<N).map { Rec($0) }
let P = readLine()!.split(separator: " ").map { Int($0)! }
for (idx, v) in P.enumerated() {
    T[idx + 1].parent = T[v]
    T[v].children.append(T[idx + 1])
}

let Q = Int(readLine()!)!
for _ in 0..<Q {
    let q = Int(readLine()!)!
    if let parent = T[q].parent {
        print(parent.children.map { "\($0.number)" }.joined(separator: " "))
    }
}
