//
//  FriendListTableViewCell.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/31.
//

import UIKit
import Then
import SnapKit
import SwiftyColor

class FriendListTableViewCell: UITableViewCell {

    static let identifier = "FriendListTableViewCell"
    
    private let profileContainerView = UIView()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let explainLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .gray
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension FriendListTableViewCell {
    
    private func setViews() {
        contentView.addSubviews(profileContainerView, nameLabel, explainLabel)
        profileContainerView.addSubview(profileImageView)
    }
    
    private func layout() {
        contentView.backgroundColor = .clear
        
        profileContainerView.snp.makeConstraints {
            $0.leading.equalTo(layoutMarginsGuide)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(45)
        }
        
        profileImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileContainerView).inset(5)
            $0.leading.equalTo(profileContainerView.snp.trailing).offset(15)
        }
        
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(nameLabel)
        }
        
    }
    
    func dataBind(model: FriendListModel) {
        profileImageView.image = UIImage(named: model.image)?.roundedImage
        nameLabel.text = model.name
        explainLabel.text = model.explain
    }
    
}
