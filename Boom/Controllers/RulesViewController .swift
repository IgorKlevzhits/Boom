//
//  RulesViewController.swift
//  Boom
//
//  Created by Георгий on 10.02.2025.
//

import UIKit

class RulesViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "WhiteBackground"))
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
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
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = spaceElements
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Properties
    private let spaceElements: CGFloat = 10
    private let sizeNumberLabel: CGFloat = 30
    
    private let rulesClassicArray = [
        "Все игроки становятся в круг.",
        "Первый игрок берет телефон и нажимает кнопку:",
        "На экране появляется вопрос «Назовите фрукт»",
        "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.",
        "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.",
        "Проигравшим считается тот, в чьих руках взорвалась бомба.",
        "Если выбран режим игры «С Заданиями», то проигравший выполняет задание."
    ]
    
    private let rulesHotPotatoArray = [
        "В этом режиме, больше не влияет удача. Всё зависит от вас!",
        "Теперь после каждого ответа, перед тем как отдать телефон игрок должен успеть нажать кнопку:",
        "Игра будет закончена после того как не успеет ответить за отведённое лично ему время!"
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupRules(rulesClassicArray, title: "Правила классической игры", textButton: "Запустить")
        setupRules(rulesHotPotatoArray, title: "Правила режима горячая картошка", textButton: "Ответил")
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    private func setupRules(_ array: [String], title: String, textButton: String) {
        
        let rulesGameLabel: UILabel = {
            let label = UILabel()
            label.text = title
            label.textColor = UIColor(named: "TextColor")
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        textStackView.addArrangedSubview(rulesGameLabel)
        
        for (index, rule) in array.enumerated() {
            let ruleStackView = UIStackView()
            ruleStackView.axis = .horizontal
            ruleStackView.spacing = spaceElements
            ruleStackView.alignment = .top
            ruleStackView.translatesAutoresizingMaskIntoConstraints = false

            let numberView = UIView()
            numberView.layer.shadowColor = UIColor.black.cgColor
            numberView.layer.shadowOpacity = 0.5
            numberView.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
            numberView.layer.shadowRadius = 4
            numberView.backgroundColor = .clear

            let numberLabel = UILabel()
            numberLabel.text = "\(index + 1)"
            numberLabel.textAlignment = .center
            numberLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
            numberLabel.textColor = UIColor(named: "TextColor")
            numberLabel.layer.cornerRadius = sizeNumberLabel / 2
            numberLabel.clipsToBounds = true
            numberLabel.backgroundColor = UIColor(named: "YellowButton")

            numberView.addSubview(numberLabel)
            ruleStackView.addArrangedSubview(numberView)

            let ruleLabel = UILabel()
            ruleLabel.text = rule
            ruleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            ruleLabel.textColor = UIColor(named: "TextColor")
            ruleLabel.numberOfLines = 0
            ruleLabel.lineBreakMode = .byWordWrapping
            ruleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

            if index == 6 {
                let attributedText = NSMutableAttributedString(string: rule)
                let range = (rule as NSString).range(of: "«С Заданиями»")
                attributedText.addAttribute(.foregroundColor, value: UIColor.purple, range: range)
                ruleLabel.attributedText = attributedText
            }

            ruleStackView.addArrangedSubview(ruleLabel)
            textStackView.addArrangedSubview(ruleStackView)

            numberLabel.translatesAutoresizingMaskIntoConstraints = false
            numberView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                numberLabel.widthAnchor.constraint(equalToConstant: sizeNumberLabel),
                numberLabel.heightAnchor.constraint(equalToConstant: sizeNumberLabel),
                numberLabel.centerXAnchor.constraint(equalTo: numberView.centerXAnchor),
                numberLabel.centerYAnchor.constraint(equalTo: numberView.centerYAnchor),
                
                numberView.widthAnchor.constraint(equalToConstant: sizeNumberLabel),
                numberView.heightAnchor.constraint(equalToConstant: sizeNumberLabel)
            ])

            if index == 1 {
                let fakeStartGameButton = UIButton(title: textButton, backgroundColor: "YellowButton")

                let fakeButtonStackView = UIStackView()
                fakeButtonStackView.axis = .horizontal
                fakeButtonStackView.spacing = spaceElements
                fakeButtonStackView.alignment = .center
                fakeButtonStackView.distribution = .fill
                fakeButtonStackView.translatesAutoresizingMaskIntoConstraints = false

                let emptyView = UIView()
                emptyView.translatesAutoresizingMaskIntoConstraints = false

                let secondEmptyView = UIView()
                secondEmptyView.translatesAutoresizingMaskIntoConstraints = false

                fakeButtonStackView.addArrangedSubview(emptyView)
                fakeButtonStackView.addArrangedSubview(fakeStartGameButton)
                fakeButtonStackView.addArrangedSubview(secondEmptyView)

                textStackView.addArrangedSubview(fakeButtonStackView)

                NSLayoutConstraint.activate([
                    fakeStartGameButton.heightAnchor.constraint(equalToConstant: 44),

                    fakeButtonStackView.leadingAnchor.constraint(equalTo: textStackView.leadingAnchor),
                    fakeButtonStackView.trailingAnchor.constraint(equalTo: textStackView.trailingAnchor),
                    emptyView.widthAnchor.constraint(equalTo: textStackView.widthAnchor, multiplier: 0.25),
                    secondEmptyView.widthAnchor.constraint(equalTo: textStackView.widthAnchor, multiplier: 0.25),
                    fakeStartGameButton.widthAnchor.constraint(equalTo: textStackView.widthAnchor, multiplier: 0.5),
                ])
            }
        }
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textStackView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            textStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Sizes.spacingElements),
            textStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.spacingElements),
            textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.spacingElements),
            textStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Sizes.spacingElements)
        ])
    }
}
