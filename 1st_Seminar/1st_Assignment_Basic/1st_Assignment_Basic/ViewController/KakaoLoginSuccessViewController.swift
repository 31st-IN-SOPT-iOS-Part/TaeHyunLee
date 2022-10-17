//
//  KakaoLoginSuccessViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/04.
//

import UIKit

class KakaoLoginSuccessViewController: UIViewController {
    
    // MARK: - Data
    var name: String?
    
    // MARK: - Property
    private let welcomeLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = """
        OOO님
        환영합니다
        """
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(moveToFriendListButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let components: [Any] = [welcomeLabel, checkButton]
        
        for component in components {
            view.addSubview(component as! UIView)
        }
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 200),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            checkButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160),
            checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            checkButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        
    }
    
    // MARK: - Method
    func dataBinding(result: String) {
        name = result
        
        welcomeLabel.text = """
        \(result)님
        환영합니다
        """
    }
    
    // MARK: - objc
    @objc
    func moveToFriendListButton() {
//      MARK: - 도전과제 root view change
        let friendListVC = FriendListViewController()
        let navigationController = UINavigationController(rootViewController: friendListVC)
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        
        if let result = name {
            friendListVC.dataBinding(result: result)
        }
        
        navigationController.setNavigationBarHidden(true, animated: false)
        sceneDelegate.window?.rootViewController = navigationController
    }

}
