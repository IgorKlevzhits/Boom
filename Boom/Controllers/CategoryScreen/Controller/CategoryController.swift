//
//  CategoryController.swift
//  Boom
//
//  Created by Сергей Хомиченко on 10.02.2025.
//
import UIKit

internal class CategoryController {
    var listCategory = [
        CategoryItem(isSelected: false, iconName: "smile", title: "О разном"),
        CategoryItem(isSelected: false, iconName: "hobby", title: "Спорт и Хобби"),
        CategoryItem(isSelected: false, iconName: "life", title: "Про жизнь"),
        CategoryItem(isSelected: false, iconName: "influencer", title: "Знаменитости"),
        CategoryItem(isSelected: false, iconName: "cinema", title: "Искусство и Кино"),
        CategoryItem(isSelected: false, iconName: "nature", title: "Природа"),
    ]
    
    init() {
        loadSelectedCategories()
    }
    
    func loadSelectedCategories() {
        if let savedCategories = UserDefaults.standard.array(forKey: "selectedCategories") as? [String] {
            for i in 0..<listCategory.count {
                if savedCategories.contains(listCategory[i].title) {
                    listCategory[i].isSelected = true
                }
            }
        }
    }
}

struct CategoryItem {
    var isSelected: Bool
    let iconName: String
    let title: String
}
