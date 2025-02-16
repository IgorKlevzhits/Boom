//
//  FinalGameView.swift
//  Boom
//
//  Created by Евгений on 10.02.2025.
//

import UIKit

class FinalGameView: UIView {
    
    // MARK: - UI
    
    let titelLabel = UILabel(text: "Конец Игры", size: 30, weight: .black)
    
    let backGroundImage = UIImageView(image: "WhiteBackground")
    let finishImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "FinalBoom")
        img.contentMode = .scaleAspectFit
        return img
    }()
    let conditionLable = UILabel(text: "Задание", size: 28, weight: .bold)
    
    let changeTaskButton = UIButton(title: "Другое задание", backgroundColor: "YellowButton")
    let restartButton = UIButton(title: "Начать заново", backgroundColor: "YellowButton")
    
    lazy var stackButton: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = Sizes.spacingElements
        return stack
    }()
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = Sizes.spacingElements
        return stack
    }()
    
    // MARK: - Private Properties
    
    private var heightImageView: CGFloat = 0.4
    
    init() {
        super.init(frame: .zero)
        setView()
        setConstraint()
    }
    
    // MARK: - Set Views
    
    func setView(){
        addSubview(backGroundImage)
        addSubview(mainStack)
        mainStack.addArrangedSubview(finishImage)
        mainStack.addArrangedSubview(conditionLable)
        
        addSubview(stackButton)
        stackButton.addArrangedSubview(changeTaskButton)
        stackButton.addArrangedSubview(restartButton)
        
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        finishImage.translatesAutoresizingMaskIntoConstraints = false
        stackButton.translatesAutoresizingMaskIntoConstraints = false
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        if !SettingsModel.shared.getChallengeState() {
            conditionLable.isHidden = true
            changeTaskButton.isHidden = true
            heightImageView = 0.6
        }
    }
    
    // MARK: - Setup Constraints
    
    func setConstraint(){
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: topAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),

            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Sizes.spacingElements),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Sizes.spacingElements),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Sizes.spacingElements),
            
            finishImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightImageView),
            changeTaskButton.heightAnchor.constraint(equalToConstant: Sizes.heightButtons),
            restartButton.heightAnchor.constraint(equalToConstant: Sizes.heightButtons),
            
            stackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Sizes.spacingElements),
            stackButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Sizes.spacingElements),
            stackButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Sizes.spacingElements)
        ])

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
