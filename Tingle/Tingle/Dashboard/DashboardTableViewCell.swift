//
//  DashboardTableViewCell.swift
//  Final Project Demo
//
//  Created by Abhishek Kumar on 04/05/22.
//

import Foundation
import UIKit

class DashboardTableViewCell: UITableViewCell {
    let view: UIView = {
        let someView = UIView()
        someView.translatesAutoresizingMaskIntoConstraints = false
        someView.backgroundColor = .systemYellow
        someView.layer.cornerRadius = 8
        return someView
    }()
    
    
    let dashboardImageView: UIImageView = {
        let someImageView = UIImageView()
        someImageView.translatesAutoresizingMaskIntoConstraints = false
        someImageView.image = UIImage(named: "noImage")
        someImageView.layer.cornerRadius = 30
        someImageView.clipsToBounds = true
        return someImageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title  .DateTime"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .purple
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Author: ____"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .purple
        return label
    }()
    
    let joinButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Join ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    
    let categoryImageView: UIImageView = {
        let someImageView = UIImageView()
        someImageView.translatesAutoresizingMaskIntoConstraints = false
        someImageView.image = UIImage(named: "video.fill")
        return someImageView
    }()
    
    private func setupUI() {
        contentView.addSubview(view)
        
        
        view.addSubview(dashboardImageView)
        view.addSubview(titleLabel)
        view.addSubview(joinButton)
        view.addSubview(authorLabel)
        view.addSubview(categoryImageView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 100),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            dashboardImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            dashboardImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            dashboardImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            dashboardImageView.widthAnchor.constraint(equalTo: dashboardImageView.heightAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 5),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            authorLabel.leadingAnchor.constraint(equalTo: dashboardImageView.trailingAnchor, constant: 20),
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            
            joinButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            joinButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            categoryImageView.leadingAnchor.constraint(equalTo: dashboardImageView.trailingAnchor, constant: 20),
            categoryImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        authorLabel.text = nil
        imageView?.image = nil
        joinButton.isEnabled = true
    }
}
