//
//  FriendListViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/11.
//

import UIKit
import SnapKit

final class FriendListViewController: UIViewController {
    
    // MARK: - Data
    var name: String?
    
    // MARK: - Property
    private let friendStack = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let friendLabel = UILabel()
    private let friendLabelImage = UIImageView()
    
    private lazy var friendProfileButton = {
        let UIButton = UIButton()
        UIButton.addTarget(self, action: #selector(presentFriendProfile), for: .touchUpInside)
        return UIButton
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        config()
    }
    
    // MARK: - objc
    @objc
    func presentFriendProfile() {
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen

        if let name = name {
            profileVC.dataBinding(result: name)
        }

        present(profileVC, animated: true)
    }
    
    // MARK: - Method
    func dataBinding(result: String) {
        self.name = result
    }
    
}

// MARK: - Extension
extension FriendListViewController {
    
    func layout() {
        
        [friendStack, friendProfileButton].forEach {
            view.addSubview($0)
        }
        
        view.addSubview(friendStack)
        
        [friendLabel, friendLabelImage].forEach {
            friendStack.addArrangedSubview($0)
        }
        
        friendStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            $0.leading.equalTo(view.layoutMarginsGuide)
            $0.trailing.equalTo(view).offset(-305)
            $0.height.equalTo(18)
        }
        
        friendProfileButton.snp.makeConstraints {
            $0.leading.equalTo(friendStack)
            $0.top.equalTo(friendStack.snp.bottom).offset(15)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
    }
    
    func config() {
        view.backgroundColor = .white
        
        friendLabel.text = "친구"
        friendLabel.textColor = .black
        
        friendLabelImage.image = UIImage(named: "settings 1")
        
        friendProfileButton.setImage(UIImage(named: "friendtab_profileImg"), for: .normal)
    }
    
}


// data 
