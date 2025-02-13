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
    //MARK: TIME STACK
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = Sizes.spacingElements
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let backGraundImageView = UIImageView(image: "WhiteBackground")
    
    let titelLabel = UILabel(text: "Настройки", size: 30, weight: .black)
    
    private let timeTitelLabel = UILabel(text: "ВРЕМЯ ИГРЫ", size: 20, weight: .bold)
    
    private let shortTimeButton = UIButton(title: "Короткое")
    private let mediumTimeButton = UIButton(title: "Среднее")
    private let longTimeButton = UIButton(title: "Длинное")
    private let randomTimeButton = UIButton(title: "Случайное")
    
    let timeContainerView = UIView(radius: 20)
    
    let upperStackView = UIStackView(axis: .horizontal)
    let lowerStackView = UIStackView(axis: .horizontal)
    let mainTimeStackView = UIStackView(axis: .vertical)
    
    //MARK: MUSIK STACK
    private let backgroundMusikLabel = UILabel(text: "Фоновая музыка")
    private let tickMusikLabel = UILabel(text: "Тиканье Бомбы")
    private let bombExplosionMusikLabel = UILabel(text: "Взрыв бомбы")
    
    let backgroundMusikPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    let tickMusikPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    let bomdExplosionMusikPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    let backGroundMusikStackView = UIStackView(distribution: .fill)
    let tickMusikStackView = UIStackView(distribution: .fill)
    let bombExplosionMusikStackView = UIStackView(distribution: .fill)
    
    let mainMusikStackView = UIStackView(axis: .vertical)
    
    let musikContainerView = UIView(radius: 20)
    
    //MARK: USER DEFAULT
    private lazy var vibrationTurnOnLabel = UILabel(text: "Вибрация")
    private lazy var chelengeTurnOnLabel = UILabel(text: "Игра с заданиями")
    
    let vibrationSwitch: UISwitch = {
        let vibrationSwitch = UISwitch()
        return vibrationSwitch
    }()
    let chelengeSwitch: UISwitch = {
        let chalengeSwitch = UISwitch()
        return chalengeSwitch
    }()
    let vibrationStackView = UIStackView(distribution: .fill)
    let chelengeStackView = UIStackView(distribution: .fill)
    
    let userDefaultsStackView = UIStackView(axis: .vertical)
    
    let userDefaultsContainerView = UIView(radius: 20)
    init() {
        super.init(frame: .zero)
        setView()
        setConstraint()
    }
    
    func setView(){
        
        addSubview(backGraundImageView)
        addSubview(mainStackView)
        
        //MARK: TIME STACK
        mainStackView.addArrangedSubview(timeContainerView)
        timeTitelLabel.textAlignment = .left
        upperStackView.addArrangedSubview(shortTimeButton)
        upperStackView.addArrangedSubview(mediumTimeButton)
        lowerStackView.addArrangedSubview(longTimeButton)
        lowerStackView.addArrangedSubview(randomTimeButton)
        mainTimeStackView.addArrangedSubview(timeTitelLabel)
        mainTimeStackView.addArrangedSubview(upperStackView)
        mainTimeStackView.addArrangedSubview(lowerStackView)
        timeContainerView.addSubview(mainTimeStackView)
        
        //MARK: MUSIKSTACK
        mainStackView.addArrangedSubview(musikContainerView)
        backGroundMusikStackView.addArrangedSubview(backgroundMusikLabel)
        backGroundMusikStackView.addArrangedSubview(backgroundMusikPicker)
        tickMusikStackView.addArrangedSubview(tickMusikLabel)
        tickMusikStackView.addArrangedSubview(tickMusikPicker)
        bombExplosionMusikStackView.addArrangedSubview(bombExplosionMusikLabel)
        bombExplosionMusikStackView.addArrangedSubview(bomdExplosionMusikPicker)
        mainMusikStackView.addArrangedSubview(backGroundMusikStackView)
        mainMusikStackView.addArrangedSubview(tickMusikStackView)
        mainMusikStackView.addArrangedSubview(bombExplosionMusikStackView)
        musikContainerView.addSubview(mainMusikStackView)
       
        //MARK: USER DEFAULT
        mainStackView.addArrangedSubview(userDefaultsContainerView)
        vibrationStackView.addArrangedSubview(vibrationTurnOnLabel)
        vibrationStackView.addArrangedSubview(vibrationSwitch)
        chelengeStackView.addArrangedSubview(chelengeTurnOnLabel)
        chelengeStackView.addArrangedSubview(chelengeSwitch)
        userDefaultsStackView.addArrangedSubview(vibrationStackView)
        userDefaultsStackView.addArrangedSubview(chelengeStackView)
        userDefaultsContainerView.addSubview(userDefaultsStackView)
        
    }
    func setConstraint() {
        NSLayoutConstraint.activate([
            backGraundImageView.topAnchor.constraint(equalTo: topAnchor),
            backGraundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGraundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGraundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Sizes.spacingElements),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Sizes.spacingElements),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Sizes.spacingElements),
        
            //MARK: TIME STACK
            timeContainerView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            
            mainTimeStackView.topAnchor.constraint(equalTo: timeContainerView.topAnchor),
            mainTimeStackView.leadingAnchor.constraint(equalTo: timeContainerView.leadingAnchor, constant: spacingElements),
            mainTimeStackView.trailingAnchor.constraint(equalTo: timeContainerView.trailingAnchor, constant: -spacingElements),
            mainTimeStackView.bottomAnchor.constraint(equalTo: timeContainerView.bottomAnchor),
            mainTimeStackView.bottomAnchor.constraint(equalTo: timeContainerView.bottomAnchor, constant: -spacingElements/2),
            //MARK: MUSIKSTACK
            musikContainerView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            mainMusikStackView.topAnchor.constraint(equalTo: musikContainerView.topAnchor, constant: spacingElements/2),
            mainMusikStackView.bottomAnchor.constraint(equalTo: musikContainerView.bottomAnchor, constant: -spacingElements/2),
            mainMusikStackView.leadingAnchor.constraint(equalTo: musikContainerView.leadingAnchor, constant: spacingElements/2),
            mainMusikStackView.trailingAnchor.constraint(equalTo: musikContainerView.trailingAnchor, constant: -spacingElements/2),
            
            backgroundMusikPicker.widthAnchor.constraint(equalTo: backGroundMusikStackView.widthAnchor, multiplier: 0.3),
            tickMusikPicker.widthAnchor.constraint(equalTo: tickMusikStackView.widthAnchor, multiplier: 0.3),
            bomdExplosionMusikPicker.widthAnchor.constraint(equalTo: bombExplosionMusikStackView.widthAnchor, multiplier: 0.3),
            
            //MARK: USER_DEFAULT
            userDefaultsContainerView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            userDefaultsStackView.leftAnchor.constraint(equalTo: userDefaultsContainerView.leftAnchor, constant: spacingElements/2),
            userDefaultsStackView.rightAnchor.constraint(equalTo: userDefaultsContainerView.rightAnchor, constant: -spacingElements/2),
            userDefaultsStackView.topAnchor.constraint(equalTo: userDefaultsContainerView.topAnchor, constant: spacingElements/2),
            userDefaultsStackView.bottomAnchor.constraint(equalTo: userDefaultsContainerView.bottomAnchor, constant: -spacingElements/2),
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
