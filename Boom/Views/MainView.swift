//
//  MainView.swift
//  Boom
//
//  Created by Игорь Клевжиц on 11.02.2025.
//
import UIKit


class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    // MARK: - UI
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "YellowBackground"))
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var settingsButtonNavBar: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Settings"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: sizeNavigationButtons).isActive = true
        button.heightAnchor.constraint(equalToConstant: sizeNavigationButtons).isActive = true
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        let element = UIBarButtonItem(customView: button)
        return element
    }()
    
    lazy var rulesButtonNavBar: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Rules"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: sizeNavigationButtons).isActive = true
        button.heightAnchor.constraint(equalToConstant: sizeNavigationButtons).isActive = true
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
        element.font = setFont(fontSize: 28, weight: .heavy)
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
        element.font = setFont(fontSize: 48, weight: .black)
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
        element.titleLabel?.font = setFont(fontSize: 20, weight: .heavy)
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
        element.titleLabel?.font = setFont(fontSize: 20, weight: .heavy)
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
    private let sizeNavigationButtons: CGFloat = 35
    private let heightLabelStackView: CGFloat = 90
    
    // MARK: - Private Methods
    
    func setFont(fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: weight)
        
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: fontSize)
        } else {
            font = systemFont
        }
        return font
    }
    
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

private extension MainView {
    
    // MARK: - Set Views
    
    func setViews() {
        addSubview(backgroundImageView)
        
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(gameForLabel)
        labelStackView.addArrangedSubview(nameGameLabel)
        
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
            
            labelStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: spacingElements),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacingElements),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacingElements),
            labelStackView.heightAnchor.constraint(equalToConstant: heightLabelStackView),
            
            mainStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: spacingElements),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacingElements),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacingElements),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -spacingElements),
            
            startGameButton.heightAnchor.constraint(equalToConstant: heightButtons)
        ])
    }

}
