//
//  MenuLink.swift
//  
//
//  Created by Ivan Konishchev on 17.12.2022.
//

import Foundation
import WebKit
import SwiftUI

@available(iOS 15.0, *)
struct MenuLink: View {
    
    @State var checked = false
    @AppStorage("biometricType") private(set) var biometricType: String = ""
    @AppStorage("isBiometricAuth") private(set)  var isUsedBiometric: Bool = false
    
    var secondaryColor: Color =
    Color(.init(
        red: 100 / 255,
        green: 174 / 255,
        blue: 255 / 255,
        alpha: 1))
    
    var id: Int
    @State var icon: String
    var text: String
    var toggle: Bool = false
    
    var body: some View {
        
        HStack {
            
            Image(systemName: icon)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(secondaryColor)
                .padding(.trailing, 18)
            
            Text(text)
                .foregroundColor(.white)
                .font(.body)
            if biometricType == "TouchID" || biometricType == "FaceID" {
                if self.toggle {
                    Toggle(" ", isOn: $checked)
                        .onChange(of: checked) { newValue in
                            self.checked = newValue
                            UserDefaults.standard.set(newValue, forKey: "isBiometricAuth")
                        }
                        .foregroundColor(.green)
                }
            }
        }
        .onTapGesture {
            switch id {
            case 9999:
                UserDefaults.standard.set("9999", forKey: "isSelected")
            case 4002:
                self.checked.toggle()
                UserDefaults.standard.set(self.checked, forKey: "isBiometricAuth")
            default:
                print("Tapped button with id: \(id)")

            }
            let impactMed = UIImpactFeedbackGenerator(style: .light)
            impactMed.impactOccurred()
            
        }
        .onAppear {
            self.checked = isUsedBiometric
        }
    }
    

}

