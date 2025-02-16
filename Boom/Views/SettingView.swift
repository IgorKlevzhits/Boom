//
//  SettingView.swift
//  Boom
//
//  Created by Евгений on 11.02.2025.
//

import UIKit

final class SettingView: UIView {
    
    private let spacingElements: CGFloat = 30
    private let heightButtons: CGFloat = 40
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
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
    
    private let gameModeContainerView = UIView(radius: 20)
    private let gameModeStackView = UIStackView(axis: .vertical)
    private let gameModeTitelLabel = UILabel(text: "РЕЖИМ ИГРЫ", size: 20, weight: .bold)
    var classicModeButton = UIButton(title: "Классика")
    var hotPotatoMdeButton = UIButton(title: "Горячая картошка")
    
    private let timeTitelLabel = UILabel(text: "ВРЕМЯ ИГРЫ", size: 20, weight: .bold)
    
    var shortTimeButton = UIButton(title: "Короткое")
    var middleTimeButton = UIButton(title: "Среднее")
    var longTimeButton = UIButton(title: "Длинное")
    var randomTimeButton = UIButton(title: "Случайное")
    
    let timeContainerView = UIView(radius: 20)
    
    let upperStackView = UIStackView(axis: .horizontal)
    let lowerStackView = UIStackView(axis: .horizontal)
    let mainTimeStackView = UIStackView(axis: .vertical)
    
    //MARK: MUSIK STACK
    private let backgroundMusikLabel = UILabel(text: "  Фоновая музыка")
    private let tickMusikLabel = UILabel(text: "  Тиканье Бомбы")
    private let bombExplosionMusikLabel = UILabel(text: "  Взрыв бомбы")
    
    let backgroundMusikPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor =  UIColor(named: "TextColor")
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let tickMusikPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor =  UIColor(named: "TextColor")
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let bomdExplosionMusikPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor =  UIColor(named: "TextColor")
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let backGroundMusikStackView = UIStackView(distribution: .fill)
    let tickMusikStackView = UIStackView(distribution: .fill)
    let bombExplosionMusikStackView = UIStackView(distribution: .fill)
    
    let mainMusikStackView = UIStackView(axis: .vertical)
    
    let musikContainerView = UIView(radius: 20)
    
    //MARK: USER DEFAULT
    private lazy var vibrationTurnOnLabel = UILabel(text: "  Вибрация")
    private lazy var chelengeTurnOnLabel = UILabel(text: "  Игра с заданиями")
    
    let vibrationSwitch: UISwitch = {
        let vibrationSwitch = UISwitch()
        vibrationSwitch.onTintColor = UIColor(named: "YellowButton")
        vibrationSwitch.translatesAutoresizingMaskIntoConstraints = false
        return vibrationSwitch
    }()
    
    let chelengeSwitch: UISwitch = {
        let chalengeSwitch = UISwitch()
        chalengeSwitch.onTintColor = UIColor(named: "YellowButton")
        chalengeSwitch.translatesAutoresizingMaskIntoConstraints = false
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
        vibrationStackView.alignment = .center
        chelengeStackView.alignment = .center
        
        vibrationStackView.spacing = 10
        chelengeStackView.spacing = 10
        addSubview(backGraundImageView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStackView)
        
        // MARK: GAME MODE
        mainStackView.addArrangedSubview(gameModeContainerView)
        gameModeContainerView.addSubview(gameModeStackView)
        gameModeStackView.addArrangedSubview(gameModeTitelLabel)
        gameModeStackView.addArrangedSubview(classicModeButton)
        gameModeStackView.addArrangedSubview(hotPotatoMdeButton)
        
        //MARK: TIME STACK
        mainStackView.addArrangedSubview(timeContainerView)
        timeTitelLabel.textAlignment = .left
        upperStackView.addArrangedSubview(shortTimeButton)
        upperStackView.addArrangedSubview(middleTimeButton)
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
        
        vibrationStackView.isLayoutMarginsRelativeArrangement = true
        vibrationStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        
        chelengeStackView.isLayoutMarginsRelativeArrangement = true
        chelengeStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            backGraundImageView.topAnchor.constraint(equalTo: topAnchor),
            backGraundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGraundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGraundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Sizes.spacingElements),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.spacingElements),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.spacingElements),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Sizes.spacingElements),
            
            // MARK: GAME MODE
            gameModeContainerView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4),
            gameModeStackView.topAnchor.constraint(equalTo: gameModeContainerView.topAnchor),
            gameModeStackView.leadingAnchor.constraint(equalTo: gameModeContainerView.leadingAnchor, constant: spacingElements),
            gameModeStackView.trailingAnchor.constraint(equalTo: gameModeContainerView.trailingAnchor, constant: -spacingElements),
            gameModeStackView.bottomAnchor.constraint(equalTo: gameModeContainerView.bottomAnchor, constant: -spacingElements/2),
            
            //MARK: TIME STACK
            timeContainerView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4),
            
            mainTimeStackView.topAnchor.constraint(equalTo: timeContainerView.topAnchor),
            mainTimeStackView.leadingAnchor.constraint(equalTo: timeContainerView.leadingAnchor, constant: spacingElements),
            mainTimeStackView.trailingAnchor.constraint(equalTo: timeContainerView.trailingAnchor, constant: -spacingElements),
            mainTimeStackView.bottomAnchor.constraint(equalTo: timeContainerView.bottomAnchor, constant: -spacingElements/2),
            
            //MARK: MUSIKSTACK
            musikContainerView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5),
            
            mainMusikStackView.topAnchor.constraint(equalTo: musikContainerView.topAnchor, constant: spacingElements/2),
            mainMusikStackView.bottomAnchor.constraint(equalTo: musikContainerView.bottomAnchor, constant: -spacingElements/2),
            mainMusikStackView.leadingAnchor.constraint(equalTo: musikContainerView.leadingAnchor, constant: spacingElements/2),
            mainMusikStackView.trailingAnchor.constraint(equalTo: musikContainerView.trailingAnchor, constant: -spacingElements/2),
            
            backgroundMusikPicker.widthAnchor.constraint(equalTo: backGroundMusikStackView.widthAnchor, multiplier: 0.3),
            tickMusikPicker.widthAnchor.constraint(equalTo: tickMusikStackView.widthAnchor, multiplier: 0.3),
            bomdExplosionMusikPicker.widthAnchor.constraint(equalTo: bombExplosionMusikStackView.widthAnchor, multiplier: 0.3),
            
            //MARK: USER_DEFAULT
            userDefaultsContainerView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3),
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
