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
    private var pauseButtonItem: UIBarButtonItem!
    
    private let gameView = GameView()
    private let gameModel = GameModel()
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gameView
        
        setupNavBar()
        
        gameView.startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        
        try? AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default, options: [.mixWithOthers])
        try? AVAudioSession.sharedInstance().setActive(true)
        
        gameModel.playBackgroundMusic()
        loadGIF(named: "AnimationBomb", duration: 15.0)
    }
    
    // MARK: - Private Methods
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        gameModel.timer.invalidate()
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
        gameModel.stopTimer()
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        gameView.startGameButton.isHidden = true
        
        gameModel.startTimer()
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
}

extension GameViewController {
    
    private func titleNavBar() -> UILabel {
        let element = UILabel()
        element.text = "Игра"
        element.font = UIFont(name: Fonts.SFBlack, size: 30)
        element.textColor = .black
        return element
    }
    
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
        self.navigationItem.titleView = titleNavBar()
        self.navigationItem.leftBarButtonItem = backButtonNavBar()
        self.navigationItem.rightBarButtonItem = pauseButtonNavBar()
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }

}
