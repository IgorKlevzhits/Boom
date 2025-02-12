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
    let backGraundImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "WhiteBackground")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titelLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.font = setFont(fontSize: 28, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var timeTitelLabel: UILabel = {
        let label = UILabel()
        label.text = "Время Игры"
        label.font = setFont(fontSize: 28, weight: .heavy)
        return label
    }()
    
    private lazy var shortTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Короткое", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "TextColor")
        button.titleLabel?.font = setFont(fontSize: 16, weight: .black)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var mediumTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Среднее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "TextColor")
        button.titleLabel?.font = setFont(fontSize: 16, weight: .black)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var longTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Длинное", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "TextColor")
        button.titleLabel?.font = setFont(fontSize: 16, weight: .black)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var randomTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Случайное", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "TextColor")
        button.titleLabel?.font = setFont(fontSize: 16, weight: .black)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var timeContainerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 20
        container.backgroundColor = UIColor(named: "CategoryCellBackground")
        container.layer.borderColor = UIColor(named: "TextColor")?.cgColor
        container.layer.borderWidth = 1
        return container
    }()
    
    private lazy var upperStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var lowerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var mainTimeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    //MARK: MUSIK STACK
    private lazy var backgroundMusikLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = setFont(fontSize: 20, weight: .black)
        label.textAlignment = .left
        label.backgroundColor = UIColor(named: "TextColor")
        label.text = "Фоновая музыка"
        return label
    }()
    
    private lazy var tickMusikLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = setFont(fontSize: 20, weight: .black)
        label.textAlignment = .left
        label.backgroundColor = UIColor(named: "TextColor")
        label.text = "Тиканье Бомбы"
        return label
    }()
    
    private lazy var bombExplosionMusikLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = setFont(fontSize: 20, weight: .black)
        label.textAlignment = .left
        label.backgroundColor = UIColor(named: "TextColor")
        label.text = "Взрыв бомбы"
        return label
    }()
    
    private lazy var backgroundMusikPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    private lazy var tickMusikPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    private lazy var bomdExplosionMusikPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    private lazy var backGroundMusikStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.backgroundColor = UIColor(named: "TextColor")
        stackView.layer.cornerRadius = 15
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var tickMusikStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.backgroundColor = UIColor(named: "TextColor")
        stackView.layer.cornerRadius = 15
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var bombExplosionMusikStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.backgroundColor = UIColor(named: "TextColor")
        stackView.layer.cornerRadius = 15
        return stackView
    }()
    
    private lazy var mainMusikStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var musikContainerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 20
        container.backgroundColor = UIColor(named: "CategoryCellBackground")
        container.layer.borderColor = UIColor(named: "TextColor")?.cgColor
        container.layer.borderWidth = 1
        return container
    }()
    
    //MARK: USER DEFAULT
    private lazy var vibrationTurnOnLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = setFont(fontSize: 20, weight: .black)
        label.textAlignment = .left
        label.backgroundColor = UIColor(named: "TextColor")
        label.text = "Вибрация"
        return label
    }()
    
    private lazy var chelengeTurnOnLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = setFont(fontSize: 20, weight: .black)
        label.textAlignment = .left
        label.backgroundColor = UIColor(named: "TextColor")
        label.text = "Задания"
        return label
    }()
    
    private lazy var vibrationSwitch: UISwitch = {
        let vibrationSwitch = UISwitch()
        return vibrationSwitch
    }()
    
    private lazy var chelengeSwitch: UISwitch = {
        let chalengeSwitch = UISwitch()
        return chalengeSwitch
    }()
    
    private lazy var vibrationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var chelengeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var userDefaultsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var userDefaultsContainerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 20
        container.backgroundColor = UIColor(named: "CategoryCellBackground")
        container.layer.borderColor = UIColor(named: "TextColor")?.cgColor
        container.layer.borderWidth = 1
        return container
    }()
    
    init() {
        super.init(frame: .zero)
        setView()
        setConstraint()
    }
    
    func setView(){
        
        addSubview(backGraundImageView)
        backGraundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: TIME STACK
        
        addSubview(titelLabel)
        titelLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(timeContainerView)
        
        upperStackView.addArrangedSubview(shortTimeButton)
        upperStackView.addArrangedSubview(mediumTimeButton)
        lowerStackView.addArrangedSubview(longTimeButton)
        lowerStackView.addArrangedSubview(randomTimeButton)
        mainTimeStackView.addArrangedSubview(timeTitelLabel)
        mainTimeStackView.addArrangedSubview(upperStackView)
        mainTimeStackView.addArrangedSubview(lowerStackView)
        timeContainerView.addSubview(mainTimeStackView)
        upperStackView.translatesAutoresizingMaskIntoConstraints = false
        lowerStackView.translatesAutoresizingMaskIntoConstraints = false
        mainTimeStackView.translatesAutoresizingMaskIntoConstraints = false
        timeContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: MUSIKSTACK
        addSubview(musikContainerView)
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
        backGroundMusikStackView.translatesAutoresizingMaskIntoConstraints = false
        tickMusikStackView.translatesAutoresizingMaskIntoConstraints = false
        bombExplosionMusikStackView.translatesAutoresizingMaskIntoConstraints = false
        mainMusikStackView.translatesAutoresizingMaskIntoConstraints = false
        musikContainerView.translatesAutoresizingMaskIntoConstraints = false
       
        //MARK: USER DEFAULT
        addSubview(userDefaultsContainerView)
        vibrationStackView.addArrangedSubview(vibrationTurnOnLabel)
        vibrationStackView.addArrangedSubview(vibrationSwitch)
        chelengeStackView.addArrangedSubview(chelengeTurnOnLabel)
        chelengeStackView.addArrangedSubview(chelengeSwitch)
        userDefaultsStackView.addArrangedSubview(vibrationStackView)
        userDefaultsStackView.addArrangedSubview(chelengeStackView)
        userDefaultsContainerView.addSubview(userDefaultsStackView)
        vibrationStackView.translatesAutoresizingMaskIntoConstraints = false
        chelengeStackView.translatesAutoresizingMaskIntoConstraints = false
        userDefaultsStackView.translatesAutoresizingMaskIntoConstraints = false
        userDefaultsContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    func setConstraint() {
        NSLayoutConstraint.activate([
            backGraundImageView.topAnchor.constraint(equalTo: topAnchor),
            backGraundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGraundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGraundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titelLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titelLabel.topAnchor.constraint(equalTo: topAnchor, constant: spacingElements * 2),
            
            timeContainerView.topAnchor.constraint(equalTo: titelLabel.bottomAnchor, constant: spacingElements / 2),
            timeContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: spacingElements / 2),
            timeContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -spacingElements / 2),
            timeContainerView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            
            mainTimeStackView.topAnchor.constraint(equalTo: timeContainerView.topAnchor),
            mainTimeStackView.leadingAnchor.constraint(equalTo: timeContainerView.leadingAnchor, constant: spacingElements),
            mainTimeStackView.trailingAnchor.constraint(equalTo: timeContainerView.trailingAnchor, constant: -spacingElements),
            mainTimeStackView.bottomAnchor.constraint(equalTo: timeContainerView.bottomAnchor),
            mainTimeStackView.bottomAnchor.constraint(equalTo: timeContainerView.bottomAnchor, constant: -spacingElements/2),
            //MARK: MUSIKSTACK
            musikContainerView.topAnchor.constraint(equalTo: timeContainerView.bottomAnchor, constant: spacingElements/2),
            musikContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: spacingElements / 2),
            musikContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -spacingElements / 2),
            musikContainerView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            mainMusikStackView.topAnchor.constraint(equalTo: musikContainerView.topAnchor, constant: spacingElements/2),
            mainMusikStackView.bottomAnchor.constraint(equalTo: musikContainerView.bottomAnchor, constant: -spacingElements/2),
            mainMusikStackView.leadingAnchor.constraint(equalTo: musikContainerView.leadingAnchor, constant: spacingElements/2),
            mainMusikStackView.trailingAnchor.constraint(equalTo: musikContainerView.trailingAnchor, constant: -spacingElements/2),
            
            backgroundMusikPicker.widthAnchor.constraint(equalTo: backGroundMusikStackView.widthAnchor, multiplier: 0.3),
            tickMusikPicker.widthAnchor.constraint(equalTo: tickMusikStackView.widthAnchor, multiplier: 0.3),
            bomdExplosionMusikPicker.widthAnchor.constraint(equalTo: bombExplosionMusikStackView.widthAnchor, multiplier: 0.3),
            
            //MARK: USER_DEFAULT
            userDefaultsContainerView.topAnchor.constraint(equalTo: musikContainerView.bottomAnchor, constant: spacingElements/2),
            userDefaultsContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: spacingElements / 2),
            userDefaultsContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -spacingElements / 2),
            userDefaultsContainerView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
            
            
            
            
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

