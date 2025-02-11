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
    
    let mainView: MainView = .init()
    
    override func loadView() {
        self.view = mainView
        mainView.delegate = self
    }
    
    // MARK: - Delegate Methods
    
    func startGameButtonTapped() {
        // Переход на экран с игрой
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
    
    func categoryButtonTapped() {
        // Переход на экран с категориями
        // navigationController?.pushViewController(YourCategoryController(), animated: true)
    }
    
    func settingsButtonTapped() {
        //        let rulesVC = yourController()
        //        navigationController?.pushViewController(yourController(), animated: true)
    }
    
    func rulesButtonTapped() {
        //        let rulesVC = yourController()
        //        navigationController?.pushViewController(yourController(), animated: true)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = mainView.settingsButtonNavBar
        navigationItem.rightBarButtonItem = mainView.rulesButtonNavBar
    }
    
}

