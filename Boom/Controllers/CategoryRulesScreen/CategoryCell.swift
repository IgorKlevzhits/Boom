//
//  CategoryCell.swift
//  Boom
//
//  Created by Игорь Клевжиц on 15.02.2025.
//
import UIKit

final class CategoryCell: UIView {
    lazy var imageView = UIImageView()
    lazy var titleLabel = UILabel(text: "", size: 16, weight: .heavy)
    lazy var checkImage = UIImageView()
    
    init(title: String, image: String) {
        super.init(frame: .zero)
        imageView.image = UIImage(named: image)
        titleLabel.text = title
        setView()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setView() {
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        backgroundColor = UIColor(named: "CategoryCellBackground")
        setImageView()
        addSubview(titleLabel)
        setCheckImageView()
    }
    
    private func setImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
    }
    
    private func setCheckImageView() {
        addSubview(checkImage)
        checkImage.image = UIImage(named: "CheckCircle")
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.contentMode = .scaleAspectFit
        checkImage.isUserInteractionEnabled = false
        checkImage.clipsToBounds = true
    }
    
    func setConstaints() {
        NSLayoutConstraint.activate([
            checkImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            checkImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
