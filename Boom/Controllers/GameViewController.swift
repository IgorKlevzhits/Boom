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
    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "WhiteBackground"))
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Нажмите “Запустить” чтобы начать игру"
        element.numberOfLines = 0
        element.textColor = UIColor(named: "TextColor")
        element.textAlignment = .center
        element.font = UIFont(name: Fonts.SFMedium, size: 28)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bombImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var startGameButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Запустить", for: .normal)
        element.titleLabel?.font = UIFont(name: Fonts.SFHeavy, size: 20)
        element.tintColor = UIColor(named: "TextColor")
        element.backgroundColor = UIColor(named: "GameButtons")
        element.layer.cornerRadius = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var pauseButtonNavBar: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "pause.circle",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 35)),
                        for: .normal)
        button.tintColor = UIColor(named: "TextColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        let element = UIBarButtonItem(customView: button)
        return element
    }()
    
    private lazy var titleNavBar: UILabel = {
        let element = UILabel()
        element.text = "Игра"
        element.font = UIFont(name: Fonts.SFBlack, size: 30)
        element.textColor = .black
        return element
    }()
    
    private lazy var backButtonNavBar: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.backward",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)),
                        for: .normal)
        button.tintColor = UIColor(named: "TextColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let element = UIBarButtonItem(customView: button)
        return element
    }()
    
    // MARK: - Private Properties
    
    private var isPause = false
    private var timer = Timer()
    private var backgroundPlayer: AVAudioPlayer?
    private var bombTimerPlayer: AVAudioPlayer?
    private var isBombSoundPlayed = false
    private var totalTime = 15
    private var secondPassed = 0
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        
        try? AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default, options: [.mixWithOthers])
        try? AVAudioSession.sharedInstance().setActive(true)
        
        playBackgroundMusic()
        loadGIF(named: "AnimationBomb", duration: 15.0)
    }
    
    // MARK: - Private Methods
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        timer.invalidate()
        dismiss(animated: true)
    }
    
    @objc private func pauseButtonTapped() {
        isPause.toggle()
        
        if let button = pauseButtonNavBar.customView as? UIButton {
            let imageName = isPause ? "play.circle" : "pause.circle"
            let image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 35))
            button.setImage(image, for: .normal)
        }
    }
    
    private func pauseOrResumeTimer() {
        if isPause {
            startTimer()
        } else {
            timer.invalidate()
        }
        
        isPause.toggle()
    }
    
    private func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func startGameButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        
        startGameButton.isHidden = true
        
        startTimer()
    }
    
    @objc private func updateTimer() {
        if isPause { return }
        
        if totalTime == 4 {
            bombSoundPlayed()
            pauseButtonNavBar.isEnabled = false
        }
        
        if totalTime > 0 {
            totalTime -= 1
            print(totalTime)
        } else {
            timer.invalidate()
            print("Finish")
        }
    }
    
    private func createPlayer(soundName: String, loop: Bool) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return nil }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = loop ? -1 : 0
            return player
        } catch {
            return nil
        }
    }
    
    private func bombSoundPlayed() {
        bombTimerPlayer = createPlayer(soundName: Music.bombTimer, loop: true)
        bombTimerPlayer?.play()
    }
    
    private func playBackgroundMusic() {
        backgroundPlayer = createPlayer(soundName: Music.backroundMusicThree, loop: true)
        backgroundPlayer?.play()
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
        
        bombImageView.image = UIImage.animatedImage(with: images, duration: duration)
    }
}
private extension GameViewController {
    
    // MARK: - Set Views
    
    func setViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(bombImageView)
        view.addSubview(startGameButton)
        
        navigationItem.rightBarButtonItem = pauseButtonNavBar
        navigationItem.titleView = titleNavBar
        navigationItem.leftBarButtonItem = backButtonNavBar
        
        startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            
            bombImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bombImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bombImageView.widthAnchor.constraint(equalToConstant: 312),
            bombImageView.heightAnchor.constraint(equalToConstant: 352),
            
            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -28),
            startGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23),
            startGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -23),
            startGameButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

}
