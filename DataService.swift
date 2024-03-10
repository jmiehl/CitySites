//
//  DataService.swift
//  CitySites
//
//  Created by Joe Miehl on 2/12/24.
//

import Foundation
import CoreLocation

struct DataService {
    
    var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?) async -> [Business] {
        //1. check if api key exists
        
            guard apiKey != nil else {
            return [Business]()
        }
        
        var lat = 35.6655
        var long = 139.7703981
        
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        //2 . create url
            if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&categories=restaurants&limit=10") {
        
        //2. create request
                var request = URLRequest(url: url)
                request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
                request.addValue("application/json", forHTTPHeaderField: "accept")
            
        //3. send request
                do {
                    let (data, _) = try await  URLSession.shared.data(for: request)
                    
                    //4 parse the json
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(BusinessSearch.self, from: data)
                    //print(result.businesses)
                    return result.businesses
                    
                } catch {
                    print (error)
                }
               
        }
        return [Business]()
    }
    
}
