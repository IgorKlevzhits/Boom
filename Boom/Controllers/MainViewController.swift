//
//  ViewController.swift
//  Boom
//
//  Created by Игорь Клевжиц on 09.02.2025.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func startGameButtonTapped()
    func categoryButtonTapped()
    func settingsButtonTapped()
    func rulesButtonTapped()
}

class MainViewController: UIViewController, MainViewDelegate {
    
    private let mainView: MainView = .init()
    
    override func loadView() {
        self.view = mainView
        mainView.delegate = self // Почему в ЛоадВью загружаются методы, а не дид Лоад? (Бойтик)
        
    }
    
    // MARK: - Delegate Methods
    
    func startGameButtonTapped() {
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
    
    func categoryButtonTapped() {
        navigationController?.pushViewController(CategoryViewController(), animated: true)
    }
    
    func settingsButtonTapped() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    func rulesButtonTapped() {
        let rulesVC = RulesViewController()
        if let sheet = rulesVC.sheetPresentationController {
            let customDetent = UISheetPresentationController.Detent.custom { context in
                return context.maximumDetentValue * 0.75
            }
            sheet.detents = [customDetent]
            sheet.prefersGrabberVisible = true
        }
        rulesVC.modalPresentationStyle = .pageSheet
        present(rulesVC, animated: true, completion: nil)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = mainView.settingsButtonNavBar
        navigationItem.rightBarButtonItem = mainView.rulesButtonNavBar
    }
    
}

