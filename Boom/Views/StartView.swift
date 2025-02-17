//
//  StartView.swift
//  Boom
//
//  Created by Игорь Клевжиц on 11.02.2025.
//
import UIKit


final class StartView: UIView {
    
    weak var delegate: StartViewDelegate?
    
    // MARK: - UI
    
    private let backgroundImageView = UIImageView(image: "YellowBackground")
    
    lazy var settingsButtonNavBar: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Settings"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: Sizes.sizeNavigationButtons).isActive = true
        button.heightAnchor.constraint(equalToConstant: Sizes.sizeNavigationButtons).isActive = true
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        let element = UIBarButtonItem(customView: button)
        return element
    }()
    
    lazy var rulesButtonNavBar: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Rules"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: Sizes.sizeNavigationButtons).isActive = true
        button.heightAnchor.constraint(equalToConstant: Sizes.sizeNavigationButtons).isActive = true
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        let element = UIBarButtonItem(customView: button)
        return element
    }()
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillProportionally
        element.spacing = Sizes.spacingElements
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
        element.font = UIFont.setFont(fontSize: 28, weight: .heavy)
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
        element.font = UIFont.setFont(fontSize: 48, weight: .black)
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
        element.spacing = Sizes.spacingElements
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let startGameButton = UIButton(title: "Старт игры", backgroundColor: "WhiteButton")
    private let categoryButton = UIButton(title: "Категории", backgroundColor: "WhiteButton")
    
    // MARK: - Private Properties
    
    private let heightLabelStackView: CGFloat = 90
    
    // MARK: - Private Methods
    
    @objc private func settingsButtonTapped(_ sender: UIButton) {
        delegate?.settingsButtonTapped()
    }
    
    @objc private func rulesButtonTapped(_ sender: UIButton) {
        delegate?.rulesButtonTapped()
    }
    
    @objc private func startGameButtonTapped(_ sender: UIButton) {
        delegate?.startGameButtonTapped()
    }
    
    @objc private func categoryButtonTapped(_ sender: UIButton) {
        delegate?.categoryButtonTapped()
    }
    
    init() {
        super.init(frame: .zero)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension StartView {
    
    // MARK: - Set Views
    
    func setViews() {
        addSubview(backgroundImageView)
        
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(gameForLabel)
        labelStackView.addArrangedSubview(nameGameLabel)
        
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(bombImageView)
        
        mainStackView.addArrangedSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(startGameButton)
        buttonsStackView.addArrangedSubview(categoryButton)
        
        startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            labelStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Sizes.spacingElements),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Sizes.spacingElements),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Sizes.spacingElements),
            labelStackView.heightAnchor.constraint(equalToConstant: heightLabelStackView),
            
            mainStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: Sizes.spacingElements),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Sizes.spacingElements),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Sizes.spacingElements),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Sizes.spacingElements),
            
            startGameButton.heightAnchor.constraint(equalToConstant: Sizes.heightButtons)
        ])
    }
}
