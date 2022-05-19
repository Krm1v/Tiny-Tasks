//
//  StorageManager.swift
//  Tiny Tasks
//
//  Created by Владислав Баранкевич on 19.05.2022.
//

import RealmSwift

class StorageManager {
    
    static let shared = StorageManager()
    let realm = try! Realm()
    
    //MARK: - Categories Methods
    
    func saveCategories(_ category: [Category]) {
        write {
            realm.add(category)
        }
    }
    
    func saveCategory(_ category: Category) {
        write {
            realm.add(category)
        }
    }
    
    func deleteCategory(_ category: Category) {
        write {
            realm.delete(category.tasks)
            realm.delete(category)
        }
    }
    
    func rename(_ category: Category, to name: String) {
        write {
            category.title = name
        }
    }
    
    func makeAllDone(_ category: Category) {
        write {
            category.tasks.setValue(true, forKey: "isDone")
        }
    }
    
    //MARK: - Tasks Methods
    
    func saveTask(_ task: Task, to category: Category) {
        write {
            category.tasks.append(task)
        }
    }
    
    func deleteTask(_ task: Task) {
        write {
            realm.delete(task)
        }
    }
    
    func editTask(_ task: Task, to name: String, with note: String) {
        write {
            task.name = name
            task.note = note
        }
    }
    
    func makeDone(_ task: Task) {
        write {
            task.isDone.toggle()
        }
    }
    
    private func write(completion: () -> Void) {
        
        do {
            try realm.write { completion() }
        } catch let error {
            print(error)
        }
    }
}
