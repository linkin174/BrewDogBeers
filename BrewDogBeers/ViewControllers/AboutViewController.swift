//
//  AboutViewController.swift
//  BrewDogBeers
//
//  Created by Aleksandr Kretov on 13.04.2022.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var characteristicsLabel: UILabel!
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFontDependingOnDevice()
        descriptionLabel.text = beer.description
        characteristicsLabel.text = beer.characteristics
        NetworkManager.shared.fetchImage(from: beer.imageURL ?? "") { data in
            DispatchQueue.main.async {
                self.productImage.image = UIImage(data: data)
            }
            
        }
    }
    
    private func setFontDependingOnDevice() {
        let screenSizeY = UIScreen.main.bounds.maxY
        if screenSizeY <= 568 {
            descriptionLabel.font = UIFont(name:"AvenirNextCondensed-Regular", size: 14)
        } else if screenSizeY <= 667 {
            descriptionLabel.font = UIFont(name:"AvenirNextCondensed-Regular", size: 16)
        } else {
            descriptionLabel.font = UIFont(name:"AvenirNextCondensed-Regular", size: 20)
        }
    }
}
