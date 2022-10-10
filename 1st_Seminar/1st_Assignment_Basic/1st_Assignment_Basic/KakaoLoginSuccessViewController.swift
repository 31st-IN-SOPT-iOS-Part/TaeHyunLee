//
//  KakaoLoginSuccessViewController.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/04.
//

import UIKit

class KakaoLoginSuccessViewController: UIViewController {
    
    var name: String?
    
    private let welcomeLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = """
        OOO님
        환영합니다
        """
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let components: [Any] = [welcomeLabel, checkButton]
        
        for component in components {
            view.addSubview(component as! UIView)
        }
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 200),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            checkButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160),
            checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            checkButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        
    }
    
    @objc
    func backButton() {
        dismiss(animated: true)
    }
    
    func dataBinding(result: String) {
        welcomeLabel.text = """
        \(result)님
        환영합니다
        """
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
