//
//  FinalGameView.swift
//  Boom
//
//  Created by Евгений on 10.02.2025.
//

import UIKit

class FinalGameView: UIView {
    
    let titelLabel = UILabel(text: "Конец Игры", size: 30, weight: .black)
    
    let backGroundImage: UIImageView = {
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "WhiteBackground")
        bgImage.contentMode = .scaleAspectFill
        bgImage.clipsToBounds = true
        return bgImage
    }()
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
            
            finishImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            changeTaskButton.heightAnchor.constraint(equalToConstant: Sizes.heightButtons),
            
            stackButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: Sizes.spacingElements),
            stackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Sizes.spacingElements),
            stackButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Sizes.spacingElements),
            stackButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Sizes.spacingElements)
        ])

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
