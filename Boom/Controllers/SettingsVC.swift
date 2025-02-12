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
        
    }
    
    
}

//extension SettingsVC: UIPickerViewDelegate {
//    
//}
//extension SettingsVC: UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        switch pickerView {
//        case mainView.backgroundMusikPicker: return 1
//        case mainView.bomdExplosionMusikPicker: return 1
//        case mainView.tickMusikPicker: return 1
//        default: return 0
//        }
//    }
//    
//    func pickerView(_ pickerView: UIPickerView,
//                    numberOfRowsInComponent component: Int) -> Int {
//        <#code#>
//    }
//    
//    
//}
