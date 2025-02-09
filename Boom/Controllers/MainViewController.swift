//
//  ViewController.swift
//  Boom
//
//  Created by Игорь Клевжиц on 09.02.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI
    // "SFProRounded-Medium"
    private lazy var nextViewButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("nextScreen", for: .normal)
        element.titleLabel?.font = UIFont(name: "SFProRounded-Medium", size: 20)
        element.backgroundColor = UIColor(named: "MainButtons")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Methods
    
    @objc private func nextViewButtonTapped(_ sender: UIButton) {
//        navigationController?.pushViewController(yourController(), animated: true)
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
    
}

private extension MainViewController {
    
    // MARK: - Set Views
    
    func setViews() {
        view.addSubview(nextViewButton)
        nextViewButton.addTarget(self, action: #selector(nextViewButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nextViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
