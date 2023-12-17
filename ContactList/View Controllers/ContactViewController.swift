//
//  ViewController.swift
//  ContactList
//
//  Created by Vic on 16.12.2023.
//

import UIKit

class ContactViewController: UIViewController {
    
    
    @IBOutlet var contactNameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactNameLabel.text = person.fullName
        phoneNumberLabel.text = person.phoneNumber
        emailLabel.text = person.email
    }


}

