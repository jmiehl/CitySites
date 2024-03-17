//
//  BusinessDetailView.swift
//  CitySites
//
//  Created by Joe Miehl on 2/18/24.
//

import SwiftUI

struct BusinessDetailView: View {
    
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        let business = model.selectedBusiness
        
        VStack (spacing: 0){
            ZStack (alignment: .trailing){
                
                if let imageUrl = business?.image_url {
                    AsyncImage(url: URL(string: imageUrl)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 164)
                            .clipped()
                            
                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }
                }
                else {
                    Image("detail-placeholder-image")
                        .resizable()
                }
               
                VStack{
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 164)
            
            if let isClosed =  model.selectedBusiness?.is_closed  {
                
                ZStack (alignment: .leading){
                    Rectangle()
                        .foregroundStyle(isClosed ? .red : .green)
                    Text(isClosed ? "Closed" : "Open")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
                .frame(height: 36)
            }
            
            ScrollView {
                VStack (alignment: .leading, spacing: 0) {
                    Text(model.selectedBusiness?.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.top, 16)
                    
                    Text("\(model.selectedBusiness?.location?.address1 ?? ""), \(model.selectedBusiness?.location?.city ?? "")")
                    Text("\(model.selectedBusiness?.location?.state ?? "") \(model.selectedBusiness?.location?.zip_code ?? ""), \(model.selectedBusiness?.location?.country ?? "")")
                        .padding(.bottom, 10)
                    
                   Image("regular_\(model.selectedBusiness?.rating ?? 0)")
                        .padding(.bottom, 16)
                  
                    
                    Divider()
                       
                    
                    HStack {
                        Image(systemName: "phone")
                                             
                        if let url = URL(string: "tel:\(model.selectedBusiness?.phone ?? "")") {
                            Link(destination: url) {
                                Text(model.selectedBusiness?.phone ?? "")
                            }
                        }
                        else {
                            Text(model.selectedBusiness?.phone ?? "")
                        }
                        
                        Spacer()
                        Image(systemName: "arrow.right")
                        
                    }
                    .padding(.vertical, 12)
                    Spacer()
                 
                    Divider()
                        
                    
                    HStack {
                        Image(systemName: "globe")
                        
                        if let url = URL(string:"\(model.selectedBusiness?.url ?? "")") {
                            Link(destination: url) {
                                Text(model.selectedBusiness?.url ?? "")
                                    .lineLimit(1)
                            }
                        }
                        else {
                            Text(model.selectedBusiness?.url ?? "")
                                .lineLimit(1)
                        }
                        Spacer()
                        Image(systemName: "arrow.right")
                        
                    }
                    .padding(.vertical, 12)
                    Spacer()
                    
                    Divider()
                    
                    
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(model.selectedBusiness?.review_count ?? 0) reviews")
                   
                        
                    }
                    .padding(.vertical, 12)
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BusinessDetailView()
}
