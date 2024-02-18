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
    
    // state property to capture selected businss and pass to bus detail view
    @State var selectedBusiness: Business?
    
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
            List {ForEach (businesses){
                b in
                
                VStack (spacing: 20){
                    HStack (spacing: 0){
                        Image("list-placeholder-image")
                            .padding(.trailing, 16)
                        VStack (alignment: .leading) {
                            Text(b.name ?? "Restaurant" )
                                .font(Font.system(size: 15))
                                .bold()
                            Text(Texthelper.distanceAwayText(meters: b.distance ?? 0))
                                .font(Font.system(size: 16))
                                .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                        }
                        Spacer()
                        Image("regular_\(b.rating ?? 0)")
                    }
                    Divider()
                }
                .onTapGesture {
                    selectedBusiness = b
                }
                .sheet(item: $selectedBusiness) { item in
                    BusinessDetailView(business: item)
                }
            }
            .listRowSeparator(.hidden)
        }
            .listStyle(.plain)
    }
            .task {
                businesses = await service.businessSearch()
            }
        }
}

#Preview {
    ContentView()
}
