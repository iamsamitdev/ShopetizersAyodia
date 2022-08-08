//
//  OnboardingManager.swift
//  Shopetizers
//
//  Created by Samit Koyom on 6/8/2565 BE.
//

import Foundation

struct OnboardingItem: Identifiable {
    let id = UUID()
    let emoji: String
    let title: String
    let content: String
}

extension OnboardingItem: Equatable {}

final class OnboardingManager: ObservableObject {
    
    @Published private(set) var items: [OnboardingItem] = []
    
    func load() {
        items = [
            .init(emoji: "🤝",
                  title: "Join the crew",
                  content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            .init(emoji: "❤️",
                  title: "Support the crew",
                  content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            .init(emoji: "🥳",
                  title: "Celebrate the crew",
                  content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
        ]
    }
    
}
