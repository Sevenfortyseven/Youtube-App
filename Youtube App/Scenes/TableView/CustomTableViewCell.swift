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
    
    // MARK: - Initialization

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubviews()
        initializeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // Adding Subviews
    private func addSubviews() {
        self.contentView.addSubview(videoTitle)
    }
    
    // MARK: - Content View
    
    public let videoTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 1
        title.backgroundColor = .blue
 
        return title
    }()
    
    // MARK: - Constraints
    
    private func initializeConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        // Video Title
        constraints.append(videoTitle.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor))
        constraints.append(videoTitle.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor))
        constraints.append(videoTitle.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 15))

        
        NSLayoutConstraint.activate(constraints)
        
    }
    
}
