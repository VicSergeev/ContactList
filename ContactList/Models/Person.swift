//
//  Contact.swift
//  ContactList
//
//  Created by Vic on 16.12.2023.
//

struct Person {
    let name: String
    let lastname: String
    let phoneNumber: String
    let email: String
    
    var fullName: String {
        "\(name) \(lastname)"
    }
    
    static func getData() -> [Person] {
        let data = DataStore()
        var persons: [Person] = []
        var namestoBeUsed = data.names
        var lastnamesToBeUsed = data.lastnames
        var phoneNumbersToBeUsed = data.phoneNumbers
        var emailsToBeUsed = data.emails
        
        for _ in 1...data.names.count {
            
            let person = Person(
                name: namestoBeUsed.randomElement() ?? "",
                lastname: lastnamesToBeUsed.randomElement() ?? "",
                phoneNumber: phoneNumbersToBeUsed.randomElement() ?? "" ,
                email: emailsToBeUsed.randomElement() ?? ""
            )
            persons.append(person)
            namestoBeUsed.removeAll { $0 == person.name }
            lastnamesToBeUsed.removeAll{ $0 == person.lastname }
            phoneNumbersToBeUsed.removeAll{ $0 == person.phoneNumber }
            emailsToBeUsed.removeAll{ $0 == person.email }
        }
        return persons
    }
}
