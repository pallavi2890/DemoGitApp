//
//  PublicRepoViewController.swift
//  DemoGitApp
//
//  Created by Pallavi Agarwal on 24/07/21.
//  Copyright © 2021 Demo. All rights reserved.
//

import UIKit

class PublicRepoViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tblviewRepo: UITableView!
    private let publicRepoURL = "https://api.bitbucket.org/2.0/repositories"
    private var listRepoValue = [PublicRepoViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblviewRepo.dataSource = self
        self.tblviewRepo.delegate = self
        
        // Do any additional setup after loading the view.
        self.callRepoAPI()
    }
    
    //MARK: - call API
    
    func callRepoAPI() {
        guard let repoUrl = URL(string: publicRepoURL) else {
            return
        }
        
        let request = URLRequest(url: repoUrl)
        RepoNetworkManager().fetchPublicRepo((request),completion: { (listRepo:[PublicRepoViewModel]?) in
            print("listRepo = \(String(describing: listRepo))")
            
            if let listValues = listRepo
            {
                self.listRepoValue = listValues
                OperationQueue.main.addOperation({
                    self.tblviewRepo.reloadData()
                })
            }
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return self.listRepoValue.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PublicRepoTableViewCell

        // Configure the cell...
        cell.lblName.text = self.listRepoValue [indexPath.row].display_name
        cell.lblType.text = self.listRepoValue [indexPath.row].type
        cell.lblCreationDate.text = self.listRepoValue [indexPath.row].created_on
        cell.configure(url: self.listRepoValue [indexPath.row].href)
        
        return cell
    }
    
    
}
