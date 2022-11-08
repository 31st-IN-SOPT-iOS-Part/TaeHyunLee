//
//  PlusGridCollectionViewCell.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/11/02.
//

import UIKit

class PlusGridCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GridCollectionViewCell"
    
    let imageView = UIImageView()
    let checkLabel = UILabel().then {
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
        $0.text = ""
        $0.textAlignment = .center
        $0.backgroundColor = .yellow
        $0.layer.opacity = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PlusGridCollectionViewCell {
    
    func setViews() {
        addSubviews(imageView, checkLabel)
    }
    
    func layout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        checkLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(3)
            $0.top.equalToSuperview().inset(3)
            $0.height.width.equalTo(30)
        }
        
    }
    
    func changeCell(width: CGFloat, color: CGColor, opacity: Float, text: String) {
        imageView.layer.borderWidth = width
        imageView.layer.borderColor = color
        checkLabel.layer.opacity = opacity
        checkLabel.text = text
    }
    
}
