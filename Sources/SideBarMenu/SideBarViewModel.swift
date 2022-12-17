//
//  SideBarViewModel.swift
//  
//
//  Created by Ivan Konishchev on 17.12.2022.
//

import Foundation
import SwiftUI

@available(iOS 15.0, *)

final class SideBarViewModel: ObservableObject {
    
    @Published var isLogout: Bool = false
    
    let colorSet: ColorSet = ColorSet()
    private(set) var userAction = MenuLinks(items: MenuActions().userActions)
    private(set) var profileActions = MenuLinks(items: MenuActions().profileActions)

}
