//
//  ViewController.swift
//  Final Project
//
//  Created by Piyush Agrawal on 04/05/22.
//

import UIKit

class BookingViewController: UIViewController {
    @IBOutlet var bookingCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupCollectionView()
    }
    
    func setupCollectionView() {

        bookingCollectionView.dataSource = self
        bookingCollectionView.delegate = self
        bookingCollectionView.register(BookingCollectionViewCell.nib(), forCellWithReuseIdentifier: "BookingCollectionViewCell")
    }
    
    func generateRandomColor() -> UIColor {
        let levelColors: [UIColor] = [.systemRed, .systemCyan, .systemPink, .systemMint, .systemGreen, .systemPurple, .systemOrange, .systemTeal]
//        let redValue = CGFloat.random(in: 0...1)
//        let greenValue = CGFloat.random(in: 0...1)
//        let blueValue = CGFloat.random(in: 0...1)
//        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 0.7)
        return levelColors.randomElement()!
    }
}

extension BookingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bookingCollectionView.dequeueReusableCell(withReuseIdentifier: "BookingCollectionViewCell", for: indexPath) as! BookingCollectionViewCell
        cell.backgroundColor = generateRandomColor()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "BookingSectionHeader", for: indexPath) as? BookingSectionHeader{
            if indexPath.section == 0 {
                sectionHeader.sectionTitle  = "Video Chat"
                sectionHeader.sectionImg = UIImage(systemName: "video.bubble.left")
            } else {
                sectionHeader.sectionTitle = "Chit Chat"
                sectionHeader.sectionImg = UIImage(systemName: "message.circle")
            }
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
}
