//
//  Extension + TableView Delegate.swift
//  Tiny Tasks
//
//  Created by Владислав Баранкевич on 01.06.2022.
//

import UIKit

extension CategoriesViewController {
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard let category = categories?[indexPath.row] else { return UISwipeActionsConfiguration(actions: []) }
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
                StorageManager.shared.deleteCategory(category)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            let editAction = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
                self.showAlert(with: category) {
                    tableView.reloadRows(at: [indexPath], with: .fade)
                }
            }
            
            deleteAction.backgroundColor = .red
            editAction.backgroundColor = .orange
            
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
