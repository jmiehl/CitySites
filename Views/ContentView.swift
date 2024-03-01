//
//  ContentView.swift
//  CitySites
//
//  Created by Joe Miehl on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        
        @Bindable var model = model
        VStack {
            HStack {
                TextField("What're you looking for", text: $model.query)
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
            List {ForEach (model.businesses){
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
                    model.selectedBusiness = b
                }
            }
            .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .onAppear {
            model.getBusinesses()
        }
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
        
    }
}

#Preview {
    ContentView()
}
