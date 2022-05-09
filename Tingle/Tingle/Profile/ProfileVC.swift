//
// ViewController.swift
// ProfileView
//
// Created by Devesh Kumar Singh on 05/05/22.
//

import UIKit

class ProfileVC: UIViewController {
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.scrollsToTop = true
        return view
    }()
    let upperView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let lowerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "tony")
        view.layer.cornerRadius = 130
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 4
        view.backgroundColor = UIColor.white
        return view
    }()
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tony Stark"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: "Arial", size: 32)
        return label
    }()
    let professionalName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Engineer"
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        label.font = UIFont(name: "Avenir", size: 23)
        return label
    }()
    let email: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "tony@gmail.com"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: "Avenir", size: 23)
        return label
    }()
    let birthdate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "17-Nov-2000"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: "Avenir", size: 23)
        return label
    }()
    let contactNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+91 9411805464"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: "Avenir", size: 23)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        addConstraints()
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: 375, height: 120)
    }
    func addSubViews(){
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(upperView)
        self.scrollView.addSubview(lowerView)
        self.scrollView.addSubview(imageView)
        self.scrollView.addSubview(name)
        self.scrollView.addSubview(professionalName)
        self.scrollView.addSubview(email)
        self.scrollView.addSubview(birthdate)
        self.scrollView.addSubview(contactNumber)
    }
    func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        
        constraints.append(scrollView.topAnchor.constraint(equalTo: self.view.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor))
        
        constraints.append(upperView.topAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.topAnchor))
        constraints.append(upperView.bottomAnchor.constraint(equalTo: self.scrollView.centerYAnchor,constant: -200))
        constraints.append(upperView.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(upperView.trailingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.trailingAnchor))
        
        
        constraints.append(lowerView.topAnchor.constraint(equalTo: upperView.bottomAnchor))
        constraints.append(lowerView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor))
        constraints.append(lowerView.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(lowerView.trailingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.trailingAnchor))
        
        constraints.append(imageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor))
        constraints.append(imageView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor,constant: -150))
        constraints.append(imageView.heightAnchor.constraint(equalToConstant: 270))
        constraints.append(imageView.widthAnchor.constraint(equalToConstant: 270))
        
        constraints.append(name.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 15))
        constraints.append(name.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor))
        constraints.append(name.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(name.trailingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(name.heightAnchor.constraint(equalToConstant: 50))
        
        
        constraints.append(professionalName.topAnchor.constraint(equalTo: name.bottomAnchor,constant: 05))
        constraints.append(professionalName.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor))
        constraints.append(professionalName.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(professionalName.trailingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(professionalName.heightAnchor.constraint(equalToConstant: 25))
        
        constraints.append(email.topAnchor.constraint(equalTo: professionalName.bottomAnchor,constant: 30))
        constraints.append(email.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(email.trailingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(email.heightAnchor.constraint(equalToConstant: 25))
        
        constraints.append(birthdate.topAnchor.constraint(equalTo: email.bottomAnchor,constant: 30))
        constraints.append(birthdate.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(birthdate.trailingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(birthdate.heightAnchor.constraint(equalToConstant: 25))
        
        constraints.append(contactNumber.topAnchor.constraint(equalTo: birthdate.bottomAnchor,constant: 30))
        constraints.append(contactNumber.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(contactNumber.trailingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(contactNumber.heightAnchor.constraint(equalToConstant: 25))
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
}
