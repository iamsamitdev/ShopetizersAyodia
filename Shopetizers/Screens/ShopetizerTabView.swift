//
//  ContentView.swift
//  Shopetizers
//
//  Created by Samit Koyom on 30/7/2565 BE.
//

import SwiftUI

struct ShopetizerTabView: View {
    var body: some View {
        TabView {
            ShopetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            OrderView()
                .tabItem {
                    Label("Orders", systemImage: "bag")
                }
            
            AccountView()
                .tabItem {
                    Label("Person", systemImage: "person")
                }
        }
    }
}

struct ShopetizerTabView_Previews: PreviewProvider {
    static var previews: some View {
        ShopetizerTabView()
            .preferredColorScheme(.light)
    }
}
