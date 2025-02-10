//
//  FinalGameView.swift
//  Boom
//
//  Created by Евгений on 10.02.2025.
//

import UIKit

class FinalGameVC: UIViewController {
    let mainView: FinalGameView = .init()
    let chalenge: String = ""
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTask()
        startAgain()
    }
    @objc private func changeTask() { // Сохранение данных?
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    @objc private func startAgain() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
}
