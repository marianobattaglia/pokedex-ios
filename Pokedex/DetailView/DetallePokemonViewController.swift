//
//  DetallePokemonViewController.swift
//  Pokedex
//
//  Created by Mariano Martin Battaglia on 08/02/2023.
//

import UIKit

class DetallePokemonViewController: UIViewController {
    var pokemonMostrar: Pokemon?
    
    @IBOutlet weak var idPokemon: UILabel!
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var descriptionPokemon: UILabel!
    @IBOutlet weak var typePokemon: UILabel!
    @IBOutlet weak var attackPokemon: UILabel!
    @IBOutlet weak var defensePokemon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePokemon.loadFrom(URLAddress: pokemonMostrar?.imageUrl ?? "")
        descriptionPokemon.text = pokemonMostrar?.description
        
        attackPokemon.text = "\(pokemonMostrar?.attack ?? 0)"
        defensePokemon.text = "\(pokemonMostrar?.defense ?? 0)"
        idPokemon.text = "\(pokemonMostrar?.id ?? 0)"
        
        if let type = pokemonMostrar?.type.capitalizingFirstLetter() {
            let color = UIColor(pokemonType: type)
            typePokemon.layer.masksToBounds = true
            typePokemon.layer.cornerRadius = 10
            typePokemon.backgroundColor = color
            typePokemon.textColor = type == "Normal" ? .black : .white
            typePokemon.text = " \(type) "
        }
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backItem?.title = ""
        self.title = pokemonMostrar?.name.capitalizingFirstLetter()
    }
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else { return }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
