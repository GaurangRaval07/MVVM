//
//  CommentsTVCell.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 17/03/25.
//

import UIKit

class CommentsTVCell: UITableViewCell {
    @IBOutlet weak var bgVW: UIView!
    
    @IBOutlet weak var lblPostID: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
