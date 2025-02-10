//
//  ViewController.swift
//  Boom
//
//  Created by Игорь Клевжиц on 09.02.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "YellowBackground"))
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var settingsButtonNavBar: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Settings"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        let element = UIBarButtonItem(customView: button)
        return element
    }()
    
    private lazy var rulesButtonNavBar: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Rules"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        let element = UIBarButtonItem(customView: button)
        return element
    }()
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillProportionally
        element.spacing = spacingElements
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var labelStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillProportionally
        element.spacing = 5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameForLabel: UILabel = {
        let element = UILabel()
        element.text = "ИГРА ДЛЯ КОМПАНИИ"
        element.textColor = .black
        element.font = UIFont(name: Fonts.SFHeavy, size: 28)
        element.numberOfLines = 0
        element.textAlignment = .center
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowRadius = 5
        element.layer.shadowOpacity = 0.7
        element.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var nameGameLabel: UILabel = {
        let element = UILabel()
        element.text = "БОМБА"
        element.textColor = .black
        element.font = UIFont(name: Fonts.SFBlack, size: 48)
        element.textAlignment = .center
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowRadius = 5
        element.layer.shadowOpacity = 0.7
        element.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bombImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "bomb"))
        element.contentMode = .scaleAspectFit
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowRadius = 10
        element.layer.shadowOpacity = 0.5
        element.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillEqually
        element.spacing = spacingElements
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var startGameButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Старт игры", for: .normal)
        element.backgroundColor = UIColor(named: "MainButtons")
        element.titleLabel?.font = UIFont(name: Fonts.SFHeavy, size: 20)
        element.tintColor = UIColor(named: "TextColor")
        element.layer.cornerRadius = 10
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowRadius = 10
        element.layer.shadowOpacity = 0.5
        element.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var categoryButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Категории", for: .normal)
        element.backgroundColor = UIColor(named: "MainButtons")
        element.titleLabel?.font = UIFont(name: Fonts.SFHeavy, size: 20)
        element.tintColor = UIColor(named: "TextColor")
        element.layer.cornerRadius = 10
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowRadius = 10
        element.layer.shadowOpacity = 0.5
        element.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    private let spacingElements: CGFloat = 20
    private let heightButtons: CGFloat = 55
    
    // MARK: - Private Methods
    
    @objc private func ButtonTapped(_ sender: UIButton) {
        if sender.currentTitle == "Старт игры" {
            navigationController?.pushViewController(GameViewController(), animated: true)
        } else {
//        navigationController?.pushViewController(yourController(), animated: true)
        }
    }
    
    @objc private func settingsButtonTapped(_ sender: UIButton) {
//        let rulesVC = yourController()
//        navigationController?.pushViewController(yourController(), animated: true)
    }
    
    @objc private func rulesButtonTapped(_ sender: UIButton) {
//        let rulesVC = yourController()
//        navigationController?.pushViewController(yourController(), animated: true)
    }
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
    
}

private extension MainViewController {
    
    // MARK: - Set Views
    
    func setViews() {
        view.addSubview(backgroundImageView)
        
        navigationItem.leftBarButtonItem = settingsButtonNavBar
        navigationItem.rightBarButtonItem = rulesButtonNavBar
        
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(gameForLabel)
        labelStackView.addArrangedSubview(nameGameLabel)
        
        mainStackView.addArrangedSubview(bombImageView)
        
        mainStackView.addArrangedSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(startGameButton)
        buttonsStackView.addArrangedSubview(categoryButton)
        
        startGameButton.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacingElements),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingElements),
            labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingElements),
            labelStackView.heightAnchor.constraint(equalToConstant: 90),
            
            mainStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: spacingElements),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingElements),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingElements),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -spacingElements),
            
            startGameButton.heightAnchor.constraint(equalToConstant: heightButtons)
        ])
    }

}
