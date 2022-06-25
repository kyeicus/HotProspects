//
//  ContentView.swift
//  HotProspects
//
//  Created by Emmanuel K. Nketia on 02/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var prospects = Prospects()
    
    var body: some View {
      TabView{
          ProspectsView(filter: .none)
                .tabItem {
                    Label("Everone", systemImage: "person.3")
                }
          
          ProspectsView(filter: .contacted)
              .tabItem {
                  Label("Contacted", systemImage: "checkmark.circle")
              }
          
          ProspectsView(filter: .uncontacted)
              .tabItem {
                  Label("Everone", systemImage: "questionmark.diamond")
              }
          
          MeView()
              .tabItem {
                  Label("Me", systemImage: "person.crop.square")
              }
        }
      .environmentObject(prospects)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
