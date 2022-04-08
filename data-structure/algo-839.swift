// Q5. SNS クエリ (2)
// https://algo-method.com/tasks/839
enum Operation: Int {
    case follow
    case unfollow
    case countFollowers
}

class User: Hashable {
    
    private let number: Int
    private var followers: Set<User> = []

    init(_ number: Int) {
        self.number = number
    }

    func follow(_ user: User) {
        followers.insert(user)
    }

    func unfollow(_ user: User) {
        followers.remove(user)
    }

    func countFollowers() -> Int {
        return followers.count
    }

    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.number == rhs.number
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.number)
    }
}

func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

let (N, Q) = inputIntTuple()

let users = (0..<N).map { User($0) }

for _ in (0..<Q) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    switch Operation(rawValue: input[0])! {
        case .follow:
            users[input[2]].follow(users[input[1]])
        case .unfollow:
            users[input[2]].unfollow(users[input[1]])
        case .countFollowers:
            print(users[input[1]].countFollowers())
    }
}
