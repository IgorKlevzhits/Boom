//
//  GameViewController.swift
//  Boom
//
//  Created by Artem Kriukov on 10.02.2025.
//

import UIKit
import AVFoundation
import ImageIO

class GameViewController: UIViewController {
    
    // MARK: - Private Properties
    private let gameView = GameView()
    private var gameModel = GameModel()
    private var startGame = false
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gameView
        setupNavBar()
        QuestionManager.shared.updateCurrentQuestions()
        gameView.startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gameView.startGameButton.setTitle("Запустить", for: .normal)
        gameView.startGameButton.isHidden = false
        startGame = false
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        try? AVAudioSession.sharedInstance().setActive(true)
        gameModel.playBackgroundMusic()
        
        gameModel = GameModel()
        gameView.titleLabel.text = "Нажмите “Запустить” чтобы начать игру"
        gameModel.onTimerEnd = { [weak self] in
            self?.gameModel.stopBackgroundMusic()
            self?.navigateToNextScreen()
        }
        
        gameModel.onAnimationChange = { [weak self] in
            self?.changeAnimationToExplosion()
        }
        
        playLottieAnimation()
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    // MARK: - Private Methods
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        gameModel.timer.invalidate()
        gameModel.stopBackgroundMusic()
        gameModel.stopBombTimerSound()
        dismiss(animated: true)
    }
    
    @objc private func pauseButtonTapped() {
        gameModel.pauseOrResumeTimer()
        
        let imageName = self.gameModel.isPaused ? "play.circle" : "pause.circle"
        if let button = self.navigationItem.rightBarButtonItem?.customView as? UIButton {
            let image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 35))
            button.setImage(image, for: .normal)
        }
        
        if gameModel.isPaused {
            gameView.pauseAnimation()
        } else {
            gameView.resumeAnimation()
        }
    }
    
    
    
    @objc private func startGameButtonTapped(_ sender: UIButton) {
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        if !startGame {
            gameView.titleLabel.text = QuestionManager.shared.getRandomQuestion()
            gameModel.startTimer()
            gameModel.playBombTimerSound()
            startGame = true
        }
        
        if gameView.isAnimationPlaying == false {
            gameView.animationView?.play()
            gameView.isAnimationPlaying = true
        }
        
        if SettingsModel.shared.getModeState() {
            gameView.startGameButton.isHidden = true
        } else {
            gameView.startGameButton.setTitle("Ответил", for: .normal)
            gameModel.updateTime()
            
        }
    }
    
    private func playLottieAnimation() {
        gameView.setupAnimation(name: "Bomb", loopMode: .loop)
    }
    
    private func changeAnimationToExplosion() {
        gameView.setupAnimation(name: "Explosion", loopMode: .playOnce)
    }
    
    private func navigateToNextScreen() {
        let finalVC = FinalGameViewController()
        self.navigationController?.pushViewController(finalVC, animated: true)
    }
    
}

extension GameViewController {
    
    private func pauseButtonNavBar() -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "pause.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35)), for: .normal)
        button.tintColor = UIColor(named: "TextColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func backButtonNavBar() -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        button.tintColor = UIColor(named: "TextColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func setupNavBar() {
        self.navigationItem.titleView = UILabel(text: "Игра", size: 30, weight: .black)
        self.navigationItem.leftBarButtonItem = backButtonNavBar()
        self.navigationItem.rightBarButtonItem = pauseButtonNavBar()
    }
    
}
