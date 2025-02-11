//
//  CategoryController.swift
//  Boom
//
//  Created by Сергей Хомиченко on 10.02.2025.
//
import UIKit

internal class CategoryController {
    let listCategory = [
        CategoryItem(isSelected: false, iconName: "smile", title: "О разном"),
        CategoryItem(isSelected: false, iconName: "hobby", title: "Спорт и Хобби"),
        CategoryItem(isSelected: false, iconName: "life", title: "Про жизнь"),
        CategoryItem(isSelected: false, iconName: "influencer", title: "Знаменитости"),
        CategoryItem(isSelected: false, iconName: "cinema", title: "Искусство и Кино"),
        CategoryItem(isSelected: false, iconName: "nature", title: "Природа"),
    ]
    
    func changeSelected(categoryItem: CategoryItem) {
//        categoryItem.isSelected.toggle()
    }
}

struct CategoryItem {
    var isSelected: Bool
    let iconName: String
    let title: String
}
