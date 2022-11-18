//
//  FriendListViewModel.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/11/18.
//

import Foundation
import RxSwift

class FriendListViewModel {
    
    var friendList = [
        FriendListModel(image: "스크린샷 2021-04-24 오전 2.44 1", name: "김솝트", explain: "하이"),
        FriendListModel(image: "스크린샷 2021-04-24 오전 2.48 1", name: "안솝트", explain: "안녕"),
        FriendListModel(image: "스크린샷 2021-04-24 오전 2.51 1", name: "최솝트", explain: "반갑"),
        FriendListModel(image: "스크린샷 2021-04-24 오전 2.52 1", name: "정솝트", explain: "하이"),
        FriendListModel(image: "스크린샷 2021-04-24 오전 2.54 1", name: "강솝트", explain: "흠"),
        FriendListModel(image: "스크린샷 2021-04-24 오전 2.54 2", name: "오솝트", explain: "오호"),
        FriendListModel(image: "스크린샷 2021-04-24 오전 2.58 1", name: "황솝트", explain: "하이"),
        FriendListModel(image: "스크린샷 2021-04-24 오전 3.05 1", name: "최솝트", explain: "하이"),
        FriendListModel(image: "스크린샷 2021-04-24 오전 3.05 1", name: "고솝트", explain: "하이")
    ]
    
    lazy var sections = [
        FriendSection(header: "", items: friendList)
    ]
    
    
    
}
