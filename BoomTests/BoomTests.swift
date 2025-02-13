//
//  BoomTests.swift
//  BoomTests
//
//  Created by Artem Kriukov on 13.02.2025.
//

import XCTest
@testable import Boom

final class BoomTests: XCTestCase {
    
    var gameModel: GameModel!
    var questionManager: QuestionManager!
    
    override func setUpWithError() throws {
        gameModel = GameModel()
        questionManager = QuestionManager.shared
    }
    
    override func tearDownWithError() throws {
        gameModel = nil
        questionManager = nil
    }
    
    // MARK: - Тесты GameModel
    
    func testTimerStartsAndEnds() {
        let expectation = self.expectation(description: "Таймер завершился")
        
        gameModel.onTimerEnd = {
            expectation.fulfill()
        }
        
        gameModel.startTimer()
        wait(for: [expectation], timeout: 3)
        
        XCTAssertTrue(gameModel.timer.isValid == false)
    }
    
    func testPauseAndResumeTimer() {
        gameModel.startTimer()
        XCTAssertFalse(gameModel.isPaused)
        
        gameModel.pauseOrResumeTimer()
        XCTAssertTrue(gameModel.isPaused)
        
        gameModel.pauseOrResumeTimer()
        XCTAssertFalse(gameModel.isPaused)
    }
    
    func testCreatePlayer() {
        let player = gameModel.createPlayer(soundName: "backgroundMusicThree", loop: true)
        XCTAssertNotNil(player)
    }
    
    func testPlayBackgroundMusic() {
        gameModel.playBackgroundMusic()
        XCTAssertNotNil(GameModel.backgroundPlayer)
    }
    
    func testStopBackgroundMusic() {
        gameModel.playBackgroundMusic()
        gameModel.stopBackgroundMusic()
        XCTAssertFalse(GameModel.backgroundPlayer?.isPlaying ?? true)
    }
}


