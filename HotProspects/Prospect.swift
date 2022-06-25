//
//  Prospect.swift
//  HotProspects
//
//  Created by Emmanuel K. Nketia on 08/05/2022.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

@MainActor class Prospects: ObservableObject {
   @Published var people: [Prospect]
    
    init() {
        people = []
    }
}
