//
//  ContentView.swift
//  CitySites
//
//  Created by Joe Miehl on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var businesses = [Business]()
    
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        VStack {
            HStack {
                TextField("What're you looking for", text: $query)
                    .textFieldStyle(.roundedBorder)
                Button {
                    //TODO: implement query
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            List (businesses) {b in
                Text(b.name ?? "NIL")
            }
        }
            .padding()
            .task {
                businesses = await service.businessSearch()
            }
        }
}

#Preview {
    ContentView()
}
