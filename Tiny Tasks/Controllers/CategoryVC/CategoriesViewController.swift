//
//  ViewController.swift
//  Tiny Tasks
//
//  Created by Владислав Баранкевич on 19.05.2022.
//

import UIKit
import RealmSwift

class CategoriesViewController: UITableViewController {
    
    //MARK: - Properties
    
    var categories: Results<Category>?

    //MARK: - UIView Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = StorageManager.shared.realm.objects(Category.self)
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    //MARK: - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let category = categories?[indexPath.row] else { return cell }
        cell.textLabel?.text = category.title
        return cell
    }
    
    
    
    private func setupUI() {
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(addButtonPressed)
        )
        navigationItem.rightBarButtonItem = addButton
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Categories"
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        
    }
    
    @objc dynamic func addButtonPressed() {
        showAlert()
    }
}


