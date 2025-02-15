//
//  CategoryRules.swift
//  Boom
//
//  Created by Сергей Хомиченко on 14.02.2025.
//
import UIKit

class CategoryRulesViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "OrangeBackround"))
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
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Sizes.spacingElements
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let rulesTitleLabel = UILabel(text: "Правила игры", size: 30, weight: .black)
    
    private let mainRuleLabel: UILabel = {
        let label = UILabel()
        label.text = "В игре доступно 6 категорий и более 90 вопросов."
        label.font = UIFont.setFont(fontSize: 24, weight: .bold)
        label.textColor = UIColor(named: "TextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 5
        label.layer.shadowOpacity = 0.7
        label.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        return label
    }()
    
    private let subRuleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите категорию и нажмите \"Начать игру\"."
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = UIColor(named: "TextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    private let topCategoryStackView = UIStackView(axis: .horizontal)
    
    private let allImageView = CategoryCell(title: "О разном", image: "smile")
    private let sportImageView = CategoryCell(title: "Хобби и спорт", image: "hobby")
    
    private let bottomCategoryStackView = UIStackView(axis: .horizontal)
    
    private let lifeImageView = CategoryCell(title: "Про жизнь", image: "life")
    private let starImageView = CategoryCell(title: "influencer", image: "smile")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setConstraints()
    }
}

extension CategoryRulesViewController {
    
    func setView() {
        view.addSubview(backgroundImageView)
        view.addSubview(rulesTitleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(mainRuleLabel)
        mainStackView.addArrangedSubview(subRuleLabel)
        
        mainStackView.addArrangedSubview(topCategoryStackView)
        topCategoryStackView.addArrangedSubview(allImageView)
        topCategoryStackView.addArrangedSubview(sportImageView)
        
        mainStackView.addArrangedSubview(bottomCategoryStackView)
        bottomCategoryStackView.addArrangedSubview(lifeImageView)
        bottomCategoryStackView.addArrangedSubview(starImageView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            rulesTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Sizes.spacingElements),
            rulesTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: rulesTitleLabel.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Sizes.spacingElements),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.spacingElements),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.spacingElements),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            allImageView.widthAnchor.constraint(equalTo: topCategoryStackView.widthAnchor, multiplier: 0.45),
            allImageView.heightAnchor.constraint(equalTo: allImageView.widthAnchor),
            
            sportImageView.widthAnchor.constraint(equalTo: topCategoryStackView.widthAnchor, multiplier: 0.45),
            sportImageView.heightAnchor.constraint(equalTo: sportImageView.widthAnchor),
            
            lifeImageView.widthAnchor.constraint(equalTo: bottomCategoryStackView.widthAnchor, multiplier: 0.45),
            lifeImageView.heightAnchor.constraint(equalTo: lifeImageView.widthAnchor),
            
            starImageView.widthAnchor.constraint(equalTo: bottomCategoryStackView.widthAnchor, multiplier: 0.45),
            starImageView.heightAnchor.constraint(equalTo: starImageView.widthAnchor)
        ])
    }
}
