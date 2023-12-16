//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Vic on 16.12.2023.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    private var contactList = Person.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: nil,
            action: nil
        )
    }
    
// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let indexPath = tableView.indexPathForSelectedRow else { return }
       let contactVC = segue.destination as? ContactViewController
       contactVC?.person = contactList[indexPath.row]
   }
}

// MARK: - UITableViewDataSourse
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = contactList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = contact.fullName
        
        cell.contentConfiguration = content
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
}
