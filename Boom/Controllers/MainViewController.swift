//
//  ViewController.swift
//  Boom
//
//  Created by Игорь Клевжиц on 09.02.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI
    
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
        element.font = .systemFont(ofSize: 48, weight: .bold)
        element.textAlignment = .center
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
    private let heightButtons: CGFloat = 80
    
    // MARK: - Private Methods
    
    @objc private func nextViewButtonTapped(_ sender: UIButton) {
//        navigationController?.pushViewController(yourController(), animated: true)
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
        view.addSubview(gameForLabel)
        view.addSubview(nameGameLabel)
        view.addSubview(bombImageView)
        view.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(startGameButton)
        buttonsStackView.addArrangedSubview(categoryButton)
        
//        startGameButton.addTarget(self, action: #selector(nextViewButtonTapped), for: .touchUpInside)
        let rulesButton = UIBarButtonItem()
        rulesButton.title = "?"
        navigationItem.rightBarButtonItem = rulesButton
        
        rulesButton.action = #selector(rulesButtonTapped)
//        navigationController?.navigationItem.rightBarButtonItem =
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gameForLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacingElements),
            gameForLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingElements),
            gameForLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingElements),
            
            nameGameLabel.topAnchor.constraint(equalTo: gameForLabel.bottomAnchor, constant: spacingElements),
            nameGameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingElements),
            nameGameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingElements),
            
            bombImageView.topAnchor.constraint(equalTo: nameGameLabel.bottomAnchor, constant: spacingElements),
            bombImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingElements),
            bombImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingElements),
            bombImageView.heightAnchor.constraint(equalTo: bombImageView.widthAnchor),
            
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -spacingElements),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingElements),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingElements),
            
            startGameButton.heightAnchor.constraint(equalToConstant: heightButtons),
            categoryButton.heightAnchor.constraint(equalToConstant: heightButtons),
        ])
    }

}
