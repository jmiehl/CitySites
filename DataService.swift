//
//  DataService.swift
//  CitySites
//
//  Created by Joe Miehl on 2/12/24.
//

import Foundation

struct DataService {
    
    var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async -> [Business] {
        //1. check if api key exists
        
            guard apiKey != nil else {
            return [Business]()
        }
        
        //2 . create url
            if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=39.2387&longitude=77.2794&categories=restaurants&limit=10") {
        
        //2. create request
                var request = URLRequest(url: url)
                request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
                request.addValue("application/json", forHTTPHeaderField: "accept")
            
        //3. send request
                do {
                    let (data, response) = try await  URLSession.shared.data(for: request)
                    
                    //4 parse the json
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(BusinessSearch.self, from: data)
                    return result.businesses
                    
                } catch {
                    print (error)
                }
               
        }
        return [Business]()
    }
    
}
