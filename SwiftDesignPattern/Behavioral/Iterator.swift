//
//  Iterator.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

protocol FriendIterator {
    func next() -> Friend?
    func hasNext() -> Bool
}

protocol FriendCollection {
    func createIterator() -> FriendIterator
}

struct Friend {
    let name: String
    let profileId: String
}

class FriendListIterator: FriendIterator {
    private var friends: [Friend]
    private var currentIndex = 0
    
    init(friends: [Friend]) {
        self.friends = friends
    }
    
    func next() -> Friend? {
        guard hasNext() else { return nil }
        let friend = friends[currentIndex]
        currentIndex += 1
        return friend
    }
    
    func hasNext() -> Bool {
        return currentIndex < friends.count
    }
}

class FriendsList: FriendCollection {
    private var friends: [Friend] = []

    func addFriend(_ friend: Friend) {
        friends.append(friend)
    }
    
    func createIterator() -> any FriendIterator {
        return FriendListIterator(friends: friends)
    }
}
