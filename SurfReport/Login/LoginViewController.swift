//
//  LoginViewController.swift
//  SurfReport
//
//  Created by Dalton Turner on 6/29/22.
//

import Foundation
import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogIn()
}

class LoginViewController: UIViewController {
    
    let titleView = UILabel()
    let subtitleView = UILabel()
    let loginView = LoginView()
    let loginButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let gradientLayer = CAGradientLayer()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    func style() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemCyan.cgColor,
            UIColor.white.cgColor,
            UIColor.systemBrown.cgColor,
        ]
        view.layer.addSublayer(gradientLayer)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = "SurfReport"
        titleView.font = titleView.font.withSize(34)
        titleView.textAlignment = .center
        titleView.textColor = .label
        titleView.numberOfLines = 0
        
        subtitleView.translatesAutoresizingMaskIntoConstraints = false
        subtitleView.text = "Get Barreled™️"
        subtitleView.font = subtitleView.font.withSize(17)
        subtitleView.textAlignment = .center
        subtitleView.textColor = .label
        subtitleView.numberOfLines = 0
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configuration = .filled()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.configuration?.imagePadding = 8
        loginButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.isHidden = true
        errorMessageLabel.numberOfLines = 0
    }
    
    func layout() {
        view.addSubview(titleView)
        view.addSubview(subtitleView)
        view.addSubview(loginView)
        view.addSubview(loginButton)
        view.addSubview(errorMessageLabel)
        
        // Title View
        NSLayoutConstraint.activate([
            titleView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            titleView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // Subtitle View
        NSLayoutConstraint.activate([
            subtitleView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -66),
            subtitleView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // Layout LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
        ])
        
        // Layout LoginButton
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 3),
            loginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: loginView.leadingAnchor, multiplier: 2),
            loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 2),
        ])
        
        // Layout errorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 3),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: errorMessageLabel.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    func login() {
        guard let username = username, let password = password else {
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank")
            return
        } else if username == "Dalton" && password == "Hi" {
            loginButton.configuration?.showsActivityIndicator = true
            delegate?.didLogIn()
        } else {
            configureView(withMessage: "Incorrect Username / Password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
