//
//  MyMessageTableViewCell.swift
//  SeSACTravelTalk
//
//  Created by ungq on 1/14/24.
//

import UIKit

class MyMessageTableViewCell: UITableViewCell, ChangeDateFormat {
    
    static let identifier = "MyMessageTableViewCell"

    @IBOutlet var messageLabelView: UIView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(row: Int, chatListRow: Int) {

       messageLabel.text = filteredChatList[row].chatList[chatListRow].message
       messageLabel.font = .systemFont(ofSize: 16)
       messageLabel.numberOfLines = 0
       messageLabel.backgroundColor = .systemGray5
       
       messageLabelView.layer.borderWidth = 1
       messageLabelView.layer.borderColor = UIColor.systemGray.cgColor
       messageLabelView.layer.cornerRadius = 5
       messageLabelView.backgroundColor = .systemGray5
       
       dateLabel.text = changeDateFormatInChatroom(row: row, messageListRow: chatListRow)
       dateLabel.font = .systemFont(ofSize: 10)
       dateLabel.textColor = .systemGray
       
       selectionStyle = .none
    }
}
