//
//  OpponentMessageTableViewCell.swift
//  SeSACTravelTalk
//
//  Created by ungq on 1/14/24.
//

import UIKit

class OpponentMessageTableViewCell: UITableViewCell, ChangeDateFormat {
    
    static let identifier = "OpponentMessageTableViewCell"

    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var messageLabelView: UIView!
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            let radius = self.profileImageView.frame.width / 2
            self.profileImageView.layer.cornerRadius = radius
        }
    }

    
    func configureCell(row: Int, chatListRow: Int) {
        let image = filteredChatList[row].chatList[chatListRow].user.profileImage
        profileImageView.image = UIImage(named: image)
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        nameLabel.text = filteredChatList[row].chatList[chatListRow].user.rawValue
        nameLabel.font = .boldSystemFont(ofSize: 16)
        messageLabel.text = filteredChatList[row].chatList[chatListRow].message
        messageLabel.font = .systemFont(ofSize: 16)
        messageLabel.numberOfLines = 0
        messageLabelView.layer.borderWidth = 1
        messageLabelView.layer.borderColor = UIColor.systemGray.cgColor
        messageLabelView.layer.cornerRadius = 5
        
        dateLabel.text = changeDateFormatInChatroom(row: row, messageListRow: chatListRow)
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = .systemGray
        
        selectionStyle = .none
    }

    
}
