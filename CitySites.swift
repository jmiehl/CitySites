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
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
        }
    }
}
