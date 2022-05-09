//
//  ViewController.swift
//  Final Project Demo
//
//  Created by Abhishek Kumar on 03/05/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var data = [Event(startTime: Date(timeIntervalSinceNow: 12000), duration: 60, organiser: "AuthorXYZ", joinLink: "joinLink", description: "desciption", title: "Title", imageUrl: "imgageUrl", charges: 0, availableSeats: 100, category: .chat),
                Event(startTime: Date(timeIntervalSinceNow: -200), duration: 120, organiser: "AuthorABC", joinLink: "joinLink", description: "desciption", title: "Title2", imageUrl: "imgageUrl", charges: 0, availableSeats: 100, category: .chat),
                Event(startTime: Date(timeIntervalSinceNow: -6000), duration: 30, organiser: "AuthorDEF", joinLink: "joinLink", description: "desciption", title: "Title3", imageUrl: "imgageUrl", charges: 0, availableSeats: 100, category: .video),]
    private let tableView: UITableView = {
        let someTableView = UITableView()
        someTableView.translatesAutoresizingMaskIntoConstraints = false
        return someTableView
    }()
    
    private func setupUI() {
        view.addSubview(tableView)
    }
    
    private func setupConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    private func setupNav() {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "profile"), for: UIControl.State.normal)
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
        setupConstraint()
        setupNav()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(DashboardTableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    @objc func profileTapped() {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
}



extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[0].startTime.formatted(date: .abbreviated, time: .omitted)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  DashboardTableViewCell else {
            return UITableViewCell()
        }   // returns a reusable cell
        cell.titleLabel.text = "\(data[indexPath.row].title) | \(data[indexPath.row].startTime.formatted(date: .omitted, time: .shortened))"
        cell.authorLabel.text = data[indexPath.row].organiser
        
        let currDate = Date()
        let eventStartTime = data[indexPath.row].startTime
        let eventEndTime = data[indexPath.row].startTime + TimeInterval(60*data[indexPath.row].duration)
        
        if currDate > eventEndTime {
            cell.view.backgroundColor = .systemTeal
            cell.joinButton.isHidden = true
        } else if eventStartTime <= currDate {
            cell.view.backgroundColor = .systemGreen
        } else {
            cell.view.backgroundColor = .systemYellow
        }
        
        switch data[indexPath.row].category {
            
        case .chat:
            cell.categoryImageView.image = UIImage(named: "bubble.left.fill")
        case .video:
            cell.categoryImageView.image = UIImage(named: "video.fill")
        }
        return cell
    }
}


extension DashboardViewController: UITableViewDelegate {
    
}
