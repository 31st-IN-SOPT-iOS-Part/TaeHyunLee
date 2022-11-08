//
//  PlusGridViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/11/02.
//

import UIKit

class PlusGridViewController: UIViewController {
    
    final let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    private lazy var dismissButton = UIButton().then {
        $0.setImage(UIImage(named: "Vector"), for: .normal)
        $0.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "최근항목"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = .black
    }
    
    private let sendButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private var images: [String] = []
    var checkArray: [Bool] = []
    var seq: [Int] = []
    var count = 0
    
    private lazy var gridCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PlusGridCollectionViewCell.self, forCellWithReuseIdentifier: PlusGridCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.setBackground()
        setViews()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        dismiss(animated: true)
    }
    
    @objc
    private func dismissView() {
        self.dismiss(animated: true)
    }
    
}

extension PlusGridViewController {
    
    private func setViews() {
        view.addSubviews(dismissButton, titleLabel, sendButton, gridCollectionView)
        
        for i in 1 ... 23 {
            images.append("galleryImage\(i)")
        }
        
        checkArray = Array(repeating: false, count: images.count)
        
    }
    
    private func layout() {
        
        dismissButton.snp.makeConstraints {
            $0.leading.equalTo(view.layoutMarginsGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            $0.height.width.equalTo(18)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            $0.height.equalTo(18)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            $0.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(18)
        }
        
        gridCollectionView.snp.makeConstraints {
            $0.top.equalTo(dismissButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
    
}

extension PlusGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width/3 - 20
        return CGSize(width: screenWidth, height: screenWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return inset
    }
    
}

extension PlusGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let gridCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlusGridCollectionViewCell.identifier, for: indexPath) as? PlusGridCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        gridCell.imageView.image = UIImage(named: images[indexPath.row])
        
        checkArray[indexPath.row] ? gridCell.changeCell(width: 3,
                                                        color: UIColor.yellow.cgColor,
                                                        opacity: 1,
                                                        text: "\(seq.firstIndex(of: indexPath.row)!+1)") :
                                    gridCell.changeCell(width: 0,
                                                        color: UIColor.clear.cgColor,
                                                        opacity: 0,
                                                        text: "")
        
        count == 0 ? sendButton.setTitle("전송", for: .normal) : sendButton.setTitle("\(self.count) 전송", for: .normal)
        
        return gridCell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if checkArray[indexPath.row] == false {
            count += 1
            seq.append(indexPath.row)
        } else {
            count -= 1
            seq.remove(at: seq.firstIndex(of: indexPath.row)!)
        }
        
        checkArray[indexPath.row].toggle()
        
        collectionView.reloadData()
    }
    
}
