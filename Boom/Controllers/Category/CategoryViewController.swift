//
//  CategoryViewController.swift
//  Boom
//
//  Created by Сергей Хомиченко on 10.02.2025.
//

import UIKit

class GridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
        view.backgroundColor = .white
        
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
        controller.listCategory[indexPath.item].isSelected.toggle()

        // Обновляем только выбранную ячейку
        collectionView.reloadItems(at: [indexPath])
        
        // MARK: тут проводить логику с нажатиями
    }
}

extension GridViewController {
    func setView() {
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DemoCollectionViewCell.self, forCellWithReuseIdentifier: "DemoCell")
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
