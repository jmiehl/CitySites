//
//  OnboardingViewDetails.swift
//  CitySites
//
//  Created by Joe Miehl on 3/9/24.
//

import SwiftUI

// this is a reusable view that contains the elements to make the onboarding view

struct OnboardingViewDetails: View {
    
    var bgColor: Color
    var headline: String
    var subheadline: String
    var buttonAction: () -> Void
    
    
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack (spacing: 0){
                Spacer()
                Spacer()
                Image("onboarding")
                Text(headline)
                    .font(Font.system(size: 22))
                    .bold()
                    .padding(.top, 32)
                Text(subheadline)
                    .padding(.horizontal)
                    .padding(.top, 4)
                
                Spacer()
                
                Button {
                    buttonAction()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(Color.white)
                            .frame(height: 50)
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                        
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 115)
            }
            .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to City Sites", subheadline: "City Sites helps you fine the best of the city!") {
        // Nothing
    }
}
