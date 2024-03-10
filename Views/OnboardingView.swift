//
//  OnboardingView.swift
//  CitySites
//
//  Created by Joe Miehl on 3/9/24.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0 // helps determine which screen you are on
    
    
    var body: some View {
        
        ZStack // creates a background slide color based on selected tab
        {
            if selectedViewIndex == 0 {
                Color(red: 111/255, green: 154/255, blue: 189/255)
            } else
            { Color(red: 139/255, green: 166/255, blue: 65/255)
            }
            
            TabView (selection: $selectedViewIndex){
                OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Discover your city", subheadline: "City Sites helps you fine the best of the city!") {
                    // Nothing
                    withAnimation{
                        selectedViewIndex = 1
                    }
                }
                .tag(0)
                .ignoresSafeArea()
                
                OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255), headline: "Discover your city", subheadline: "We'll show you the best restaurants, venues, and more, based on your location") {
                    
                    dismiss() // dismisses the onboarding view based on the environment method above
                }
                .tag(1)
                .ignoresSafeArea()
                
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never)) // sets the tabview style and removes the dots
            VStack {
                Spacer()
                HStack (spacing: 16){
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray) // sets color of dot based on selected index
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray) // sets color of dot based on selected index
                    Spacer()
                    
                }
                .padding(.bottom, 220)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
