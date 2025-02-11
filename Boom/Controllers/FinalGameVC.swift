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
        makeTask()
        changeTaskButton()
        restartButton()
    }
    
    func makeTask() {
        if let task = TaskModel().task.randomElement( ) {
            mainView.conditionLable.text = task.description
        } 
    }
    
    //MARK: ACTIONS
    
    func changeTaskButton() {
        mainView.changeTaskButton.addTarget(self, action: #selector(changeTask), for: .touchUpInside)
    }
    @objc private func changeTask() {
        makeTask()
    }
    
    func restartButton() {
        mainView.restartButton.addTarget(self, action: #selector(startAgain), for: .touchUpInside)
    }
    
    @objc private func startAgain() {
        navigationController?.popViewController(animated: true)
    }
}
