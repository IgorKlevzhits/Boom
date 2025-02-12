//
//  Extentions + UIKit.swift
//  Boom
//
//  Created by Игорь Клевжиц on 12.02.2025.
//
import UIKit

extension UIView {
    
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
    
}

extension UIButton {
    convenience init(title: String, backgroundColor: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.backgroundColor = UIColor(named: backgroundColor)
        self.titleLabel?.font = setFont(fontSize: 20, weight: .heavy)
        self.tintColor = UIColor(named: "TextColor")
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
