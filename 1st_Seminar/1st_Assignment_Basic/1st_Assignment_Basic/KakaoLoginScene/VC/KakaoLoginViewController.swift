//
//  ViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/04.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

final class KakaoLoginViewController: UIViewController {
    
    // MARK: - Property
    private var viewModel = KakaoLoginViewModel()
    private var disposeBag = DisposeBag()
    
    // MARK: - UIComponents
    private let titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 24, weight: .medium)
    }
    
    private let explainLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = """
        사용하던 카카오계정이 있다면
        이메일 또는 전화번호로 로그인 해 주세요
        """
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.textAlignment = .center
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
    
    private lazy var loginButton = UIButton().then {
        $0.setTitle("카카오계정 로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.backgroundColor = .systemGray4
        $0.addTarget(self, action: #selector(presentLoginSuccessButton), for: .touchUpInside)
    }
    
    private lazy var createAccountButton = UIButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.backgroundColor = .systemGray4
        $0.addTarget(self, action: #selector(pushCreateAccountButton), for: .touchUpInside)
    }
    
    private let findAccountOrPasswordButton = UIButton().then {
        $0.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        emailInputTextField.text = ""
        passwordTextField.text = ""
    }
    
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
    }
    
    @objc
    private func pushCreateAccountButton() {
        let creatKakaoAccountVC = CreateKakaoAccountViewController()
        self.navigationController?.pushViewController(creatKakaoAccountVC, animated: true)
    }
}

extension KakaoLoginViewController {
    // MARK: - AddViews
    private func setViews() {
        view.addSubviews(titleLabel, explainLabel, emailInputTextField,  emailInputTextFieldUnderLine, passwordTextField, passwordTextFieldUnderLine, loginButton, createAccountButton, findAccountOrPasswordButton)
    }
    
    // MARK: - Layout
    private func layout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        emailInputTextField.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(80)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(40)
        }
        
        emailInputTextFieldUnderLine.snp.makeConstraints {
            $0.top.equalTo(emailInputTextField.snp.bottom)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailInputTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(40)
        }
        
        passwordTextFieldUnderLine.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(1)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(40)
        }
        
        createAccountButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.height.equalTo(40)
        }
        
        findAccountOrPasswordButton.snp.makeConstraints {
            $0.top.equalTo(createAccountButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Bind
    private func bindUI() {
        
        emailInputTextField.rx.text
            .orEmpty
            .bind(to: viewModel.emailObserver)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .orEmpty
            .bind(to: viewModel.passwordObserver)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .map{ $0 ? UIColor.yellow : UIColor.systemGray4 }
            .bind(to: loginButton.rx.backgroundColor)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}
