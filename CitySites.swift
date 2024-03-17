//
//  CitySitesApp.swift
//  CitySites
//
//  Created by Joe Miehl on 2/10/24.
//

import SwiftUI

@main
struct CitySites: App {
    @State var model = BusinessModel()
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model) // gives access to business model
                .fullScreenCover(isPresented: $needsOnboarding) {
                    needsOnboarding = false // allows for dismissal of the onboarding screen
                } content: {
                    OnboardingView()
                        .environment(model) // gives access to business model
                }
                .onAppear {
                    // if no onboarding needed get location
                    if needsOnboarding == false && model.locationAuthStatus == .notDetermined {
                        model.getUserLocation()
                    }
                }

        }
    }
}
