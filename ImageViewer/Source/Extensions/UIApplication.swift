//
//  UIApplication.swift
//  ImageViewer
//
//  Created by Kristian Angyal on 19/07/2016.
//  Copyright © 2016 MailOnline. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static var applicationWindow: UIWindow {
        if #available(iOS 13.0, *) {
            return (UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first)!
        } else {
            return UIApplication.shared.keyWindow!
        }
    }
    
    static var isPortraitOnly: Bool {
        
        let orientations = UIApplication.shared.supportedInterfaceOrientations(for: nil)
        
        return !(orientations.contains(.landscapeLeft) || orientations.contains(.landscapeRight) || orientations.contains(.landscape))
    }
}
