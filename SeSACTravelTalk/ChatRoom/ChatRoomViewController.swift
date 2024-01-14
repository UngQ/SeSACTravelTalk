//
//  ChatRoomViewController.swift
//  SeSACTravelTalk
//
//  Created by ungq on 1/14/24.
//

import UIKit

class ChatRoomViewController: UIViewController {

    @IBOutlet var messageFieldView: UIView!
    @IBOutlet var messageField: UITextField!
    @IBOutlet var messageButton: UIButton!
    
    var row: Int = 0
    
    @IBOutlet var chatroomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureChatRoomView()
        messageButton.addTarget(self, action: #selector(messageButtonClicked), for: .touchUpInside)
        
    }
    
    @IBAction func exitMessageField(_ sender: UITextField) {
        messageButtonClicked()
    }
    
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func messageButtonClicked() {
        switch messageField.text {
        case "":
            return
        default:
            let date = Date()
            print(date)
            filteredChatList[row].chatList.append(Chat(user: .user, date: currentTime(), message: messageField.text!))
            messageField.text = ""
            chatroomTableView.reloadData()
        }
    }
    
    
}

//테이블뷰 관련 extension
extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource, ChangeDateFormat {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredChatList[row].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch filteredChatList[row].chatList[indexPath.row].user {
        case .user:
            let cell = chatroomTableView.dequeueReusableCell(withIdentifier: "MyMessageTableViewCell", for: indexPath) as! MyMessageTableViewCell
            cell.configureCell(row: row, chatListRow: indexPath.row)
            return cell
        default:
            let cell = chatroomTableView.dequeueReusableCell(withIdentifier: "OpponentMessageTableViewCell", for: indexPath) as! OpponentMessageTableViewCell
            cell.configureCell(row: row, chatListRow: indexPath.row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//내가 만든 기능 extension
extension ChatRoomViewController {
    func configureChatRoomView() {
        //네비게이션 부분
        navigationItem.title = "\(filteredChatList[row].chatroomName)"
        
        //테이블뷰 부분
        chatroomTableView.dataSource = self
        chatroomTableView.delegate = self
        
        let xib = UINib(nibName: "OpponentMessageTableViewCell", bundle: nil)
        chatroomTableView.register(xib, forCellReuseIdentifier: "OpponentMessageTableViewCell")
        
        let xib2 = UINib(nibName: "MyMessageTableViewCell", bundle: nil)
        chatroomTableView.register(xib2, forCellReuseIdentifier: "MyMessageTableViewCell")
        
        chatroomTableView.separatorStyle = .none
        
        //메시지 입력 부분
        messageFieldView.backgroundColor = .systemGray6
        messageFieldView.layer.cornerRadius = 10
        
        messageField.backgroundColor = .clear
        messageField.borderStyle = .none
        messageField.placeholder = "메세지를 입력하세요"
        
        messageButton.backgroundColor = .clear
        messageButton.setImage(UIImage(systemName: "message"), for: .normal)
        messageButton.tintColor = .systemGray3
    }
}
