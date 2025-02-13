//
//  RullesViewController.swift
//  Boom
//
//  Created by Георгий  on 10.02.2025.
//

import UIKit

class RulesViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var rulesGameLabel: UILabel = {
        let element = UILabel()
        element.text = "Правила Игры"
        element.textColor = UIColor(named: "TextColor")
        element.textAlignment = .center
        element.font = UIFont(name: "SFProRounded-Heavy", size: 32)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var textStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fill
        element.spacing = spaceElements
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    // MARK: - Private Properties
    
    private let spaceElements: CGFloat = 10
    
    // MARK: - Life Cycle
    private func setupRules() {
        for (index,rule) in rulesArray.enumerated(){
            
            let ruleStackView = UIStackView()
            ruleStackView.axis = .horizontal
            ruleStackView.spacing = spaceElements
            ruleStackView.translatesAutoresizingMaskIntoConstraints = false
            
            let numberView = UIView()
            numberView.translatesAutoresizingMaskIntoConstraints = false
            
            let numberLabel = UILabel()
            numberLabel.text = "\(index+1)"
            numberLabel.textAlignment = .center
            numberLabel.font = UIFont(name: "SFProRounded-Heavy", size: 18)
            numberLabel.textColor = UIColor(named: "TextColor")
            numberLabel.layer.masksToBounds = true
            numberLabel.layer.cornerRadius = 15
            numberLabel.layer.borderWidth = 0.1
            numberLabel.layer.shadowOpacity = 0.1
            numberLabel.backgroundColor = UIColor(named: "MainBackground")
            numberLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let ruleLabel = UILabel()
            ruleLabel.text = rule
            ruleLabel.font = UIFont(name: "SFProRounded-Medium", size: 20)
            ruleLabel.textColor = UIColor(named: "TextColor")
            ruleLabel.numberOfLines = 0
            ruleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            ruleStackView.addArrangedSubview(numberView)
            numberView.addSubview(numberLabel)
            ruleStackView.addArrangedSubview(ruleLabel)
            
            numberLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
            numberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
            numberLabel.centerXAnchor.constraint(equalTo: numberView.centerXAnchor).isActive = true
            numberLabel.centerYAnchor.constraint(equalTo: numberView.centerYAnchor).isActive = true
            numberView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
            textStackView.alignment = .leading
            textStackView.addArrangedSubview(ruleStackView)
            
            if index == 1 {
                let fakeStartGameButton = UILabel()
                fakeStartGameButton.text = "Старт Игры"
                fakeStartGameButton.font = UIFont(name: "SFProRounded-Medium", size: 16)
                fakeStartGameButton.textColor = UIColor(named: "TextColor")
                fakeStartGameButton.backgroundColor = .white
                fakeStartGameButton.textAlignment = .center
                fakeStartGameButton.layer.masksToBounds = true
                fakeStartGameButton.layer.cornerRadius = 10
                fakeStartGameButton.translatesAutoresizingMaskIntoConstraints = false
                
                let fakeButtonStackView = UIStackView()
                fakeButtonStackView.axis = .horizontal
                fakeButtonStackView.spacing = spaceElements
                fakeButtonStackView.translatesAutoresizingMaskIntoConstraints = false
                
                let emptyView = UIView()
                emptyView.heightAnchor.constraint(equalToConstant: 44).isActive = true
                emptyView.widthAnchor.constraint(equalToConstant: 44).isActive = true
                emptyView.backgroundColor = .black
                emptyView.translatesAutoresizingMaskIntoConstraints = false
                
                let secondEmptyView = UIView()
                secondEmptyView.heightAnchor.constraint(equalToConstant: 44).isActive = true
                secondEmptyView.widthAnchor.constraint(equalToConstant: 44).isActive = true
                secondEmptyView.backgroundColor = .black
                secondEmptyView.translatesAutoresizingMaskIntoConstraints = false
                
                fakeButtonStackView.addArrangedSubview(emptyView)
                fakeButtonStackView.addArrangedSubview(fakeStartGameButton)
                fakeButtonStackView.addArrangedSubview(secondEmptyView)
                textStackView.addSubview(fakeButtonStackView)
                
                NSLayoutConstraint.activate([
                    fakeStartGameButton.heightAnchor.constraint(equalToConstant: 44),
                    fakeStartGameButton.centerXAnchor.constraint(equalTo: textStackView.centerXAnchor),
                    fakeStartGameButton.widthAnchor.constraint(equalToConstant: 200),
                    
//                    fakeButtonStackView.topAnchor.constraint(equalTo: ruleStackView.topAnchor, constant: 16),
                    fakeButtonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                    fakeButtonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                    fakeButtonStackView.bottomAnchor.constraint(equalTo: ruleStackView.bottomAnchor, constant: -16)
                    
                ])
            } else if index == 6 {
                let fullText = rule
                let purpleString = NSMutableAttributedString(string: fullText)
                let range = (fullText as NSString).range(of: "«С Заданиями»")
                purpleString.addAttribute(.foregroundColor, value: UIColor.purple, range: range)
                
                ruleLabel.attributedText = purpleString
            }
            }
    }
    private let rulesArray = ["Все игроки становятся в круг.",
                              "Первый игрок берет телефон и нажимает кнопку:",
                              "На экране появляется вопрос «Назовите фрукт»",
                              "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.",
                              "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.",
                              "Проигравшим считается тот, в чьих руках взорвалась бомба.",
                              "Если выбран режим игры «С Заданиями», то проигравший выполняет задание."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GameBackground")
        setViews()
        setupRules()
        setupConstraints()
    }
    
    // MARK: - Set Views
    
    private func setViews() {
        view.addSubview(rulesGameLabel)
        view.addSubview(textStackView)
        
    }
    
    // MARK: - Set Constraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            rulesGameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rulesGameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rulesGameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            rulesGameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            textStackView.topAnchor.constraint(equalTo: rulesGameLabel.bottomAnchor, constant: 16),
            textStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
              
        ])
    }
}

