//
//  FriendListViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/11.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import RxDataSources

final class FriendListViewController: UIViewController{
    
    // MARK: - Data
    var name: String? = "이태현"
    var disposeBag = DisposeBag()
    var viewModel = FriendListViewModel()
    
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
        return table
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        layout()
        register()
        bindUI()
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
            $0.height.equalTo(60*8)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    private func register() {
        tableView.register(FriendListTableViewCell.self, forCellReuseIdentifier: FriendListTableViewCell.identifier)
        tableView.register(FriendListHeaderView.self, forHeaderFooterViewReuseIdentifier: FriendListHeaderView.identifier)
    }
    
    private func bindUI() {
        
        let dataSource = RxTableViewSectionedReloadDataSource<FriendSection> { dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: FriendListTableViewCell.identifier, for: indexPath) as! FriendListTableViewCell
            cell.dataBind(model: item)
            return cell
        }
        
        dataSource.canEditRowAtIndexPath = { dataSource, indexPath  in
            return true
        }
        
        Observable.just(viewModel.sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
    }
    
}

extension FriendListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = FriendListHeaderView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
}
