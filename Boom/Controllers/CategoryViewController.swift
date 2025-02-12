//
//  CategoryViewController.swift
//  Boom
//
//  Created by Игорь Клевжиц on 12.02.2025.
//
import UIKit

class CategoryViewController: UIViewController {
    
    private let categoryView: CategoryView = .init()
    
    override func loadView() {
        self.view = categoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
