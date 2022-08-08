//
//  ShopetizersApp.swift
//  Shopetizers
//
//  Created by Samit Koyom on 30/7/2565 BE.
//

import SwiftUI

@main
struct ShopetizersApp: App {
    
    // โหลด ViewModel Order
    var order = OrderViewModel()
    
    var body: some Scene {
        WindowGroup {
            ShopetizerTabView().environmentObject(order)
            // OnboardingView()
        }
    }
}
