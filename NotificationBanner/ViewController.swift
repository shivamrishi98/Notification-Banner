//
//  ViewController.swift
//  NotificationBanner
//
//  Created by Shivam Rishi on 08/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let notificationBannerView = NotificationBannerView()
    
    private let errorButton:UIButton = {
        let button = UIButton()
        button.setTitle("Show Error", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()
    
    private let warningButton:UIButton = {
        let button = UIButton()
        button.setTitle("Show Warning", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemYellow
        return button
    }()
    
    private let successButton:UIButton = {
        let button = UIButton()
        button.setTitle("Show Success", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(errorButton)
        view.addSubview(warningButton)
        view.addSubview(successButton)
        
        errorButton.addTarget(self,
                         action: #selector(didTapErrorButton),
                         for: .touchUpInside)
        warningButton.addTarget(self,
                         action: #selector(didTapWarningButton),
                         for: .touchUpInside)
        successButton.addTarget(self,
                         action: #selector(didTapSuccessButton),
                         for: .touchUpInside)
    }
    

    @objc private func didTapErrorButton() {
        DispatchQueue.main.async {
            self.notificationBannerView.showAndDismiss(self.view,
                                             type: .error,
                                             text: "Error")
        }
    }
    
    @objc private func didTapWarningButton() {
        DispatchQueue.main.async {
            
            self.notificationBannerView.showAndDismiss(self.view,
                                             type: .warning,
                                             text: "Warning")
        }
    }
    
    @objc private func didTapSuccessButton() {
        DispatchQueue.main.async {
            
            self.notificationBannerView.showAndDismiss(self.view,
                                             type: .success,
                                             text: "Success")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        errorButton.frame = CGRect(
            x: 20,
            y: (view.frame.size.height-50)/2,
            width: view.frame.size.width-40,
            height: 50)
        
        warningButton.frame = CGRect(
            x: 20,
            y: (errorButton.frame.origin.y + errorButton.frame.size.height) + 20,
            width: view.frame.size.width-40,
            height: 50)
        
        successButton.frame = CGRect(
            x: 20,
            y: (warningButton.frame.origin.y + warningButton.frame.size.height) + 20,
            width: view.frame.size.width-40,
            height: 50)
        
        
    }

}

