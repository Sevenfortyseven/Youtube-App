//
//  ViewController.swift
//  Yapp
//
//  Created by aleksandre on 20.12.21.
//

import UIKit

class ViewController: UIViewController {
    
    var apiRequest = ApiRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        apiRequest.getVideos()
    }


}

