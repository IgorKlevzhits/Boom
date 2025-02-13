//
//  SettingsVC.swift
//  Boom
//
//  Created by Евгений on 11.02.2025.
//


import UIKit

class SettingsViewController: UIViewController {
    
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
    
    let mainView: SettingView = .init()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = mainView.titelLabel
        navigationItem.leftBarButtonItem = backButton
    }
    
    
}

extension SettingsViewController: UIPickerViewDelegate {
    
}
extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case mainView.backgroundMusikPicker: return 3
        case mainView.bomdExplosionMusikPicker: return 3
        case mainView.tickMusikPicker: return 3
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case mainView.backgroundMusikPicker: return 10
        case mainView.bomdExplosionMusikPicker: return 10
        case mainView.tickMusikPicker: return 10
        default: return 0
        }
    }
    
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
