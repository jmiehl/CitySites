//
//  ContentView.swift
//  CitySites
//
//  Created by Joe Miehl on 2/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedTab = 0
    @State var query = ""
    @FocusState var queryBoxFocused:Bool
    @State var showOptions = false
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorySelection = "restaurants"
   
    var body: some View {
        
        
        @Bindable var model = model
        
        VStack {
            HStack {
                TextField("What're you looking for", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                    .onTapGesture {
                        withAnimation{
                            showOptions = true
                        }
                    }
                Button {
                    withAnimation {
                        showOptions = false
                        queryBoxFocused = false
                    }
                    //Perform a search
                    model.getBusinesses(query: query,
                                        options: getOptionsString(),
                                        category: categorySelection)
                    queryBoxFocused = false
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
            }
            .padding(.horizontal)
            
            //Query options. Show if textbox is focused
            
            if showOptions {
                
                VStack {
                    
                    Toggle("Popular", isOn: $popularOn)
                    Toggle("Deals", isOn: $dealsOn)
                    HStack{
                        Text("Category")
                        Spacer()
                        Picker("Category", selection:$categorySelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            Text("Arts")
                                .tag("arts")
                        }
                    }
                }
                .padding(.horizontal, 50)
            }
                // show picker
                Picker("", selection: $selectedTab) {
                    Text("List")
                        .tag(0)
                    Text("Map")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 40)
                .transition(.push(from: .top))
            
            
            // show map or list
            if model.locationAuthStatus == .denied {
                Spacer()
                Text("Please all location services for this app to see sights near you.")
                    .padding(.horizontal)
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                    
                } label: {
                    Text("Open App Privacy Settings")
                }
                Spacer()
            } else if selectedTab == 1 {
                MapView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
            else {
                ListView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                        
                    }
                    .sheet(item: $model.selectedBusiness) { item in
                        BusinessDetailView()
                    }
            }
        }
    }
    
    func getOptionsString() -> String {
        var optionsArray = [String]()
        
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}
