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
    
    let titleLabel = UILabel(text: "Нажмите “Запустить” чтобы начать игру", size: 28, weight: .bold)
    
    private(set) lazy var bombImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let startGameButton = UIButton(title: "Запустить", backgroundColor: "YellowButton")
    
    // MARK: - Private Properties
    
    
    
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
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Sizes.spacingElements),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Sizes.spacingElements),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Sizes.spacingElements),
            
            bombImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bombImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bombImageView.widthAnchor.constraint(equalToConstant: 312),
            bombImageView.heightAnchor.constraint(equalToConstant: 352),
            
            startGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Sizes.spacingElements),
            startGameButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Sizes.spacingElements),
            startGameButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Sizes.spacingElements),
            startGameButton.heightAnchor.constraint(equalToConstant: Sizes.heightButtons)
        ])
    }
}
