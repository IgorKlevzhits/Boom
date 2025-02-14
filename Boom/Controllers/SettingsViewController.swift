//
//  SettingsVC.swift
//  Boom
//
//  Created by Евгений on 11.02.2025.
//


import UIKit
import AVFoundation

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
    var audioPlayer: AVAudioPlayer?
    var stopTimer: Timer?
    let gameModes = ["Классика", "Горячая картошка"]
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = mainView.titelLabel
        navigationItem.leftBarButtonItem = backButton
        mainView.gameModePicker.delegate = self
        mainView.gameModePicker.delegate = self
        mainView.backgroundMusikPicker.delegate = self
        mainView.backgroundMusikPicker.dataSource = self
        mainView.bomdExplosionMusikPicker.delegate = self
        mainView.bomdExplosionMusikPicker.dataSource = self
        mainView.tickMusikPicker.delegate = self
        mainView.tickMusikPicker.dataSource = self
        mainView.shortTimeButton.addTarget(self, action: #selector(shortTimeButtonTapped), for: .touchUpInside)
        mainView.middleTimeButton.addTarget(self, action: #selector(middleTimeButtonTapped), for: .touchUpInside)
        mainView.longTimeButton.addTarget(self, action: #selector(longTimeButtonTapped), for: .touchUpInside)
        mainView.randomTimeButton.addTarget(self, action: #selector(randomTimeButtonTapped), for: .touchUpInside)
        mainView.chelengeSwitch.isOn = SettingsModel.shared.getChallengeState()
        mainView.vibrationSwitch.isOn = SettingsModel.shared.getVibrationState()
        
        mainView.chelengeSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        mainView.vibrationSwitch.addTarget(self, action: #selector(swithVibration), for: .valueChanged)
        mainView.backgroundMusikPicker.selectRow(BackgroundSoundModel.shared.getSelectedSoundIndex(), inComponent: 0, animated: false)
        mainView.tickMusikPicker.selectRow(SoundBombTimerModel.shared.getSelectedSoundIndex(), inComponent: 0, animated: false)
        mainView.bomdExplosionMusikPicker.selectRow(SoundsBoomModel.shared.getSelectedSoundIndex(), inComponent: 0, animated: false)
        let selectedRow = SettingsModel.shared.getModeState() ? 0 : 1
        mainView.gameModePicker.selectRow(selectedRow, inComponent: 0, animated: false)
        
        changedTimeButton()
    }
    @objc func shortTimeButtonTapped() {
        TimeModel.shared.saveSelectedTime(TimeModel.TimeOption.short)
        changedTimeButton()
    }
    @objc func middleTimeButtonTapped() {
        TimeModel.shared.saveSelectedTime(TimeModel.TimeOption.middle)
        changedTimeButton()
    }
    @objc func longTimeButtonTapped() {
        TimeModel.shared.saveSelectedTime(TimeModel.TimeOption.long)
        changedTimeButton()
    }
    @objc func randomTimeButtonTapped() {
        TimeModel.shared.saveSelectedTime(TimeModel.TimeOption.random)
        changedTimeButton()
    }
    
    private func changedTimeButton() {
        let buttons = [
            mainView.shortTimeButton,
            mainView.middleTimeButton,
            mainView.longTimeButton,
            mainView.randomTimeButton
        ]
        UIView.animate(withDuration: 0.3) {
            buttons.forEach {
                $0.setTitleColor(.white, for: .normal)
                $0.backgroundColor = UIColor(named: "TextColor")
            }
        }
        switch TimeModel.shared.loadSelectedTime() {
        case .short:
            highlightButton(mainView.shortTimeButton)
        case .middle:
            highlightButton(mainView.middleTimeButton)
        case .long:
            highlightButton(mainView.longTimeButton)
        case .random:
            highlightButton(mainView.randomTimeButton)
        }
    }
    
    private func highlightButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.3) {
            button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
            button.backgroundColor = .white
        }
    }
    
    
    //MARK: SWITCHMETHOD
    @objc func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            SettingsModel.shared.setChallengeState(true)
        } else {
            SettingsModel.shared.setChallengeState(false)
        }
    }
    
    @objc func swithVibration(_ sender: UISwitch) {
        if sender.isOn {
            SettingsModel.shared.setVibrationState(true)
        } else {
            SettingsModel.shared.setVibrationState(false)
        }
    }
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    func playSound(fromFile fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            return
        }
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
        stopTimer?.invalidate()
        stopTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(stopMusic), userInfo: nil, repeats: false)
    }
    @objc func stopMusic() {
        audioPlayer?.stop()
    }
}
//MARK: PIKER DELEGATE
extension SettingsViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case mainView.backgroundMusikPicker:
            BackgroundSoundModel.shared.saveSelectedSound(row)
            audioPlayer?.stop()
            playSound(fromFile: BackgroundSoundModel.shared.loadSelectedSound())
        case mainView.tickMusikPicker:
            SoundBombTimerModel.shared.saveSelectedSound(row)
            audioPlayer?.stop()
            playSound(fromFile: SoundBombTimerModel.shared.loadSelectedSound())
        case mainView.bomdExplosionMusikPicker:
            SoundsBoomModel.shared.saveSelectedSound(row)
            audioPlayer?.stop()
            playSound(fromFile: SoundsBoomModel.shared.loadSelectedSound())
        case mainView.gameModePicker:
            if row == 0 {
                SettingsModel.shared.setModeState(true)
            } else {
                SettingsModel.shared.setModeState(false)
            }
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 20)
        ]
        var title = ""
        if pickerView != mainView.gameModePicker {
            title = "\(row + 1)"
        } else {
            title = gameModes[row]
        }
        return NSAttributedString(string: title, attributes: attributes)
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case mainView.backgroundMusikPicker:
            return BackgroundSoundModel.shared.getCountSounds()
        case mainView.bomdExplosionMusikPicker:
            return SoundsBoomModel.shared.getCountSounds()
        case mainView.tickMusikPicker:
            return SoundBombTimerModel.shared.getCountSounds()
        case mainView.gameModePicker:
            return gameModes.count
        default:
            return 0
        }
    }
}

