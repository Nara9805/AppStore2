//
//  Service.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 24.12.2023.
//

import Foundation

class Service {
    
    //sigleton
    static let shared = Service()
    
    //top-free top-paid
    func getTopApps(string: String, completion: @escaping (Feeds?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/\(string)/25/apps.json"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func getDetailsForApp(appId: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/lookup?id=\(appId)"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func searchApp(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    //https://itunes.apple.com/search?term=instagram&entity=software
    
    func getMusicList(completion: @escaping (Feeds?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/25/songs.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> () ) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            if let data = data, let jsonString = String(data: data, encoding: .utf8) {
                print("Response JSON String: \(jsonString)")
            }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                //                print("data: \(data)")
                completion(objects, nil)
            } catch {
                completion(nil, error)
                print("Failed to decode:", error)
            }
        }.resume()
        }

}
