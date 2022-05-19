//
//  Extension + Alert.swift
//  Tiny Tasks
//

import UIKit

extension UIAlertController {
    
    static func createAlert(with title: String, and message: String) -> UIAlertController {
        UIAlertController(title: title,
                          message: message,
                          preferredStyle: .alert)
    }
    
    func actionForCategory(with category: Category?, completion: @escaping (String) -> Void) {
        
        let doneButton = category == nil ? "Save" : "Update"
        
        let saveAction = UIAlertAction(title: doneButton,
                                       style: .default) { _ in
            guard let newValue = self.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
            completion(newValue)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.text = category?.title
            textField.placeholder = "Enter category title"
        }
    }
    
    func actionForTasks(with task: Task?, completion: @escaping (String, String) -> Void) {
        
        let title = task == nil ? "Save" : "Update"
        
        let saveAction = UIAlertAction(title: title,
                                       style: .default) { _ in
            guard let newTask = self.textFields?.first?.text else { return }
            guard !newTask.isEmpty else { return }
            
            if let note = self.textFields?.last?.text, !note.isEmpty {
                completion(newTask, note)
            } else {
                completion(newTask, "")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.text = task?.name
            textField.placeholder = "Enter task name"
        }
        
        addTextField { textField in
            textField.text = task?.note
            textField.placeholder = "Add some notes"
        }
    }
}
