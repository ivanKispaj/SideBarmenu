//
//  MenuActions.swift
//  
//
//  Created by Ivan Konishchev on 17.12.2022.
//

import Foundation

struct MenuActions {
    
    var profileActions: [MenuItem] = [
        MenuItem(id: 4003,
                 icon: "wrench.and.screwdriver.fill",
                 text: "Settings",isToggle: false),
        MenuItem(id: 9999,
                 icon: "door.right.hand.open",
                 text: "Logout", isToggle: false),
    ]
    
    var userActions: [MenuItem] = [
        MenuItem(id: 4001, icon: "person.circle.fill", text: "My Account", isToggle: false),
        MenuItem(id: 4002, icon: "bag.fill", text: "Использовать FaceId?", isToggle: true),
    ]
    
}
