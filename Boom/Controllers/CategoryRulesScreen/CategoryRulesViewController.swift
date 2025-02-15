//
//  CategoryRules.swift
//  Boom
//
//  Created by Сергей Хомиченко on 14.02.2025.
//
import UIKit

class CategoryRulesViewController: UIViewController {
    
    private let backgroundImageView = UIImageView(image: "OrangeBackround")
    
    // MARK: проверить привязку
    private let rulesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Правила игры"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let mainRuleLabel: UILabel = {
        let label = UILabel()
        label.text = "В игре доступно 6 категорий и более 90 вопросов."
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    private let subRuleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите категорию и нажмите \"Начать игру\"."
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    private let allImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "CategoryAll")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let sportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "CategorySport")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let lifeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "CategoryLife")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "CategoryStar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        
        setView()
        setConstaints()
    }
}

extension CategoryRulesViewController {
    
    func setView() {
        view.addSubview(rulesTitleLabel)
        view.addSubview(mainRuleLabel)
        view.addSubview(subRuleLabel)
        view.addSubview(allImageView)
        view.addSubview(sportImageView)
        view.addSubview(lifeImageView)
        view.addSubview(starImageView)
    }
    
    func setConstaints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            rulesTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            rulesTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainRuleLabel.topAnchor.constraint(equalTo: rulesTitleLabel.bottomAnchor, constant: 20),
            mainRuleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            mainRuleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            subRuleLabel.topAnchor.constraint(equalTo: mainRuleLabel.bottomAnchor, constant: 30),
            subRuleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            subRuleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            allImageView.topAnchor.constraint(equalTo: subRuleLabel.bottomAnchor, constant: 25),
            allImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            allImageView.trailingAnchor.constraint(equalTo: sportImageView.leadingAnchor, constant: -6),
            
            sportImageView.topAnchor.constraint(equalTo: subRuleLabel.bottomAnchor, constant: 25),
            sportImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            sportImageView.leadingAnchor.constraint(equalTo: allImageView.trailingAnchor, constant: 6),
            
            lifeImageView.topAnchor.constraint(equalTo: sportImageView.bottomAnchor),
            lifeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            lifeImageView.trailingAnchor.constraint(equalTo: starImageView.leadingAnchor, constant: -6),
            
            starImageView.topAnchor.constraint(equalTo: sportImageView.bottomAnchor),
            starImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            starImageView.leadingAnchor.constraint(equalTo: lifeImageView.trailingAnchor, constant: 6),
        ])
    }
}
