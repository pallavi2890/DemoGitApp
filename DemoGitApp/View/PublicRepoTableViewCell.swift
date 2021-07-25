//
//  PublicRepoTableViewCell.swift
//  DemoGitApp
//
//  Created by Pallavi Agarwal on 24/07/21.
//  Copyright © 2021 Demo. All rights reserved.
//

import UIKit

class PublicRepoTableViewCell: UITableViewCell {

    @IBOutlet weak var imgViewAvtar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblCreationDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(url : String)  {
        imgViewAvtar.load(urlString: url)
    }

}
