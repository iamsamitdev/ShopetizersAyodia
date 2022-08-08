//
//  OnboardingInfoView.swift
//  Shopetizers
//
//  Created by Samit Koyom on 6/8/2565 BE.
//

import SwiftUI

struct OnboardingInfoView: View {
    
    let item: OnboardingItem
    
    var body: some View {
        
        VStack {
            Text(item.emoji)
                .font(.system(size: 150))
            Text(item.title)
                .font(.system(size: 35, weight: .heavy, design: .rounded))
                .padding(.bottom, 12)
            Text(item.content)
                .font(.system(size: 18, weight: .light, design: .rounded))
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .padding()
        
    }
}

struct OnboardingInfoView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInfoView(item: .init(emoji: "🤝",
                                       title: "Join the crew",
                                       content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."))
        .background(.blue)
    }
}
