//
//  RepoNetworkManager.swift
//  DemoGitApp
//
//  Created by Pallavi Agarwal on 24/07/21.
//  Copyright © 2021 Demo. All rights reserved.
//

import Foundation

class RepoNetworkManager {
    
    
   func fetchPublicRepo(_ request : URLRequest, completion : @escaping (_ model : [PublicRepoViewModel]?)->())  {
        
        fetchData(completionHandler: { (response ) in
  
            let apiResponse = response
            var values = [PublicRepoViewModel]()
            
            let jsonValues = apiResponse["values"] as! [AnyObject]
            for jsonValue in jsonValues {
                var repoValue = PublicRepoViewModel()
                
                let owner = jsonValue["owner"] as! [String: AnyObject]
                repoValue.display_name = owner["display_name"] as! String
                
                let links = jsonValue["links"] as! [String: AnyObject]
                let avatar = links["avatar"] as! [String: AnyObject]
                repoValue.href = avatar["href"] as! String
                
                repoValue.type = owner["type"] as! String
                repoValue.created_on = jsonValue["created_on"] as! String
                
                
                values.append(repoValue)
            }
            
                completion(values)


        })
        
    }
    
    
}
