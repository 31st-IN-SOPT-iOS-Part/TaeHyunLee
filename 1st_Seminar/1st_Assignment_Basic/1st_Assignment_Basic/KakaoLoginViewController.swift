//
//  ViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/04.
//

import UIKit

class KakaoLoginViewController: UIViewController {
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let explainLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = """
        사용하던 카카오계정이 있다면
        이메일 또는 전화번호로 로그인 해 주세요
        """
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailInputTextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 전화번호"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailInputTextFieldUnderLine = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextFieldUnderLine = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginButton = {
        let button = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(presentLoginSuccessButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let createAccountButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(pushCreateAccountButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let findAccountOrPasswordButton = {
        let button = UIButton()
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let components: [Any] = [titleLabel, explainLabel, emailInputTextField,  emailInputTextFieldUnderLine, passwordTextField, passwordTextFieldUnderLine, loginButton, createAccountButton, findAccountOrPasswordButton]

        for component in components {
            view.addSubview(component as! UIView)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            explainLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            explainLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            explainLabel.heightAnchor.constraint(equalToConstant: 40),
            
            emailInputTextField.topAnchor.constraint(equalTo: explainLabel.bottomAnchor, constant: 80),
            emailInputTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            emailInputTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            emailInputTextField.heightAnchor.constraint(equalToConstant: 40),
            
            emailInputTextFieldUnderLine.topAnchor.constraint(equalTo: emailInputTextField.bottomAnchor),
            emailInputTextFieldUnderLine.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            emailInputTextFieldUnderLine.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            emailInputTextFieldUnderLine.heightAnchor.constraint(equalToConstant: 1),
            
            passwordTextField.topAnchor.constraint(equalTo: emailInputTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextFieldUnderLine.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            passwordTextFieldUnderLine.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            passwordTextFieldUnderLine.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            passwordTextFieldUnderLine.heightAnchor.constraint(equalToConstant: 1),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            loginButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            loginButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            createAccountButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            createAccountButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            createAccountButton.heightAnchor.constraint(equalToConstant: 40),
            
            findAccountOrPasswordButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 10),
            findAccountOrPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    @objc
    func presentLoginSuccessButton() {
        let kakaoLoginSuccessVC = KakaoLoginSuccessViewController()
        kakaoLoginSuccessVC.modalPresentationStyle = .fullScreen
        present(kakaoLoginSuccessVC, animated: true)
    }
    
    @objc
    func pushCreateAccountButton() {
        let creatKakaoAccountVC = CreateKakaoAccountViewController()
        self.navigationController?.pushViewController(creatKakaoAccountVC, animated: true)
    }
    
    
}
