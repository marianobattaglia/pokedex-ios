//
//  UIColor+Extensions.swift
//  Pokedex
//
//  Created by Mariano Martin Battaglia on 08/02/2023.
//

import UIKit

extension UIColor {
    convenience init(pokemonType: String) {
        switch pokemonType {
        case "Fire": self.init(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.8)
        case "Poison": self.init(red: 48.0/255.0, green: 209.0/255.0, blue: 88.0/255.0, alpha: 0.8)
        case "Water": self.init(red: 10.0/255.0, green: 132.0/255.0, blue: 255.0/255.0, alpha: 0.8)
        case "Bug": self.init(red: 48.0/255.0, green: 209.0/255.0, blue: 88.0/255.0, alpha: 0.8)
        case "Flying": self.init(red: 100.0/255.0, green: 210.0/255.0, blue: 255.0/255.0, alpha: 0.8)
        case "Electric": self.init(red: 255.0/255.0, green: 214.0/255.0, blue: 10.0/255.0, alpha: 0.8)
        case "Ground": self.init(red: 172.0/255.0, green: 142.0/255.0, blue: 104.0/255.0, alpha: 0.8)
        case "Fairy": self.init(red: 255.0/255.0, green: 55.0/255.0, blue: 95.0/255.0, alpha: 0.8)
        case "Grass": self.init(red: 48.0/255.0, green: 209.0/255.0, blue: 88.0/255.0, alpha: 0.8)
        case "Fighting": self.init(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 0.8)
        case "Psychic": self.init(red: 191.0/255.0, green: 90.0/255.0, blue: 242.0/255.0, alpha: 0.8)
        case "Steel": self.init(red: 142.0/255.0, green: 142.0/255.0, blue: 147.0/255.0, alpha: 0.8)
        case "Ice": self.init(red: 100.0/255.0, green: 210.0/255.0, blue: 255.0/255.0, alpha: 0.8)
        case "Rock": self.init(red: 172.0/255.0, green: 142.0/255.0, blue: 104.0/255.0, alpha: 0.8)
        case "Dragon": self.init(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.8)
        default: self.init(red: 174.0/255.0, green: 174.0/255.0, blue: 178.0/255.0, alpha: 0.8)
        }
    }
}
