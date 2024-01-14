//
//  FourInGroupChatroomTableViewCell.swift
//  SeSACTravelTalk
//
//  Created by ungq on 1/14/24.
//

import UIKit

class FourInGroupChatroomTableViewCell: UITableViewCell, ChangeDateFormat {

    static let identifier = "FourInGroupChatroomTableViewCell"
    
    @IBOutlet var profileImageStackView: UIStackView!
    @IBOutlet var firstProfileImageView: UIImageView!
    @IBOutlet var secondProfileImageView: UIImageView!
    @IBOutlet var thirdProfileImageView: UIImageView!
    @IBOutlet var fourthProfileImageView: UIImageView!
    
    @IBOutlet var chatroomNameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            let radius = self.profileImageStackView.frame.width / 2
            self.profileImageStackView.layer.cornerRadius = radius
        }
    }
 
    func configureImageView(row: Int) {
        
        chatroomNameLabel.text = filteredChatList[row].chatroomName
        chatroomNameLabel.font = .boldSystemFont(ofSize: 18)
        messageLabel.text = filteredChatList[row].chatList.last?.message
        messageLabel.font = .systemFont(ofSize: 16)
        messageLabel.textColor = .systemGray
        dateLabel.text = changeDateFormat(row: row)
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .systemGray
        
        let image = filteredChatList[row].chatroomImage
        
        firstProfileImageView.image = UIImage(named: image[0])
        secondProfileImageView.image = UIImage(named: image[1])
        thirdProfileImageView.image = UIImage(named: image[2])
        fourthProfileImageView.image = UIImage(named: image[3])
        profileImageStackView.clipsToBounds = true
        
        chatroomNameLabel.text = filteredChatList[row].chatroomName
        messageLabel.text = filteredChatList[row].chatList.last?.message
        dateLabel.text = changeDateFormat(row: row)
    }
}
