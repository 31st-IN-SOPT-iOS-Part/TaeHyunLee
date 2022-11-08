//
//  PhotoViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/31.
//

import UIKit

class PhotoGridViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, FriendListModel>?
    
    private let chattingLabel = UILabel().then {
        $0.text = "채팅"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
    }
    
    private let openChattingLabel = UILabel().then {
        $0.text = "오픈채팅"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = .gray
    }
    
    private let leftTopStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
    }
    
    private lazy var presentButton = UIButton().then {
        $0.setImage(UIImage(named: "iconPlus"), for: .normal)
        $0.addTarget(self, action: #selector(presentGridView), for: .touchUpInside)
    }
    
    private let friendLabelImage = UIImageView().then {
        $0.image = UIImage(named: "settings 1")
    }
    
    private let rightTopStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
    }
    
    private let topContainerStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
    }
    
    private lazy var friendListCollectionView: UICollectionView = {
        var config = UICollectionLayoutListConfiguration(appearance: .grouped)
        config.headerMode = .supplementary
        config.backgroundColor = .white
        config.showsSeparators = false
        
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var friendList = [
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        // Do any additional setup after loading the view.
        setViews()
        layout()
        setUpCollection()
    }

    private func setUpCollection() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, FriendListModel> { cell, indexPath, friend in
            
            var content = cell.defaultContentConfiguration()
            content.attributedText = NSAttributedString(string: friend.name, attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .medium),
                .foregroundColor: UIColor.black
            ])
            content.secondaryAttributedText = NSAttributedString(string: friend.explain, attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .medium),
                .foregroundColor: UIColor.gray
            ])
            content.image = UIImage(named: friend.image)?.roundedImage
            cell.contentConfiguration = content
        }

        let headerRegistration = UICollectionView.SupplementaryRegistration<PhotoGridCollectionReusableView>(elementKind: UICollectionView.elementKindSectionHeader) {
            supplementaryView, string, indexPath in
            supplementaryView.backgroundColor = .white
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, FriendListModel>(collectionView: friendListCollectionView) {
            collectionView, indexPath, friend in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: friend)
        }

        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
        
        populate(with: friendList)
    }
    
    private func populate(with friends: [FriendListModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, FriendListModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(friends)
        dataSource?.apply(snapshot)
    }
    
    @objc
    private func presentGridView() {
        let plusGridVC = PlusGridViewController()
        plusGridVC.modalPresentationStyle = .currentContext
        present(plusGridVC, animated: true)
    }
    
}

extension PhotoGridViewController {
    
    private func setViews() {
        view.addSubviews(topContainerStackView, friendListCollectionView)
        
        [chattingLabel, openChattingLabel].forEach {
            leftTopStackView.addArrangedSubview($0)
        }
        
        [presentButton, friendLabelImage].forEach {
            rightTopStackView.addArrangedSubview($0)
        }
        
        [leftTopStackView, rightTopStackView].forEach {
            topContainerStackView.addArrangedSubview($0)
        }
        
    }
    
    private func layout() {
        
        topContainerStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(18)
        }
        
        friendListCollectionView.snp.makeConstraints {
            $0.top.equalTo(topContainerStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
}

extension PhotoGridViewController {
    enum Section {
        case main
    }
}
