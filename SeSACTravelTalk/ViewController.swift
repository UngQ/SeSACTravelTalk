//
//  ViewController.swift
//  SeSACTravelTalk
//
//  Created by ungq on 1/13/24.
//

import UIKit

var filteredChatList: [ChatRoom] = []

class ViewController: UIViewController {

    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var searchBarView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var lineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainView()
        
        filteredChatList = mockChatList

        
    }
}



// 테이블뷰 관련 extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if filteredChatList[indexPath.row].chatroomImage.count == 4 {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "FourInGroupChatroomTableViewCell", for: indexPath) as! FourInGroupChatroomTableViewCell
            cell.configureImageView(row: indexPath.row)
            return cell
        } else {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "IndividualChatroomTableViewCell", for: indexPath) as! IndividualChatroomTableViewCell
            cell.configureCell(row: indexPath.row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "ChatRoom", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ChatRoomViewController") as! ChatRoomViewController
        navigationController?.pushViewController(viewController, animated: true)
        
        viewController.row = indexPath.row
        
        tableView.reloadRows(at: [indexPath], with: .fade)
        
    }
}

extension ViewController: UISearchBarDelegate {
    
    //입력 중에 계속 필터링 되므로, 리로드 기능만 구현
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
   
        if searchText.isEmpty {
            filteredChatList = mockChatList
        } else {
            filteredChatList = mockChatList.filter { mockChatList in mockChatList.chatroomName.contains(searchText)}
        }
        mainTableView.reloadData()
    }
    
    
    
}

// 내가 만든 기능 extension
extension ViewController {
    func configureMainView() {
        mainTableView.separatorStyle = .none
        
        navigationItem.title = "TRAVEL TALK"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
     
        searchBar.placeholder = "친구 이름을 검색해보세요"
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.borderWidth = 1
        
        lineLabel.backgroundColor = .systemGray
 
        searchBar.delegate = self
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        let xib = UINib(nibName: "IndividualChatroomTableViewCell", bundle: nil)
        mainTableView.register(xib, forCellReuseIdentifier: "IndividualChatroomTableViewCell")

        let xib2 = UINib(nibName: "FourInGroupChatroomTableViewCell", bundle: nil)
        mainTableView.register(xib2, forCellReuseIdentifier: "FourInGroupChatroomTableViewCell")
    }
}
