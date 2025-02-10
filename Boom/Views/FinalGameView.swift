//
//  FinalGameView.swift
//  Boom
//
//  Created by Евгений on 10.02.2025.
//

import UIKit

class FinalGameView: UIView {
    private let spacingElements: CGFloat = 30
    private let heightButtons: CGFloat = 55
    
    let backGroundImage: UIImageView = {
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "WhiteBackground")
        bgImage.contentMode = .scaleAspectFill
        bgImage.clipsToBounds = true
        return bgImage
    }()
    let titelLabel: UILabel = {
        let label = UILabel()
        label.text = "Конец Игры"
        label.font = UIFont(name: Fonts.SFBlack, size: 30)
        label.textAlignment = .center
        return label
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
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    let changeTaskButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать заново", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "GameButtons")
        button.titleLabel?.font = UIFont(name: Fonts.SFBlack, size: 20)
        button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    let restartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать заново", for: .normal)
        button.backgroundColor = UIColor(named: "GameButtons")
        button.titleLabel?.font = UIFont(name: Fonts.SFBlack, size: 20)
        button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let stackButton: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        return stack
    }()
    let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 40
        return stack
    }()
  
    
    init() {
        super.init(frame: .zero)
        setView()
        setConstraint()
    }
    func setView(){
        addSubview(backGroundImage)
        addSubview(titelLabel)
        addSubview(finishImage)
        addSubview(conditionLable)
        addSubview(changeTaskButton)
        addSubview(restartButton)
        sendSubviewToBack(backGroundImage)
        
        stackButton.addArrangedSubview(changeTaskButton)
        stackButton.addArrangedSubview(restartButton)
        addSubview(stackButton)
        
        mainStack.addArrangedSubview(finishImage)
        mainStack.addArrangedSubview(conditionLable)
        addSubview(mainStack)
        
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        titelLabel.translatesAutoresizingMaskIntoConstraints = false
        finishImage.translatesAutoresizingMaskIntoConstraints = false
        conditionLable.translatesAutoresizingMaskIntoConstraints = false
        changeTaskButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        stackButton.translatesAutoresizingMaskIntoConstraints = false
        mainStack.translatesAutoresizingMaskIntoConstraints = false
    }
    func setConstraint(){
      
        
            
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: topAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titelLabel.topAnchor.constraint(equalTo: topAnchor, constant: spacingElements * 2),
            titelLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            

            mainStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStack.leftAnchor.constraint(equalTo: leftAnchor, constant: spacingElements),
            
            changeTaskButton.heightAnchor.constraint(equalToConstant: heightButtons),
            restartButton.heightAnchor.constraint(equalToConstant: heightButtons),
            
            finishImage.heightAnchor.constraint(equalTo: stackButton.heightAnchor, multiplier: 1.5),
            
            stackButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackButton.topAnchor.constraint(equalTo: conditionLable.bottomAnchor, constant: spacingElements),
            stackButton.leftAnchor.constraint(equalTo: leftAnchor, constant: spacingElements)
        ])
            
            
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    FinalGameView()
}
