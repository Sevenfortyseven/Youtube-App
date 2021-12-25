//
//  CustomTableViewCell.swift
//  Youtube App
//
//  Created by aleksandre on 23.12.21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // Self identifier
    private(set) static var identifier = "CustomTableViewCell"
    
    // MARK: - Instances

    
    
    // MARK: - Initialization
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubviews()
        initializeConstraints()
        initializeStackView()
        updateUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // Initialize Cell content
    public func initializeCellContent(_ video: Video) {
        
        // Video title
        self.videoTitle.text = video.title
        
        // Publish date

        self.videoDateLabel.text = DateFormatManager.formatDate(video.published)
        
        // Check cache before downloading image data
        if let cachedData = CacheManager.getVideoCache(video.thumbnail) {
            self.videoThumbnail.image = UIImage(data: cachedData)
            return
        } else {
            // Download video thumbnail data and set as the Video Thumbnail
            let url = URL(string: video.thumbnail)
            guard url != nil else {
                print("error with url object")
                return
            }
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                
                if error != nil || data == nil {
                    print("Error")
                    return
                }
                // Save Data into cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check if downloaded url matches the video thumbnail url
                if url!.absoluteString != video.thumbnail {
                    print("Cell was recycled and url doesn't match any more")
                    return
                }
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    // Set as video thumbnail
                    self.videoThumbnail.image = image
                }
            }
            // Start dataTask for video thumbnail
            dataTask.resume()
        }
    }
    
    
    // Adding Subviews
    private func addSubviews() {
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(videoTitle)
        self.contentView.addSubview(videoThumbnail)
        self.contentView.addSubview(videoDateLabel)
        
    }
    
    // Adding Arranged Subviews inside stackView
    private func initializeStackView() {
        stackView.addArrangedSubview(videoThumbnail)
        stackView.addArrangedSubview(videoTitle)
        stackView.addArrangedSubview(videoDateLabel)
        //        stackView.layoutIfNeeded()
    }
    
    // Update UI
    private func updateUI() {
        videoDateLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        videoTitle.setContentHuggingPriority(.defaultHigh, for: .vertical)
        videoThumbnail.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        // Cell selectionStyle off
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    // MARK: - Content View
    
    // Video Title
    private let videoTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 0
        title.textColor = .white
        title.font = .preferredFont(forTextStyle: .title2, compatibleWith: .current)
        title.textAlignment = .left
        return title
    }()
    
    // Video Thumbnail
    private let videoThumbnail: UIImageView = {
        let thumbnail = UIImageView()
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        thumbnail.contentMode = .scaleAspectFill
        thumbnail.layer.masksToBounds = true
        return thumbnail
    }()
    
    // Video Description
    private let videoDateLabel: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textAlignment = .left
        date.textColor = .white
        date.font = .preferredFont(forTextStyle: .footnote, compatibleWith: .current)
        return date
    }()
    
    // MARK: - Stack View Configuration
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: - Constraints
    
    private func initializeConstraints() {
        // Constants
        var constraints = [NSLayoutConstraint]()
        
        // Video Thumbnail
        constraints.append(videoThumbnail.widthAnchor.constraint(equalTo: videoThumbnail.heightAnchor, multiplier: 1280/720))
        
        // StackView
        constraints.append(stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20))
        constraints.append(stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20))
        
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
}
