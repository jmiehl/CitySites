//
//  ContentView.swift
//  CitySites
//
//  Created by Joe Miehl on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        HStack {
            TextField("What're you looking for", text: $query)
                .textFieldStyle(.roundedBorder)
            Button {
                //TODO: implement query
            } label: {
                Text("Go")
            }
        }
        .padding()
        .task {
          let businesses = await service.businessSearch()
        }
   
    }
}

#Preview {
    ContentView()
}
