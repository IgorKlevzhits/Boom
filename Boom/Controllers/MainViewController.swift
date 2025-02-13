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
    let defaults = UserDefaults.standard
    
    override func loadView() {
        self.view = mainView
        mainView.delegate = self // Почему в ЛоадВью загружаются методы, а не дид Лоад? (Бойтик)
        
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
        defaults.set("backgroundMusicOne", forKey: UserDefaultsKeys.backgroundMusik)
        defaults.set("bombTimerOne", forKey: UserDefaultsKeys.timerSound)
        defaults.set("boomOne", forKey: UserDefaultsKeys.explosionSound)
        defaults.set(true, forKey: UserDefaultsKeys.task)
        defaults.set(false, forKey: UserDefaultsKeys.vibration)
        defaults.set(15, forKey: UserDefaultsKeys.totalTime)
        
        navigationItem.leftBarButtonItem = mainView.settingsButtonNavBar
        navigationItem.rightBarButtonItem = mainView.rulesButtonNavBar
    }
    
}

