//
//  OnboardingView.swift
//  Shopetizers
//
//  Created by Samit Koyom on 6/8/2565 BE.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject private var manager = OnboardingManager()
    @State private var showBtn = false
    
    var body: some View {
        ZStack {
            
            Color.blue.ignoresSafeArea()
            
            if !manager.items.isEmpty {
            
                TabView {
                    ForEach(manager.items) { item in
                        OnboardingInfoView(item: item)
                            .onAppear {
                                if item == manager.items.last {
                                    withAnimation(.spring().delay(0.25)){
                                        showBtn = true
                                    }
                                    
                                }
                            }
                            .overlay(alignment: .bottom){
                                if showBtn {
                                    Button {
                                        print("Pressed")
                                    } label: {
                                        Text("Get Started")
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                            .frame(width: 150, height: 50)
                                            .background(.white, in: RoundedRectangle(cornerRadius: 10,style: .continuous))
                                            .transition(.scale.combined(with: .opacity))
                                    }
                                    .offset(y: 50)
                                }
                            }
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .never))
            }
            
        }
        .onAppear(perform: manager.load)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
