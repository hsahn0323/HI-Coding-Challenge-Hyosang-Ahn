//
//  JSONParser.swift
//  HI Coding Challenge: Hyosang Ahn
//
//  Created by Hyosang Ahn on 9/9/20.
//  Copyright © 2020 Hyosang Ahn. All rights reserved.
//

import Foundation

class JSONParser {
    struct Events: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }
        
        let id: Int
        let name: String
        let description: String
        let startTime: Int
        let endTime: Int
        let locations: [String]
        let sponsor: String
        let eventType: String
    }

    // Reference: https://programmingwithswift.com/parse-json-from-file-and-url-with-swift/
    func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Events.self, from: jsonData)
            print("Event Name: ", decodedData.name)
        } catch {
            print("Decode error")
        }
    }

    // Reference: https://programmingwithswift.com/parse-json-from-file-and-url-with-swift/
    func loadFromURL(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) {
                (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }
}
    


