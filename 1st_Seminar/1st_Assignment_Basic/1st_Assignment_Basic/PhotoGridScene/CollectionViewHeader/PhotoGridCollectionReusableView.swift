//
//  PhotoGridCollectionViewHeader.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/11/02.
//

import UIKit

class PhotoGridCollectionReusableView: UICollectionReusableView {
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "CollectionheaderImage")
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

extension PhotoGridCollectionReusableView {
    
    func setViews() {
        addSubview(imageView)
    }
    
    func layout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
    
}
