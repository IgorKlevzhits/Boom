//
//  SettingsVC.swift
//  Boom
//
//  Created by Евгений on 11.02.2025.
//


import UIKit

class SettingsVC: UIViewController {
    let mainView: SettingView = .init()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = mainView.titelLabel
        
    }
    
    
}

extension SettingsVC: UIPickerViewDelegate {
    
}
extension SettingsVC: UIPickerViewDataSource {
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
    
    
}
