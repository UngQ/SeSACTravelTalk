//
//  IndividualChatroomTableViewCell.swift
//  SeSACTravelTalk
//
//  Created by ungq on 1/13/24.
//

import UIKit

class IndividualChatroomTableViewCell: UITableViewCell, ChangeDateFormat {
    
    static let identifier = "IndividualChatroomTableViewCell"

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            let radius = self.profileImageView.frame.width / 2
            self.profileImageView.layer.cornerRadius = radius
        }
    }
    
    func configureCell(row: Int) {
        
        nameLabel.text = filteredChatList[row].chatroomName
        nameLabel.font = .boldSystemFont(ofSize: 18)
        messageLabel.text = filteredChatList[row].chatList.last?.message
        messageLabel.font = .systemFont(ofSize: 16)
        messageLabel.textColor = .systemGray
        dateLabel.text = changeDateFormat(row: row)
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .systemGray

        let image = filteredChatList[row].chatroomImage
        profileImageView.image = UIImage(named: image.first!)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
    }
}
