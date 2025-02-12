//
//  CategoryView.swift
//  Boom
//
//  Created by Игорь Клевжиц on 12.02.2025.
//
import UIKit

class CategoryView: UIView {
    
    func setupCategoryViews() {
        
        let view = UIView()
        view.backgroundColor = UIColor(named: "CategoryCellBackground")
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(systemName: "smile"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "О разном"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            view.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    init() {
        super.init(frame: .zero)
        sefup
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CategoryView {
    
    // MARK: - Set Views
    
    func setViews() {
        addSubview(<#T##view: UIView##UIView#>)
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }

}
