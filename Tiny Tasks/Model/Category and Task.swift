//
//  Category.swift
//  Tiny Tasks
//

import RealmSwift

class Category: Object {
    
    @Persisted var title: String = ""
    var tasks = List<Task>()
}

class Task: Object {
    
    @Persisted var name: String = ""
    @Persisted var note: String = ""
    @Persisted var date = Date()
    @Persisted var isDone: Bool = false
}


