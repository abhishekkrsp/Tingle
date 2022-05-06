//
//  BookingSectionHeader.swift
//  Final Project
//
//  Created by Piyush Agrawal on 05/05/22.
//

import UIKit

class BookingSectionHeader: UICollectionReusableView {
    @IBOutlet weak var sectionHeaderTitle: UILabel!
    @IBOutlet weak var sectionImage: UIImageView!
    var sectionTitle: String! {
        didSet {
            sectionHeaderTitle.text = sectionTitle
        }
    }
    var sectionImg: UIImage! {
        didSet {
            sectionImage.image = sectionImg
        }
    }
}
