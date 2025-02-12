//
//  CategoryView.swift
//  Boom
//
//  Created by Игорь Клевжиц on 12.02.2025.
//
import UIKit

class CategoryView: UIView {
    
    // MARK: - UI
    
    let titelLabel = UILabel(text: "Категории", size: 30, weight: .black)
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "WhiteBackground"))
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var categoryStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillEqually
        element.spacing = Sizes.spacingElements
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    private var checkmarkViews: [UIView: UIImageView] = [:]
    
    private let categories: [[(String, String)]] = [
        [("О разном", "face.smiling"), ("Спорт и Хобби", "sportscourt.circle")],
        [("Про жизнь", "message"), ("Знаменитости", "star")],
        [("Искусство и Кино", "photo.artframe.circle"), ("Природа", "leaf")]
    ]
    
    func setupCategoryViews() {
        
        for categoriesArray in categories {
            
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = Sizes.spacingElements
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            categoryStackView.addArrangedSubview(stackView)
            
            for (categoryName, systemImageName) in categoriesArray {
                let view = UIView()
                view.backgroundColor = UIColor(named: "CategoryCellBackground")
                view.layer.cornerRadius = 20
                view.layer.borderColor = UIColor.black.cgColor
                view.layer.borderWidth = 1
                view.translatesAutoresizingMaskIntoConstraints = false
                
                let checkmarkImageView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
                checkmarkImageView.tintColor = UIColor(named: "TextColor")
                checkmarkImageView.alpha = 0
                checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
                
                let imageView = UIImageView(image: UIImage(systemName: systemImageName))
                imageView.tintColor = UIColor(named: "TextColor")
                imageView.translatesAutoresizingMaskIntoConstraints = false
                
                let label = UILabel(text: categoryName, size: 16, weight: .heavy)
                
                view.addSubview(checkmarkImageView)
                view.addSubview(imageView)
                view.addSubview(label)
                
                stackView.addArrangedSubview(view)
                
                checkmarkViews[view] = checkmarkImageView
                
                NSLayoutConstraint.activate([
                    view.heightAnchor.constraint(equalTo: view.widthAnchor),
                    
                    checkmarkImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
                    checkmarkImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
                    checkmarkImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
                    checkmarkImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
                    
                    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
                    imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
                    
                    label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
                    label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                ])
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(categoryTapped(_:)))
                view.addGestureRecognizer(tapGesture)
                view.isUserInteractionEnabled = true
            }
        }
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setViews()
        setupConstraints()
        setupCategoryViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    @objc private func categoryTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view,
              let checkmarkImageView = checkmarkViews[tappedView] else { return }
        
        let isSelected = checkmarkImageView.alpha == 1 // Проверяем текущее состояние через `alpha`
        
        UIView.animate(withDuration: 0.3, animations: {
            checkmarkImageView.alpha = isSelected ? 0 : 1
            tappedView.backgroundColor = isSelected
            ? UIColor(named: "CategoryCellBackground")  // Исходный цвет
            : UIColor(named: "CategorySelectedCellBackground")  // Выбранный цвет
        })
    }
}

private extension CategoryView {
    
    // MARK: - Set Views
    
    func setViews() {
        addSubview(backgroundImageView)
        addSubview(categoryStackView)
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Sizes.spacingElements),
            categoryStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Sizes.spacingElements),
            categoryStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
