//
//  GameViewController.swift
//  Boom
//
//  Created by Artem Kriukov on 10.02.2025.
//

import UIKit
import AVFoundation

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
        let element = UIImageView(image: UIImage(named: "bombForGame"))
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
        let element = UIBarButtonItem()
        element.image = UIImage(systemName: "pause.circle")
        element.tintColor = UIColor(named: "TextColor")
        element.target = self
        element.action = #selector(pauseButtonTapped)
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
        let element = UIBarButtonItem()
        element.image = UIImage(systemName: "chevron.backward")
        element.tintColor = UIColor(named: "TextColor")
        element.target = self
        element.action = #selector(backButtonTapped)
        return element
    }()
    
    // MARK: - Private Properties
    
    private var isPause = false
    private var timer = Timer()
    private var player: AVAudioPlayer? = nil
    private var isBombSoundPlayed = false
    private var totalTime = 15
    private var secondPassed = 0
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        
        playSound(Music.backroundMusic)
    }
    
    // MARK: - Private Methods
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    @objc private func pauseButtonTapped() {
        isPause.toggle()
        
        if isPause {
            pauseButtonNavBar.image = UIImage(systemName: "play.circle")
        } else {
            pauseButtonNavBar.image = UIImage(systemName: "pause.circle")
        }
    }
    
    @objc private func startGameButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        
        startGameButton.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }
    
    @objc private func updateTimer() {
        
        if totalTime <= 4 && !isBombSoundPlayed {
            playSound(Music.bombTimer)
            isBombSoundPlayed = true
        }
        
        if secondPassed < totalTime {
            totalTime -= 1
            print(totalTime)
        } else {
            print("Finish")
        }
    }
    
    private func playSound(_ soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
        
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
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
