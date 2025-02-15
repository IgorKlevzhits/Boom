//
//  Extentions + UIKit.swift
//  Boom
//
//  Created by Игорь Клевжиц on 12.02.2025.
//
import UIKit

extension UIFont {
    static func setFont(fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: weight)
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: descriptor, size: fontSize)
        } else {
            return systemFont
        }
    }
}

extension UIButton {
    convenience init(title: String, backgroundColor: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.backgroundColor = UIColor(named: backgroundColor)
        self.titleLabel?.font = UIFont.setFont(fontSize: 20, weight: .heavy)
        self.tintColor = UIColor(named: "TextColor")
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(text: String, size: CGFloat, weight: UIFont.Weight) {
        self.init()
        self.text = text
        self.font = UIFont.setFont(fontSize: size, weight: weight)
        self.textColor = UIColor(named: "TextColor")
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(named: "TextColor")
        self.titleLabel?.font = UIFont.setFont(fontSize: 20, weight: .heavy)
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init()
        self.axis = axis
        self.distribution = .fillEqually
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    convenience init(radius: CGFloat) {
        self.init()
        self.layer.cornerRadius = radius
        self.backgroundColor = UIColor(named: "CategoryCellBackground")
        self.layer.borderColor = UIColor(named: "TextColor")?.cgColor
        self.layer.borderWidth = 1
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.textColor = .white
        self.font = UIFont.setFont(fontSize: 20, weight: .heavy)
        self.textAlignment = .left
        self.backgroundColor = UIColor(named: "TextColor")
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStackView {
    convenience init(distribution: UIStackView.Distribution) {
        self.init()
        self.axis = .horizontal
        self.distribution = distribution
        self.backgroundColor = UIColor(named: "TextColor")
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImageView {
    convenience init(image: String) {
        self.init(image: UIImage(named: image))
        self.contentMode = .scaleAspectFill
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
