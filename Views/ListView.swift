//
//  ListView.swift
//  CitySites
//
//  Created by Joe Miehl on 2/29/24.
//

import SwiftUI

struct ListView: View {
    @Environment(BusinessModel.self) var model
    
    var body: some View {
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
                    Image("regular_" + Texthelper.ratinghelper(rating: b.rating ?? 0))
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
}

#Preview {
    ListView()
        .environment(BusinessModel())
}