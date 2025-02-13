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
        mainView.delegate = self
        
    }
    
    // MARK: - Delegate Methods
    
    func startGameButtonTapped() {
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
    
    func categoryButtonTapped() {
        navigationController?.pushViewController(GridViewController(), animated: true)
    }
    
    func settingsButtonTapped() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
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

