//
//  CitySitesApp.swift
//  CitySites
//
//  Created by Joe Miehl on 2/10/24.
//

import SwiftUI

@main
struct CitySitesApp: App {
    @State var model = BusinessModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
