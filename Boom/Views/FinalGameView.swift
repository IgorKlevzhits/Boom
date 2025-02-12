//
//  FinalGameView.swift
//  Boom
//
//  Created by Евгений on 10.02.2025.
//

import UIKit

class FinalGameView: UIView {
    
    private let spacingElements: CGFloat = 20
    private let heightButtons: CGFloat = 55
    
    let titelLabel: UILabel = {
        let label = UILabel()
        label.text = "Конец Игры"
        label.font = UIFont(name: Fonts.SFBlack, size: 30)
        label.textColor = UIColor(named: "TextColor")
        label.textAlignment = .center
        return label
    }()
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
    let conditionLable: UILabel = {
        let label = UILabel()
        label.text = "В следующем раунде после каждого ответа хлопать в ладоши"
        label.font = UIFont(name: Fonts.SFHeavy, size: 28)
        label.textColor = UIColor(named: "TextColor")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    let changeTaskButton = UIButton(title: "Другое задание", backgroundColor: "YellowButton")
    let restartButton = UIButton(title: "Начать заново", backgroundColor: "YellowButton")
    
    lazy var stackButton: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = spacingElements
        return stack
    }()
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = spacingElements
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
        conditionLable.translatesAutoresizingMaskIntoConstraints = false
        changeTaskButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.translatesAutoresizingMaskIntoConstraints = false
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

            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: spacingElements),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacingElements),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacingElements),
            
            finishImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            changeTaskButton.heightAnchor.constraint(equalToConstant: heightButtons),
            
            stackButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: spacingElements),
            stackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacingElements),
            stackButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacingElements),
            stackButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -spacingElements)
        ])

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
