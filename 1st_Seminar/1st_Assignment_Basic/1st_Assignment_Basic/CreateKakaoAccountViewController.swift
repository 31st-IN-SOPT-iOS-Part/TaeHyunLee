//
//  CreateKaKaoAccountViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/04.
//

import UIKit

class CreateKakaoAccountViewController: UIViewController {
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 24, weight: .medium)
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
    
    private let passwordCheckTextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordCheckTextFieldUnderLine = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let createAccountButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(presentLoginSuccessButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
        view.backgroundColor = .white
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let components: [Any] = [titleLabel, emailInputTextField, emailInputTextFieldUnderLine, passwordTextField, passwordTextFieldUnderLine, passwordCheckTextField, passwordCheckTextFieldUnderLine, createAccountButton]

        for component in components {
            view.addSubview(component as! UIView)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailInputTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 130),
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
            
            passwordCheckTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            passwordCheckTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            passwordCheckTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            passwordCheckTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordCheckTextFieldUnderLine.topAnchor.constraint(equalTo: passwordCheckTextField.bottomAnchor),
            passwordCheckTextFieldUnderLine.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            passwordCheckTextFieldUnderLine.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            passwordCheckTextFieldUnderLine.heightAnchor.constraint(equalToConstant: 1),
            
            createAccountButton.topAnchor.constraint(equalTo: passwordCheckTextField.bottomAnchor, constant: 60),
            createAccountButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            createAccountButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            createAccountButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }
    
    @objc
    func presentLoginSuccessButton() {
        let kakaoLoginSuccessVC = KakaoLoginSuccessViewController()
        kakaoLoginSuccessVC.modalPresentationStyle = .fullScreen
        present(kakaoLoginSuccessVC, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
