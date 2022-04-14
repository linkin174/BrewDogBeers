//
//  CustomTableViewCell.swift
//  BrewDogBeers
//
//  Created by Aleksandr Kretov on 14.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var productImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.text = ""
    }

    func setupCell(with product: Beer) {
        guard let imageURL = product.imageURL else { return }
        NetworkManager.shared.fetchImageWithAF(from: imageURL) { data in
            self.productImage.image = UIImage(data: data)
            self.nameLabel.text = product.name
        }
    }
}
