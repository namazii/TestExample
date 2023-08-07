//
//  SoundBar.swift
//  TestExample
//
//  Created by Назар Ткаченко on 06.08.2023.
//

import Foundation

protocol SoundBarProtocol {
    func setVolume(to value: Int)
    func fetchData(completion: @escaping() -> Void)
}

class SoundBar {
    
    var userService: UserServiceProtocol?
    
    private(set) var volume = 0
}

extension SoundBar: SoundBarProtocol {
    
    func setVolume(to value: Int) {
        volume = min(max(value, 0), 100)
    }
    
    func fetchData(completion: @escaping() -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: DispatchWorkItem {
           completion()
        })
    }
}
