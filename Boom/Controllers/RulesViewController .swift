//
//  RulesViewController.swift
//  Boom
//
//  Created by Георгий on 10.02.2025.
//

import UIKit

class RulesViewController: UIViewController {
    
    // MARK: - UI Elements
    private let backgroundImageView = UIImageView(image: UIImage(named: "WhiteBackground"))
    
    private lazy var rulesGameLabel: UILabel = {
        let label = UILabel()
        label.text = "Правила Игры"
        label.textColor = UIColor(named: "TextColor")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = spaceElements
        return stackView
    }()
    
    // MARK: - Properties
    private let spaceElements: CGFloat = 10
    private let sizeNumberLabel: CGFloat = 30
    
    private let rulesArray = [
        "Все игроки становятся в круг.",
        "Первый игрок берет телефон и нажимает кнопку:",
        "На экране появляется вопрос «Назовите фрукт»",
        "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.",
        "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.",
        "Проигравшим считается тот, в чьих руках взорвалась бомба.",
        "Если выбран режим игры «С Заданиями», то проигравший выполняет задание."
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupRules()
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    private func setupRules() {
        for (index, rule) in rulesArray.enumerated() {
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
                let fakeStartGameButton = UIButton(title: "Зпустить", backgroundColor: "YellowButton")

                let fakeButtonStackView = UIStackView()
                fakeButtonStackView.axis = .horizontal
                fakeButtonStackView.spacing = spaceElements
                fakeButtonStackView.alignment = .center
                fakeButtonStackView.distribution = .fillEqually
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
                    fakeButtonStackView.trailingAnchor.constraint(equalTo: textStackView.trailingAnchor)
                ])
            }
        }
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(rulesGameLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textStackView)
    }
    
    private func setupConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        rulesGameLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            rulesGameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Sizes.spacingElements),
            rulesGameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: rulesGameLabel.bottomAnchor, constant: Sizes.spacingElements),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            textStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            textStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.spacingElements),
            textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.spacingElements),
            textStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Sizes.spacingElements)
        ])
    }
}
