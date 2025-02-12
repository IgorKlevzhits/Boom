//
//  CategoryViewController.swift
//  Boom
//
//  Created by Игорь Клевжиц on 12.02.2025.
//
import UIKit

class CategoryViewController: UIViewController {
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        button.tintColor = UIColor(named: "TextColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }()
    
    private let categoryView: CategoryView = .init()
    
    override func loadView() {
        self.view = categoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = categoryView.titelLabel
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}
