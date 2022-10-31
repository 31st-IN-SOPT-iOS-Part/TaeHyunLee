//
//  KakaoLoginViewModel.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/31.
//

import Foundation
import RxCocoa
import RxSwift

final class KakaoLoginViewModel {
    
    private var model = KakaoLoginModel(id: "", password: "")
    
    let emailObserver: BehaviorRelay<String>
    let passwordObserver: BehaviorRelay<String>
    
    init() {
        self.emailObserver = BehaviorRelay<String>(value: model.id)
        self.passwordObserver = BehaviorRelay<String>(value: model.password)
    }
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailObserver, passwordObserver)
            .map{ email, pw in
                return !email.isEmpty && !pw.isEmpty
            }
    }
    
}
