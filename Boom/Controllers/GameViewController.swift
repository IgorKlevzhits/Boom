//
//  GameViewController.swift
//  Boom
//
//  Created by Artem Kriukov on 10.02.2025.
//

import UIKit

class GameViewController: UIViewController {
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Нажмите “Запустить” чтобы начать игру"
        element.numberOfLines = 0
        element.textColor = UIColor(named: "TextColor")
        element.textAlignment = .center
        element.font = UIFont(name: Fonts.SFMedium, size: 28)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bombImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "bombForGame"))
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var startGameButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Запустить", for: .normal)
        element.titleLabel?.font = UIFont(name: Fonts.SFHeavy, size: 20)
        element.tintColor = UIColor(named: "TextColor")
        element.backgroundColor = UIColor(named: "GameButtons")
        element.layer.cornerRadius = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var pauseButtonNavBar: UIBarButtonItem = {
        let element = UIBarButtonItem()
        element.image = UIImage(systemName: "pause.circle")
        element.tintColor = UIColor(named: "TextColor")
        return element
    }()
    
    private lazy var titleNavBar: UILabel = {
        let element = UILabel()
        element.text = "Игра"
        element.font = UIFont(name: Fonts.SFBlack, size: 30)
        element.textColor = .black
        return element
    }()
    
    private lazy var backButtonNavBar: UIBarButtonItem = {
        let element = UIBarButtonItem()
        element.image = UIImage(systemName: "chevron.backward")
        element.tintColor = UIColor(named: "TextColor")
        element.target = self
        element.action = #selector(backButtonTapped)
        return element
    }()
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
}

private extension GameViewController {
    
    // MARK: - Set Views
    
    func setViews() {
        view.addSubview(titleLabel)
        view.addSubview(bombImageView)
        view.addSubview(startGameButton)
        
        navigationItem.rightBarButtonItem = pauseButtonNavBar
        navigationItem.titleView = titleNavBar
        navigationItem.leftBarButtonItem = backButtonNavBar
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            
            bombImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bombImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bombImageView.widthAnchor.constraint(equalToConstant: 312),
            bombImageView.heightAnchor.constraint(equalToConstant: 352),
            
            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -28),
            startGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23),
            startGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -23),
            startGameButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

}
