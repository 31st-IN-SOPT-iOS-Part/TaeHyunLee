//
//  FriendListModel.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/31.
//

import Foundation
import RxDataSources

struct FriendListModel {
    var image: String
    var name: String
    var explain: String
}

extension FriendListModel: Hashable {}

extension FriendListModel: IdentifiableType, Equatable {
    var identity: String {
        return UUID().uuidString
    }
    
}

struct FriendSection {
    var header: String
    var items: [FriendListModel]
}

extension FriendSection: AnimatableSectionModelType {
    
    typealias Item = FriendListModel
    
    var identity: String {
        return header
    }
    
    init(original: FriendSection, items: [FriendListModel]) {
        self = original
        self.items = items
    }
    
}

