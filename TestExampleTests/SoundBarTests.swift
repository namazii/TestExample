//
//  SoundBarTests.swift
//  SoundBarTests
//
//  Created by Назар Ткаченко on 06.08.2023.
//

import XCTest
@testable import TestExample // Импортируем свой таргет

final class SoundBarTests: XCTestCase {

    var userService: UserServiceMock!
    var items: [String]!
    var sut: SoundBar!
    //sut -> system under test -> тестируемая система
    
    override func setUp() {
        // Вызывается перед вызовом каждого тестового метода в классе
        // Инициализируем экземпляра того класса функции которого мы хотим протестировать
        
        super.setUp() // Вызываем в начале
        
        userService = UserServiceMock()
        items = []
        sut = SoundBar()
        sut.userService = userService
    }

    override func tearDown() {
        // Вызывается после вызова каждого тестового метода в классе
        // После завершения тестов мы выгружаем объекты из памяти с помощью tearDown
        
        userService = nil
        items = nil
        sut = nil
        
        super.tearDown() // Вызываем в конце
    }

    func testSetVolumeShouldBeReturn0WhenLowestVolume() { // Тестовая функция. Важно: функция должна начинаться со слова test...
        // Given-When-Then - стиль представления тестовой функции
        //
        //Given - описываем предварительные условия для теста, задаем все необходимые параметры
        sut.setVolume(to: -1)
        
        //When - указываем какое-либо действие для теста
        let volume = sut.volume
        
        //Then - описываем изменения, которые мы ожидаем в результате действия
        XCTAssert(volume == 0, "Lowest volume should be equal 0")
    }
    
    func testSetVolumeShouldBeReturn100WhenHighestVolume() {
        sut.setVolume(to: 101)
        XCTAssert(sut.volume == 100, "Highest volume should be equal 100")
    }
    
    func testMockExample() {
        sut.userService?.save(volume: 1)
        let result = userService.saveWasCalled
        XCTAssert(result == 1)
    }
    
    func testExampleAsyncMethod() { //Тестирование на ожиданиях
        //Given
        let expectation = XCTestExpectation(description: "We should wait for the sample async method")
        var bool = false
        
        //When - указываем какое-либо действие для теста
        sut.fetchData { [weak expectation] in
            
            //Then
            print("fetchData")
            bool = true
            expectation?.fulfill()
        }
        wait(for: [expectation], timeout: 3)
        
        XCTAssertTrue(bool)
    }

    func testPerformanceExample() throws { // Функция тестирования производительности
        measure { // вызывает 10 раз и выдает среднее время выполнения
            getMoreItems()
        }
    }

    private func getItems() {
        let numbers = 1...1_000_000
        
        for number in numbers {
            let item = "Item: \(number)"
            items.append(item)
        }
    }
    
    private func getMoreItems() {
        items = (1...1_000_000).map {"Item: \($0)"}
    }
}
