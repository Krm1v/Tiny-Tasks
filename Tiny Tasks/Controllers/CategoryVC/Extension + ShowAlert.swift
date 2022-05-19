//
//  Extension + ShowAlert.swift
//  Tiny Tasks
//
//  Created by Владислав Баранкевич on 19.05.2022.
//

import UIKit

extension CategoriesViewController {
    
    func showAlert(with category: Category? = nil, completion: (() -> Void)? = nil) {
        
        let title = category != nil ? "Edit category" : "New category"
        
        let alert = UIAlertController.createAlert(with: title, and: "Enter category title, please🎉")
        alert.actionForCategory(with: category) { newValue in
            if let category = category, let completion = completion {
                StorageManager.shared.rename(category, to: newValue)
                completion()
            } else {
                self.save(category: newValue)
            }
        }
        present(alert, animated: true)
    }
    
    private func save(category: String) {
        
        let category = Category(value: [category])
        StorageManager.shared.saveCategory(category)
        let rowIndex = IndexPath(row: categories?.index(of: category) ?? 0, section: 0)
        tableView.insertRows(at: [rowIndex], with: .automatic)
    }
}
