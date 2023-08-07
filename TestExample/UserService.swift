//
//  UserService.swift
//  TestExample
//
//  Created by Назар Ткаченко on 07.08.2023.
//

import Foundation

protocol UserServiceProtocol {
    func save(volume: Int)
}

class UserService {}

extension UserService: UserServiceProtocol {
    func save(volume: Int) {
        // что то происходит
    }
}
