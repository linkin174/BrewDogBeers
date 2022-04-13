//
//  AboutViewController.swift
//  BrewDogBeers
//
//  Created by Aleksandr Kretov on 13.04.2022.
//

import UIKit

class AboutViewController: UIViewController {
    
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productDescription: UILabel!
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productDescription.text = beer.productDescription
        NetworkManager.shared.fetchImage(from: beer.image_url ?? "") { data in
            DispatchQueue.main.async {
                self.productImage.image = UIImage(data: data)
            }
            
        }
    }
}
