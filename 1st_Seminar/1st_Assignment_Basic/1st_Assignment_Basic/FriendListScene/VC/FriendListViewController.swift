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
    var name: String? = "이태현"
    
    // MARK: - UIComponents
    private let friendStack = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()

    private let friendLabel = UILabel().then {
        $0.text = "친구"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = .black
    }
    private let friendLabelImage = UIImageView().then {
        $0.image = UIImage(named: "settings 1")
    }

    private lazy var tableView: UITableView =  {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        layout()
        register()
    }
    
    // MARK: - Method
    func dataBinding(result: String) {
        self.name = result
    }
    
}

// MARK: - Extension
extension FriendListViewController {
    
    func layout() {
        
        view.addSubviews(friendStack, tableView)

        
        [friendLabel, friendLabelImage].forEach {
            friendStack.addArrangedSubview($0)
        }
        
        friendStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(18)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(friendStack.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60*8 + 100)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    private func register() {
        tableView.register(FriendListTableViewCell.self, forCellReuseIdentifier: FriendListTableViewCell.identifier)
        tableView.register(FriendListHeaderView.self, forHeaderFooterViewReuseIdentifier: FriendListHeaderView.identifier)
    }
    
}

extension FriendListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
            
            self.friendList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
            
        }
            
        action.backgroundColor = .red
        action.title = "삭제"

        let configuration = UISwipeActionsConfiguration(actions: [action])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
       }
    
}

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendListTableViewCell.identifier, for: indexPath) as? FriendListTableViewCell else { return UITableViewCell() }
        
        friendCell.dataBind(model: friendList[indexPath.row])
        return friendCell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendListHeaderView.identifier)
        return header
    }
}

