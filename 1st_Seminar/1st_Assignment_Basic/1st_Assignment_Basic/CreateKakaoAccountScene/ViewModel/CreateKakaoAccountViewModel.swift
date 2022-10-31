//
//  CreateKakaoAccountViewModel.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/31.
//

import Foundation
import RxCocoa
import RxSwift

class CreateKakaoAccountViewModel {
    
    private var model = CreateKakaoAccountModel(id: "", password: "", passwordCheck: "")
    
    let idObserver: BehaviorRelay<String>
    let passwordObserver: BehaviorRelay<String>
    let passwordCheckObserver: BehaviorRelay<String>
    
    init() {
        idObserver = BehaviorRelay<String>(value: model.id)
        passwordObserver = BehaviorRelay<String>(value: model.password)
        passwordCheckObserver = BehaviorRelay<String>(value: model.passwordCheck)
    }
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(idObserver, passwordObserver, passwordCheckObserver)
            .map{ id, pw, pwCheck in
                return !id.isEmpty && !pw.isEmpty && !pwCheck.isEmpty && (pw == pwCheck)
            }
    }
}
