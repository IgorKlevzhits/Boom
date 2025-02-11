//
//  SettingView.swift
//  Boom
//
//  Created by Евгений on 11.02.2025.
//


import UIKit

class SettingView: UIView {
    
    private let spacingElements: CGFloat = 30
    private let heightButtons: CGFloat = 40
    
    let backGraundImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "WhiteBackground")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let titelLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.font = UIFont(name: Fonts.SFBlack, size: 30)
        label.textAlignment = .center
        return label
    }()
    let timeTitelLabel: UILabel = {
        let label = UILabel()
        label.text = "Время Игры"
        label.font = UIFont(name: Fonts.SFBlack, size: 20)
        return label
    }()
    let shortTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Короткое", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "TextColor")
        button.titleLabel?.font = UIFont(name: Fonts.SFBlack, size: 16)
        button.layer.cornerRadius = 15
        return button
    }()
    let mediumTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Среднее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "TextColor")
        button.titleLabel?.font = UIFont(name: Fonts.SFBlack, size: 16)
        button.layer.cornerRadius = 15
        return button
    }()
    let longTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Длинное", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "TextColor")
        button.titleLabel?.font = UIFont(name: Fonts.SFBlack, size: 16)
        button.layer.cornerRadius = 15
        return button
    }()
    let randomTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Случайное", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "TextColor")
        button.titleLabel?.font = UIFont(name: Fonts.SFBlack, size: 16)
        button.layer.cornerRadius = 15
        return button
    }()
    let containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 20
        container.backgroundColor = UIColor(named: "CategoryCellBackground")
        container.layer.borderColor = UIColor(named: "TextColor")?.cgColor
        container.layer.borderWidth = 1
        return container
    }()
    
    let upperStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    let lowerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    let mainTimeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setView()
        setConstraint()
    }
    
    func setView(){
        addSubview(backGraundImageView)
        addSubview(titelLabel)
        addSubview(containerView)
        
        upperStackView.addArrangedSubview(shortTimeButton)
        upperStackView.addArrangedSubview(mediumTimeButton)
        lowerStackView.addArrangedSubview(longTimeButton)
        lowerStackView.addArrangedSubview(randomTimeButton)
        mainTimeStackView.addArrangedSubview(timeTitelLabel)
        mainTimeStackView.addArrangedSubview(upperStackView)
        mainTimeStackView.addArrangedSubview(lowerStackView)
        containerView.addSubview(mainTimeStackView)
        
        
        backGraundImageView.translatesAutoresizingMaskIntoConstraints = false
        titelLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        timeTitelLabel.translatesAutoresizingMaskIntoConstraints = false
        shortTimeButton.translatesAutoresizingMaskIntoConstraints = false
        mediumTimeButton.translatesAutoresizingMaskIntoConstraints = false
        longTimeButton.translatesAutoresizingMaskIntoConstraints = false
        randomTimeButton.translatesAutoresizingMaskIntoConstraints = false
        upperStackView.translatesAutoresizingMaskIntoConstraints = false
        lowerStackView.translatesAutoresizingMaskIntoConstraints = false
        mainTimeStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    func setConstraint(){
        NSLayoutConstraint.activate([
            backGraundImageView.topAnchor.constraint(equalTo: topAnchor),
            backGraundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGraundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGraundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titelLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titelLabel.topAnchor.constraint(equalTo: topAnchor, constant: spacingElements * 2),
            
            containerView.topAnchor.constraint(equalTo: titelLabel.bottomAnchor, constant: spacingElements/2),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: spacingElements/2),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -spacingElements/2),
            containerView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
      
            

            
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    SettingsVC()
}
