//
//  ViewController.swift
//  Yapp
//
//  Created by aleksandre on 20.12.21.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ApiRequestDelegate {
    
    private(set) static var identifier = "MainViewController"
    
    // MARK: - Instances
    private var apiRequest = ApiRequest()
    private var videos = [Video]()
    
   
    
    // MARK: - IBOutlets
    @IBOutlet weak var customTableView: UITableView!
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        apiRequest.getVideos()
        registerTableView()
        apiRequest.delegate = self
        updateUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // MARK: - UI
    private func updateUI() {
        customTableView.backgroundColor  = .darkGray
        navigationController?.isNavigationBarHidden = true
    }
    
    
    // MARK: - TableView Delegate Methods and Configuration
    
    private func registerTableView() {
        self.customTableView.register(CustomTableViewCell.self , forCellReuseIdentifier: CustomTableViewCell.identifier)
        customTableView.delegate = self
        customTableView.dataSource = self
    }
    
    // Cells Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    // Cell Configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        // Configure the cell with data
        cell.initializeCellContent(videos[indexPath.row])
        
        //return the cell
        return cell
    }
    
    // Action on Cell interaction
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Target viewcontroller to pass data
        let selectedVideo = videos[indexPath.row]
        let targetVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DetailsViewController.identifier) as! DetailsViewController
        targetVC.video = selectedVideo
        // Navigate to DetailsPageController
        self.navigationController?.present(targetVC, animated: true, completion: nil)
  
    }
 
    
    // MARK: - Network Request Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        // set the fetched videos to our videos property
        self.videos = videos
        
        // refresh the tableView
        self.customTableView.reloadData()
        
        
    }
    
    
    
}

