//
//  MenuLinks.swift
//  
//
//  Created by Ivan Konishchev on 17.12.2022.
//

import Foundation
import SwiftUI


@available(iOS 15.0.0, *)
struct MenuLinks: View {
    @AppStorage("biometricType") private(set) var biometricType: String = ""
    var items: [MenuItem]
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(items) { item in
                
                if item.isToggle {
                    
                    if biometricType == "FaceID" {
                        MenuLink(id: item.id, icon: "faceid", text: item.text,toggle: item.isToggle)
                    } else if biometricType == "TouchID" {
                        MenuLink(id: item.id, icon: "touchid", text: item.text,toggle: item.isToggle)

                    } else {
                        MenuLink(id: item.id, icon: item.icon, text: item.text,toggle: item.isToggle)
                    }
                } else {
                    MenuLink(id: item.id,icon: item.icon, text: item.text)
                    

                }
            }
        }
        .padding(.vertical, 14)
        .padding(.leading, 8)
    }
}
