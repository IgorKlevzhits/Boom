//
//  CategoryViewController.swift
//  Boom
//
//  Created by Сергей Хомиченко on 10.02.2025.
//

import UIKit
import AudioToolbox

class GridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "WhiteBackground"))
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let controller = CategoryController()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let columns: CGFloat = 2
        let itemWidth = (UIScreen.main.bounds.width - (columns + 1) * spacing) / columns
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = backButton
        setView()
        setConstraints()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller.listCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemoCell", for: indexPath) as? DemoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let category = controller.listCategory[indexPath.item]
        cell.configure(with: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // для работы с выбранным элементом
        let selectedItem = controller.listCategory[indexPath.item]
        
        // Инвертируем состояние isSelected
        let selectedCount = controller.listCategory.filter { $0.isSelected }.count
        if selectedCount == 1 && controller.listCategory[indexPath.item].isSelected {
            if let cell = collectionView.cellForItem(at: indexPath) {
                shakeCell(cell)
            }
            triggerHapticFeedback()
            AudioServicesPlaySystemSound(1053)
            return
        }
        controller.listCategory[indexPath.item].isSelected.toggle()

        // Обновляем только выбранную ячейку
        collectionView.reloadItems(at: [indexPath])
        
        // MARK: тут проводить логику с нажатиями
    }
    
    private func shakeCell(_ cell: UICollectionViewCell) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.values = [-5, 5, -4, 4, -3, 3, -2, 2, 0]
        animation.duration = 0.3
        cell.layer.add(animation, forKey: "shake")
    }
    
    private func triggerHapticFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.error)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension GridViewController {
    func setView() {
        view.addSubview(backgroundImageView)
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DemoCollectionViewCell.self, forCellWithReuseIdentifier: "DemoCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear

    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
