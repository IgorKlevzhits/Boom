//
//  ViewController.swift
//  Boom
//
//  Created by Игорь Клевжиц on 09.02.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillProportionally
        element.spacing = spacingElements
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameForLabel: UILabel = {
        let element = UILabel()
        element.text = "ИГРА ДЛЯ КОМПАНИИ"
        element.textColor = .black
        element.font = .systemFont(ofSize: 28, weight: .bold)
        element.numberOfLines = 0
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var nameGameLabel: UILabel = {
        let element = UILabel()
        element.text = "БОМБА"
        element.textColor = .black
        element.font = UIFont(name: "SFProRounded-Black", size: 48)
        element.textAlignment = .center
//        element.shadowColor = .lightGray
//        element.layer.shadowRadius = 100
//        element.shadowOffset = CGSize(width: 3, height: 3)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bombImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "bomb"))
        element.contentMode = .scaleAspectFit
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
        element.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        element.tintColor = UIColor(named: "TextColor")
        element.layer.cornerRadius = spacingElements
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var categoryButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Категории", for: .normal)
        element.backgroundColor = UIColor(named: "MainButtons")
        element.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        element.tintColor = UIColor(named: "TextColor")
        element.layer.cornerRadius = spacingElements
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    private let spacingElements: CGFloat = 20
    private let heightButtons: CGFloat = 55
    
    // MARK: - Private Methods
    
    @objc private func ButtonTapped(_ sender: UIButton) {
        if sender.currentTitle == "Старт игры" {
            navigationController?.pushViewController(CategoryViewController(), animated: true)
        } else {
//        navigationController?.pushViewController(yourController(), animated: true)
        }
    }
    
    @objc private func rulesButtonTapped(_ sender: UIButton) {
//        let rulesVC = yourController()
//        navigationController?.pushViewController(yourController(), animated: true)
    }
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "MainBackground")
        setViews()
        setupConstraints()
    }
    
}

private extension MainViewController {
    
    // MARK: - Set Views
    
    func setViews() {
        navigationController?.navigationBar.isHidden = false
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(gameForLabel)
        mainStackView.addArrangedSubview(nameGameLabel)
        mainStackView.addArrangedSubview(bombImageView)
        mainStackView.addArrangedSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(startGameButton)
        buttonsStackView.addArrangedSubview(categoryButton)
        
        startGameButton.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        
        let rulesButton = UIBarButtonItem()
        rulesButton.title = "?"
        navigationItem.rightBarButtonItem = rulesButton
        
        rulesButton.action = #selector(rulesButtonTapped)
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacingElements),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingElements),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingElements),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -spacingElements),
            
            startGameButton.heightAnchor.constraint(equalToConstant: heightButtons)
        ])
    }

}
