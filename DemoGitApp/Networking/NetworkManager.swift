//
//  NetworkManager.swift
//  DemoGitApp
//
//  Created by Pallavi Agarwal on 25/07/21.
//  Copyright © 2021 Demo. All rights reserved.
//

import Foundation

private let publicRepoURL = "https://api.bitbucket.org/2.0/repositories"
typealias jsonDictionaryHandler = ([String : Any]) -> Void

func fetchData(completionHandler: @escaping jsonDictionaryHandler){
    guard let repoUrl = URL(string: publicRepoURL) else {
        return
    }
    
    let request = URLRequest(url: repoUrl)
    let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
        
        if let error = error {
            print(error)
            return
        }
        
        // Parse JSON data
        if let data = data {
            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                completionHandler(jsonDictionary as! [String : Any])
                print("json is = \(String(describing: jsonDictionary))")
                
            } catch {
                print(error)
            }
            
        }
    })
    
    task.resume()
}
