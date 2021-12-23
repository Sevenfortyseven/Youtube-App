//
//  Api Request.swift
//  Yapp
//
//  Created by aleksandre on 22.12.21.
//

import Foundation

class ApiRequest {
    
    func getVideos() {
        
        // Create an URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            print("error with url object")
            return
        }
        
        // Get an URLSession object
        let session = URLSession.shared
        
        // Get dataTask from URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check for errors
            if error != nil || data == nil {
                print("error")
                return
            }
            
            do {
                // parse data into video object
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
        
                dump(response)
            }
            
            catch let error  {
                print("couldn't decode \(error)")
                
                
            }
        }
        // start a task
        dataTask.resume()
    }
}
