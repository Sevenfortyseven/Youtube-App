//
//  DetailsViewController.swift
//  Youtube App
//
//  Created by aleksandre on 25.12.21.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController{
    
  
    // Self identifier
    private(set) static var identifier = "DetailsViewController"
    
    // MARK: - IBOutlets
    
    
    
    // MARK: - Instances
    public var video: Video?

    
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        initializeStackView()
        initializeConstraints()
        updateUI()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        initializeContent()
    }
    
    // Populate view with subviews
    private func addSubViews() {
        self.view.addSubview(mainStackView)
    }
    
    // Populate stackView with arranged subviews
    private func initializeStackView() {
        mainStackView.addArrangedSubview(titleLabel)
//        mainStackView.addArrangedSubview(dateLabel)
        mainStackView.addArrangedSubview(webView)
        mainStackView.addArrangedSubview(videoDescription)
        
    }
    
    // MARK: - UI
    
    private func updateUI() {
        self.view.backgroundColor = .darkGray
    }
    
    // MARK: - Content View
    
    // Title label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline, compatibleWith: .current)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    // Date label
//    private let dateLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    // Webkit View
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    // Video description
    private let videoDescription: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .white
        textView.backgroundColor = .clear
        textView.setContentHuggingPriority(.defaultLow, for: .vertical)
        textView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return textView
    }()
    
    // MARK: - StackView Configuration
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    // MARK: - Content Initialization
    
    private func initializeContent() {
        // Check if video is available
        guard video != nil else {
            print("video data not available")
            return
        }
        // Create an embed url
        let embedUrl = Constants.YT_EMBED_URL + video!.videoId
        
        // load url into webView
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webView.load(request)
        
//        // set the date
//        dateLabel.text = DateFormatManager.formatDate(video!.published)
        
        // set the title
        titleLabel.text = video!.title
        
        // set the description
        videoDescription.text = video!.description
    }
    
    // MARK: - Delegate Methods
    

    
    
    
    // MARK: - Constraints
    
    private func initializeConstraints() {
        let videoAspectRatio = CGFloat(1280/720)
        var constraints = [NSLayoutConstraint]()
        
        // Main StackView
        constraints.append(mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50.0))
        constraints.append(mainStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0))
        constraints.append(mainStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0))
        constraints.append(mainStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0))
        
        // WebView
        constraints.append(webView.widthAnchor.constraint(equalTo: webView.heightAnchor, multiplier: videoAspectRatio))
        
        NSLayoutConstraint.activate(constraints)
    }
}
