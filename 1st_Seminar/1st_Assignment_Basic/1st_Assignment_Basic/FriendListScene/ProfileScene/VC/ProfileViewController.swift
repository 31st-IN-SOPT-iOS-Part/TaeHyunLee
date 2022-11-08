//
//  FriendProfileViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/11.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    //MARK: - Property
    private lazy var backButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()

    private let profileStack = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private let MyProfile = UIImageView()
    private let MyName = UILabel()
    
    private let divider = UILabel()
    
    private let bottomStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var chattingButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(chattingAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var editButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(editAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var kakaoStoryButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(kakaoStoryAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        config()
    }
    
    // MARK: - objc
    @objc
    func dismissView() {
        dismiss(animated: true)
    }
    
    @objc
    func chattingAction() {
        print("tap chatting")
    }
    
    @objc
    func editAction() {
        print("tap edit")
    }
    
    @objc
    func kakaoStoryAction() {
        print("tap KakaoStory")
    }
    
    // MARK: - Method
    func dataBinding(result: String) {
        MyName.text = "\(result)"
    }
    
}

// MARK: - extension
extension ProfileViewController {
    
    func layout() {
        
        [backButton, profileStack, divider, bottomStackView].forEach {
            view.addSubview($0)
        }
        
        [MyProfile, MyName].forEach {
            profileStack.addArrangedSubview($0)
        }
        
        [chattingButton, editButton, kakaoStoryButton].forEach {
            bottomStackView.addArrangedSubview($0)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalTo(view.layoutMarginsGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            $0.width.equalTo(14)
            $0.height.equalTo(14)
        }
        
        profileStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(220)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(97)
            $0.height.equalTo(125)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(profileStack.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(55)
            $0.height.equalTo(40)
        }
        
    }
    
    func config() {
        view.backgroundColor = .gray
        
        backButton.setImage(UIImage(systemName: "multiply"), for: .normal)
        backButton.tintColor = .white
        
        MyProfile.image = UIImage(named: "friendtab_profileImg")
        
        MyName.textColor = .white
        MyName.textAlignment = .center
        MyName.font = .systemFont(ofSize: 18, weight: .medium)
        
        divider.backgroundColor = .white
        
        chattingButton.setImage(UIImage(named: "profileTalkImg"), for: .normal)
        chattingButton.setTitle("나와의 채팅", for: .normal)
        chattingButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        chattingButton.alignTextBelow(spacing: 3)
        
        editButton.setImage(UIImage(named: "profile_editImg"), for: .normal)
        editButton.setTitle("프로필 편집", for: .normal)
        editButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        editButton.alignTextBelow(spacing: 3)
        
        kakaoStoryButton.setImage(UIImage(named: "profileStoryImg"), for: .normal)
        kakaoStoryButton.setTitle("카카오스토리", for: .normal)
        kakaoStoryButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        kakaoStoryButton.alignTextBelow(spacing: 3)
    }
}


