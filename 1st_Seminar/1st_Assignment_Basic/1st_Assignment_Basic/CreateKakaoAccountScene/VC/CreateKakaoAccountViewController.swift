//
//  CreateKaKaoAccountViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/04.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

final class CreateKakaoAccountViewController: UIViewController {
    
    // MARK: - Property
    private var viewModel = CreateKakaoAccountViewModel()
    private var disposeBag = DisposeBag()
    
    // MARK: - UIComponents
    private let titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 24, weight: .medium)
    }
    
    private let emailInputTextField = UITextField().then {
        $0.placeholder = "이메일 또는 전화번호"
    }
    
    private let emailInputTextFieldUnderLine = UILabel().then {
        $0.backgroundColor = .gray
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    
    private let passwordTextFieldUnderLine = UILabel().then {
        $0.backgroundColor = .gray
    }
    
    private let passwordCheckTextField = UITextField().then {
        $0.placeholder = "비밀번호확인"
        $0.isSecureTextEntry = true
    }
    
    private let passwordCheckTextFieldUnderLine = UILabel().then {
        $0.backgroundColor = .gray
    }
    
    private lazy var createAccountButton = UIButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.backgroundColor = .systemGray4
        $0.addTarget(self, action: #selector(presentLoginSuccessButton), for: .touchUpInside)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.setBackground()
        setViews()
        layout()
        bindUI()
    }
    
    // MARK: - objc
    @objc
    private func presentLoginSuccessButton() {
        let kakaoLoginSuccessVC = KakaoLoginSuccessViewController()
        kakaoLoginSuccessVC.modalPresentationStyle = .fullScreen
        
        if let answer = emailInputTextField.text {
            kakaoLoginSuccessVC.dataBinding(result: answer)
        }
        
        present(kakaoLoginSuccessVC, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
}

extension CreateKakaoAccountViewController {
    // MARK: - AddViews
    private func setViews() {
        view.addSubviews(titleLabel, emailInputTextField, emailInputTextFieldUnderLine, passwordTextField, passwordTextFieldUnderLine, passwordCheckTextField, passwordCheckTextFieldUnderLine, createAccountButton)
    }
    
    // MARK: - Layout
    private func layout() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        emailInputTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(130)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(40)
        }
        
        emailInputTextFieldUnderLine.snp.makeConstraints {
            $0.top.equalTo(emailInputTextField.snp.bottom)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailInputTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(40)
        }
        
        passwordTextFieldUnderLine.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(1)
        }
        
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(40)
        }

        passwordCheckTextFieldUnderLine.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(1)
        }
        
        createAccountButton.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextFieldUnderLine.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: - Bind
    private func bindUI() {
        
        emailInputTextField.rx.text
            .orEmpty
            .bind(to: viewModel.idObserver)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .orEmpty
            .bind(to: viewModel.passwordObserver)
            .disposed(by: disposeBag)
        
        passwordCheckTextField.rx.text
            .orEmpty
            .bind(to: viewModel.passwordCheckObserver)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .map{ $0 ? UIColor.yellow : UIColor.systemGray4 }
            .bind(to: createAccountButton.rx.backgroundColor)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .bind(to: createAccountButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }
}
