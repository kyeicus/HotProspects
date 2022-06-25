//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Emmanuel K. Nketia on 02/05/2022.
//

import SwiftUI

struct ProspectsView: View {
    enum FillterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    let filter: FillterType
    
    var body: some View {
        NavigationView{
            List{
                ForEach(filteredProstect) { prospect in
                    VStack(alignment: .leading) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button{
                    let prospect = Prospect()
                    prospect.name = "Kyeicus"
                    prospect.emailAddress = "kyeicus@gmail.com"
                    prospects.people.append(prospect)
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            }
        }
    }
    
    var title : String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProstect: [Prospect]{
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted}
        case .uncontacted:
            return prospects.people.filter {!$0.isContacted}
        }
    }
    
}
struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
