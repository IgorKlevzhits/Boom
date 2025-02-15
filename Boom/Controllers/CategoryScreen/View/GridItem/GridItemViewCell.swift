//
//  DemoCollectionViewCell.swift
//  Boom
//
//  Created by Сергей Хомиченко on 10.02.2025.
//
import UIKit

class DemoCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView = UIImageView()
    lazy var titleLabel = UILabel(text: "", size: 16, weight: .heavy)
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
    }
}

private extension DemoCollectionViewCell {
    
    func setView() {
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 2
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        
        setImageView()
        contentView.addSubview(titleLabel)
        setCheckImageView()
    }
    
    private func setImageView() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
    }
    
    private func setCheckImageView() {
        contentView.addSubview(checkImage)
        checkImage.image = UIImage(named: "CheckCircle")
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.contentMode = .scaleAspectFit
        checkImage.isUserInteractionEnabled = false
        checkImage.clipsToBounds = true
    }
    
    func setConstaints() {
        NSLayoutConstraint.activate([
            checkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            checkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
