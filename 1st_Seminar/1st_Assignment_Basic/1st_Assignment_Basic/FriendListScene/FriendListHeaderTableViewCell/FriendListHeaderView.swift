//
//  FriendListHeaderView.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/11/01.
//

import UIKit

class FriendListHeaderView: UITableViewHeaderFooterView {

    static let identifier = "FriendListHeaderTableViewCell"
    
    private let profileImageHeaderView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "friendtab_profileImg")
    }
    
    private let nameHeaderLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.text = "김솝트"
    }
    
    private let explainHeaderLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.text = "상태메세지는 여기에..."
        $0.textColor = .gray
    }
    
    private let divider = UILabel().then {
        $0.backgroundColor = .systemGray6
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension FriendListHeaderView {
    
    private func setViews() {
        contentView.addSubviews(profileImageHeaderView, nameHeaderLabel, explainHeaderLabel, divider)
    }
    
    private func layout() {
        contentView.backgroundColor = .clear
        
        profileImageHeaderView.snp.makeConstraints {
            $0.leading.equalTo(layoutMarginsGuide)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(66)
        }
        
        nameHeaderLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageHeaderView).inset(5)
            $0.leading.equalTo(profileImageHeaderView.snp.trailing).offset(10)
            $0.width.equalTo(60)
            $0.height.equalTo(30)
        }
        
        explainHeaderLabel.snp.makeConstraints {
            $0.top.equalTo(nameHeaderLabel.snp.bottom)
            $0.leading.equalTo(nameHeaderLabel)
            $0.width.equalTo(180)
            $0.height.equalTo(15)
        }
        
        divider.snp.makeConstraints {
            $0.leading.trailing.equalTo(layoutMarginsGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        
    }
    
}
