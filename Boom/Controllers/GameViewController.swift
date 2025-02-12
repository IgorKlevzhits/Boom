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
    var gameTime: TimeModel?
    let questionBank = QuestionBank()
    let selectedCategories: [QuestionCategory] = [.sportsAndHobbies]
    
    private let gameView = GameView()
    private var gameModel = GameModel()
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gameView
        setupNavBar()
        gameView.startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        try? AVAudioSession.sharedInstance().setActive(true)
        gameModel.playBackgroundMusic()
        
        gameView.startGameButton.isHidden = false
        gameModel = GameModel()
        gameView.titleLabel.text = "Нажмите “Запустить” чтобы начать игру"
        gameModel.onTimerEnd = { [weak self] in
            self?.gameModel.stopBackgroundMusic()
            self?.navigateToNextScreen()
        }
        loadGIF(named: "AnimationBomb", duration: 10)
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    // MARK: - Private Methods
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        gameModel.timer.invalidate()
        gameModel.stopBackgroundMusic()
        gameModel.stopBombSound() 
        dismiss(animated: true)
    }
    
    @objc private func pauseButtonTapped() {
        gameModel.pauseOrResumeTimer()
        
        let imageName = self.gameModel.isPaused ? "play.circle" : "pause.circle"
        if let button = self.navigationItem.rightBarButtonItem?.customView as? UIButton {
            let image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 35))
            button.setImage(image, for: .normal)
        }
    }
    

    
    @objc private func startGameButtonTapped(_ sender: UIButton) {
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        gameView.titleLabel.text = questionBank.getNextQuestion(from: selectedCategories)?.text
        gameView.startGameButton.isHidden = true
        gameModel.startTimer()
        gameModel.playBombSound()
    }
    
    private func loadGIF(named name: String, duration: TimeInterval) {
        guard let gifURL = Bundle.main.url(forResource: name, withExtension: "gif"),
              let gifData = try? Data(contentsOf: gifURL),
              let source = CGImageSourceCreateWithData(gifData as CFData, nil) else { return }
        
        var images: [UIImage] = []
        let count = CGImageSourceGetCount(source)
        let frameDuration = duration / Double(count)
        
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage))
            }
        }
        
        gameView.bombImageView.image = UIImage.animatedImage(with: images, duration: duration)
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
