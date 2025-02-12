//
//  DemoCollectionViewCell.swift
//  Boom
//
//  Created by Сергей Хомиченко on 10.02.2025.
//
import UIKit

class DemoCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var stackView = UIStackView()
    lazy var checkImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setView()
        setConstaints()
    }
    
    func configure(with category: CategoryItem) {
        imageView.image = UIImage(named: category.iconName)
        titleLabel.text = category.title
        checkImage.isHidden = !category.isSelected
        
        contentView.backgroundColor = category.isSelected ? UIColor(named: "CategorySelectedCellBackground") : UIColor(named: "CategoryCellBackground")
        titleLabel.textColor = .black
    }
}

private extension DemoCollectionViewCell {
    
    func setView() {
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 2

        setStackView()
        setImageView()
        setTitleLabelView()
        setCheckImageView()
    }
    
    private func setStackView() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.distribution = .equalCentering
        stackView.alignment = .center
    }
    
    private func setTitleLabelView() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setImageView() {
        stackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
    }
    
    private func setCheckImageView() {
        stackView.addSubview(checkImage)
        checkImage.image = UIImage(named: "CheckCircle")
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.contentMode = .scaleAspectFit
        checkImage.isUserInteractionEnabled = false
        checkImage.clipsToBounds = true
    }
    
    func setConstaints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 30),
            
//            // не работает
//            titleLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            
            checkImage.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 8),
            checkImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
        ])
    }
}
