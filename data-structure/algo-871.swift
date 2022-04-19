// SNSクエリ（３）
// https://algo-method.com/tasks/871

final class User {
    var followers: Set<User> = []

    init() {}

    func followed(_ user: User) {
        followers.insert(user)
    }

    func unfollowed(_ user: User) {
        followers.remove(user)
    }

    func isSameFollowers(_ user: User) -> Bool {
        if user == self {
            return false
        }
        return followers == user.followers
    }
}

extension User: Equatable {
    public static func ==(lhs: User, rhs: User) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension User: Hashable {
    var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
}

enum Query: Int {
    case follow = 0
    case unfollow = 1
    case countSameFollowers = 2
}

func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

func inputIntArray() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

let (N, Q) = inputIntTuple()

let users = (0..<N).map { _ in User() }

for _ in (0..<Q) {
    let input = inputIntArray()
    switch Query(rawValue: input[0])! {
        case .follow:
            users[input[2]].followed(users[input[1]])
        case .unfollow:
            users[input[2]].unfollowed(users[input[1]])
        case .countSameFollowers:
            let target = users[input[1]]
            var result = 0
            for user in users {
                if user.isSameFollowers(target) {
                    result += 1
                }
            }
            print(result)
    }
}
