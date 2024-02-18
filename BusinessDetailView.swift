//
//  BusinessDetailView.swift
//  CitySites
//
//  Created by Joe Miehl on 2/18/24.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "")
        Text(business?.location?.address1 ?? "")
    }
}

#Preview {
    BusinessDetailView()
}
