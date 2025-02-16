//
//  FinalGameView.swift
//  Boom
//
//  Created by Евгений on 10.02.2025.
//

import UIKit

final class FinalGameViewController: UIViewController {
    
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
    
    let mainView: FinalGameView = .init()
    let chalenge: String = ""
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = mainView.titelLabel
        navigationItem.leftBarButtonItem = backButton
        
        makeTask()
        makeButtonsActions()
    }
    
    func makeTask() {
        mainView.conditionLable.text = TaskModel.shared.getTask()
    }
    
    //MARK: ACTIONS
    
    func makeButtonsActions() {
        mainView.changeTaskButton.addTarget(self, action: #selector(changeTaskButtonTapped), for: .touchUpInside)
        mainView.restartButton.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)
    }
    
    @objc func changeTaskButtonTapped() {
        makeTask()
    }
    
    @objc func restartButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
