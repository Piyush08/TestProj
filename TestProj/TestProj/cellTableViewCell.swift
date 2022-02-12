//
//  cellTableViewCell.swift
//  TestProj
//
//  Created by Piyush Agrawal on 12/02/22.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_num : UILabel!
    @IBOutlet weak var lbl_userID: UILabel!
    @IBOutlet weak var lbl_ID: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(user:UserModel) {
        self.lbl_userID.text = "\(user.userId)"
        self.lbl_ID.text = "\(user.id)"
        self.lbl_title.text = user.title
        self.lbl_body.text = user.body
    }

}
