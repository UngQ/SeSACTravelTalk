//
//  IndividualChatroomTableViewCell.swift
//  SeSACTravelTalk
//
//  Created by ungq on 1/13/24.
//

import UIKit

class IndividualChatroomTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            let rdius = self.profileImageView.frame.width / 2
            self.profileImageView.layer.cornerRadius = rdius
        }

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
