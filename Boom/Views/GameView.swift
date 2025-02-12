//
//  GameView.swift
//  Boom
//
//  Created by Artem Kriukov on 11.02.2025.
//

import UIKit

class GameView: UIView {
    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "WhiteBackground"))
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Нажмите “Запустить” чтобы начать игру"
        element.numberOfLines = 0
        element.textColor = UIColor(named: "TextColor")
        element.textAlignment = .center
        element.font = UIFont(name: Fonts.SFMedium, size: 28)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private(set) lazy var bombImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private(set) lazy var startGameButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Запустить", for: .normal)
        element.titleLabel?.font = UIFont(name: Fonts.SFHeavy, size: 20)
        element.tintColor = UIColor(named: "TextColor")
        element.backgroundColor = UIColor(named: "GameButtons")
        element.layer.cornerRadius = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    init() {
        super.init(frame: .zero)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameView {
    // MARK: - Set Views
    
    func setViews() {
        addSubview(backgroundImageView)
        addSubview(titleLabel)
        addSubview(bombImageView)
        addSubview(startGameButton)
        

       
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 23),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            
            bombImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bombImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bombImageView.widthAnchor.constraint(equalToConstant: 312),
            bombImageView.heightAnchor.constraint(equalToConstant: 352),
            
            startGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -28),
            startGameButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 23),
            startGameButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -23),
            startGameButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
