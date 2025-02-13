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
        mainView.backgroundMusikPicker.delegate = self
        mainView.backgroundMusikPicker.dataSource = self
        mainView.bomdExplosionMusikPicker.delegate = self
        mainView.bomdExplosionMusikPicker.dataSource = self
        mainView.tickMusikPicker.delegate = self
        mainView.tickMusikPicker.dataSource = self
        mainView.shortTimeButton.addTarget(self, action: #selector(shortTimeButtonTapped), for: .touchUpInside)
        mainView.mediumTimeButton.addTarget(self, action: #selector(mediumTimeButtonTapped), for: .touchUpInside)
        mainView.longTimeButton.addTarget(self, action: #selector(longTimeButtonTapped), for: .touchUpInside)
        mainView.randomTimeButton.addTarget(self, action: #selector(randomTimeButtonTapped), for: .touchUpInside)
        mainView.chelengeSwitch.isOn = true
        mainView.vibrationSwitch.isOn = true
        mainView.chelengeSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        mainView.vibrationSwitch.addTarget(self, action: #selector(vibrationTurn(_:)), for: .valueChanged)
    }
    @objc func shortTimeButtonTapped() {
        UserDefaults.standard.set(15, forKey: UserDefaultsKeys.totalTime)
    }
    @objc func mediumTimeButtonTapped() {
        UserDefaults.standard.set(30, forKey: UserDefaultsKeys.totalTime)
    }
    @objc func longTimeButtonTapped() {
        UserDefaults.standard.set(45, forKey: UserDefaultsKeys.totalTime)
    }
    @objc func randomTimeButtonTapped() {
        let randomInt = Int.random(in: 10...45)
        UserDefaults.standard.set(randomInt, forKey: UserDefaultsKeys.totalTime)
    }
    
    //MARK: SWITCHMETHOD
    @objc func switchChanged(_ sender: UISwitch) {
            if sender.isOn {
                UserDefaults.standard.set(true, forKey: UserDefaultsKeys.task)
            } else {
                UserDefaults.standard.set(false, forKey: UserDefaultsKeys.task)
            }
        }
    @objc func vibrationTurn(_ sender: UISwitch) {
            if sender.isOn {
                UserDefaults.standard.set(true, forKey: UserDefaultsKeys.vibration)
            } else {
                UserDefaults.standard.set(false, forKey: UserDefaultsKeys.vibration)
            }
        }
}
//MARK: PIKER DELEGATE
extension SettingsViewController: UIPickerViewDelegate {

        func pickerView(_ pickerView: UIPickerView,
                        didSelectRow row: Int,
                        inComponent component: Int) {
            switch pickerView {
            case mainView.backgroundMusikPicker: return UserDefaults.standard.set("\(BackgroundSoundModel.mocdata[row].titel)", forKey: UserDefaultsKeys.backgroundMusik)
            case mainView.tickMusikPicker: return UserDefaults.standard.set("\(SoundBombTimerModel.mocdata[row].titel)", forKey: UserDefaultsKeys.timerSound)
            case mainView.bomdExplosionMusikPicker: return UserDefaults.standard.set("\(SoundsBoomModel.mocdata[row].titel)", forKey: UserDefaultsKeys.explosionSound)
            default: break
            }
        }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int,
                    forComponent component: Int) -> NSAttributedString? {
            let title: String?
            switch pickerView {
            case mainView.backgroundMusikPicker:
                title = BackgroundSoundModel.mocdata[row].id
            case mainView.bomdExplosionMusikPicker:
                title = SoundsBoomModel.mocdata[row].id
            case mainView.tickMusikPicker:
                title = SoundBombTimerModel.mocdata[row].id
            default:
                title = nil
            }
            guard let unwrappedTitle = title else { return nil }
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 20)
            ]
            return NSAttributedString(string: unwrappedTitle, attributes: attributes)
        }
}
//MARK: PIKER DATA
extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case mainView.backgroundMusikPicker: return 1
        case mainView.bomdExplosionMusikPicker: return 1
        case mainView.tickMusikPicker: return 1
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case mainView.backgroundMusikPicker: return BackgroundSoundModel.mocdata.count
        case mainView.bomdExplosionMusikPicker: return SoundsBoomModel.mocdata.count
        case mainView.tickMusikPicker: return SoundBombTimerModel.mocdata.count
        default: return 0
        }
    }
    
    
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
