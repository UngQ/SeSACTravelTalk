//
//  Protocol.swift
//  SeSACTravelTalk
//
//  Created by ungq on 1/14/24.
//

import UIKit


protocol ChangeDateFormat {
    
    func currentTime() -> String
    func changeDateFormat(row:Int) -> String
    func changeDateFormatInChatroom (row: Int, messageListRow: Int) -> String
}

extension ChangeDateFormat {
    func currentTime() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm"
        let result = format.string(from: Date())
        return result
    }
}


extension ChangeDateFormat {
    func changeDateFormat(row: Int) -> String {
        
        let inputDate = filteredChatList[row].chatList.last?.date
        
        let beforeDateFormatter = DateFormatter()
        beforeDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let date = beforeDateFormatter.date(from: inputDate!)
        let afterDateFormatter = DateFormatter()
        
        afterDateFormatter.dateFormat = "yy.MM.dd"
        let outputDate = afterDateFormatter.string(from: date!)
        
        return outputDate
    }
}

extension ChangeDateFormat {
    func changeDateFormatInChatroom (row: Int, messageListRow: Int) -> String {
        
        let inputDate = filteredChatList[row].chatList[messageListRow].date
        
        let beforeDateFormatter = DateFormatter()
        beforeDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let date = beforeDateFormatter.date(from: inputDate)
        let afterDateFormatter = DateFormatter()
        
        afterDateFormatter.dateFormat = "hh:mm a"
        afterDateFormatter.locale = Locale(identifier: "ko_KR")
        let outputDate = afterDateFormatter.string(from: date!)
        
        return outputDate
    }
}
