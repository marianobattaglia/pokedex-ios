//
//  CeldaPokemonTableViewCell.swift
//  Pokedex
//
//  Created by Mariano Martin Battaglia on 07/02/2023.
//

import UIKit

class CeldaPokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var attackCell: UILabel!
    @IBOutlet weak var defenseCell: UILabel!
    @IBOutlet weak var typeCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageCell.layer.cornerRadius = 15
        typeCell.layer.masksToBounds = true
        typeCell.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
