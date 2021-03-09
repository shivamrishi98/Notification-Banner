//
//  NotificationBannerView.swift
//  NotificationBanner
//
//  Created by Shivam Rishi on 08/03/21.
//

import UIKit

final class NotificationBannerView: UIView {
    
    enum NotificationBannerState {
       case warning
       case success
       case error
    }
    
    private var isTappable = true
    
    private var bannerView:UIView = UIView()
    
    private func configureBannerView(_ view:UIView,
                                     type: NotificationBannerState,
                                     text:String) -> UIView {
        bannerView = UIView(frame: CGRect(x: 0,
                                          y: -100,
                                          width: view.frame.size.width,
                                          height: 100))
        
        switch type {
        case .warning:
            bannerView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.8)
        case .success:
            bannerView.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.8)
        case .error:
            bannerView.backgroundColor = UIColor.systemRed.withAlphaComponent(0.8)
        }
        
        configureBannerLabel(view,text:text)
        
        return bannerView
    }
    
    private func configureBannerLabel(_ view:UIView,text:String) {
    
        let label = UILabel(frame: CGRect(x: 10,
                                          y: view.safeAreaInsets.top,
                                          width: view.frame.size.width-20,
                                          height: bannerView.frame.size.height-view.safeAreaInsets.top))

        label.text = text
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18,
                                 weight: .bold)
        bannerView.addSubview(label)
    }
    
    /// Shows banner view and dimiss 
    func showAndDismiss(_ view:UIView,
              type:NotificationBannerState,
              text:String,
              duration:TimeInterval = 0.5,
              delay:TimeInterval = 2,
              options:UIView.AnimationOptions = []) {
        
        
        let bannerView = configureBannerView(view,
                                             type: type,
                                             text:text)
        
        if isTappable {
            isTappable = false
            view.addSubview(bannerView)
            
            showBanner(bannerView)
            dismissBanner(bannerView,
                          duration: duration,
                          delay: delay,
                          options: options)
            
        }
        
    }
    

    private func showBanner(_ bannerView:UIView) {
        
        UIView.animate(withDuration: 0.5) {
            bannerView.frame = CGRect(x: 0,
                                      y:0,
                                      width: bannerView.frame.size.width,
                                      height: 100)
        }
    }
    
    private func dismissBanner(_ bannerView:UIView,
                               duration:TimeInterval,
                               delay:TimeInterval,
                               options:UIView.AnimationOptions) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: options,
            animations: {
                
                bannerView.frame = CGRect(x: 0,
                                          y:-100,
                                          width: bannerView.frame.size.width,
                                          height: 100)
            }, completion: { [weak self] finished in
                if finished {
                    self?.isTappable = true
                    bannerView.removeFromSuperview()
                }
            })
        
    }
    
}
