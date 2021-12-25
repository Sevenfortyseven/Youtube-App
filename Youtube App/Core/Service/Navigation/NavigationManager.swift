//
//  NavigationManager.swift
//  Youtube App
//
//  Created by aleksandre on 25.12.21.
//

import Foundation
import UIKit


class NavigationManager {
    
    enum TargetView {
        case mainPage
        case DetailsPage
    }
    
    enum TransitionStyle {
        case push, present
    }
    
    static func changeScene(from currentViewController: UIViewController, to chosenViewController: TargetView, with transitionStyle: TransitionStyle) {
        var targetVC: UIViewController!
        
        switch chosenViewController {
        case .mainPage:
            targetVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: MainViewController.identifier) as! MainViewController
        case .DetailsPage:
            targetVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DetailsViewController.identifier) as! DetailsViewController
        }
        
        switch transitionStyle {
        case .push:
            currentViewController.navigationController?.pushViewController(targetVC, animated: true)
        case .present:
            currentViewController.navigationController?.present(targetVC, animated: true)
        }
    }
}
