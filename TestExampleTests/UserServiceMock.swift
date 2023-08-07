//
//  UserServiceMock.swift
//  TestExample
//
//  Created by Назар Ткаченко on 07.08.2023.
//

@testable import TestExample

final class UserServiceMock: UserServiceProtocol {
    
    var saveWasCalled = 0 //SPY
    func save(volume: Int) {
        saveWasCalled = 1
    }
}
