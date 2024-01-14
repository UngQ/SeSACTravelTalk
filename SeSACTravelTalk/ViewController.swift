//
//  ViewController.swift
//  SeSACTravelTalk
//
//  Created by ungq on 1/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let xib = UINib(nibName: "IndividualChatroomTableViewCell", bundle: nil)
        
        mainTableView.register(xib, forCellReuseIdentifier: "IndividualChatroomTableViewCell")

        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
    }


}




// 테이블뷰 관련 extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "IndividualChatroomTableViewCell", for: indexPath) as! IndividualChatroomTableViewCell

        
        cell.nameLabel.text = mockChatList[indexPath.row].chatroomName
        cell.messageLabel.text = mockChatList[indexPath.row].chatList.last?.message
        cell.dateLabel.text = changeDateFomatter(row: indexPath.row)
        
        let image = mockChatList[indexPath.row].chatroomImage
        
        cell.profileImageView.image = UIImage(named: image.first!)
        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.width / 2
        cell.profileImageView.clipsToBounds = true
        cell.profileImageView.contentMode = .scaleAspectFill
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

// 내가 만든 function extension
extension ViewController {
    func changeDateFomatter(row: Int) -> String {
        
        let inputDate = mockChatList[row].chatList.last?.date
        
        let beforeDateFormatter = DateFormatter()
        beforeDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let date = beforeDateFormatter.date(from: inputDate!)
        let afterDateFormatter = DateFormatter()
        
        afterDateFormatter.dateFormat = "yy.MM.dd"
        let outputDate = afterDateFormatter.string(from: date!)
        
        return outputDate
    }
}
