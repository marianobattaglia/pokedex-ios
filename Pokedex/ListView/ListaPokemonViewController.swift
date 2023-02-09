//
//  ViewController.swift
//  Pokedex
//
//  Created by Mariano Martin Battaglia on 07/02/2023.
//

import UIKit

class ListaPokemonViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchBarPokemon: UISearchBar!
    @IBOutlet weak var tablaPokemon: UITableView!
    
    // MARK: - Variables
    var pokemonManager = PokemonManager()
    var pokemons: [Pokemon] = []
    var pokemonSelected: Pokemon?
    var pokemonFilter: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaPokemon.register(UINib(nibName: "CeldaPokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        pokemonManager.delegate = self
        searchBarPokemon.delegate = self
        tablaPokemon.delegate = self
        tablaPokemon.dataSource = self
        
        searchBarPokemon.searchTextField.backgroundColor = UIColor.white
        searchBarPokemon.searchTextField.layer.cornerRadius = 14
        searchBarPokemon.layer.cornerCurve = .circular
        
        self.navigationController?.navigationBar.tintColor = .white
        
        pokemonManager.verPokemon()
    }

}

// MARK: - Searchbar
extension ListaPokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pokemonFilter = []
        
        if searchText == "" {
            pokemonFilter = pokemons
        } else {
            for pokemon in pokemons {
                if pokemon.name.lowercased().contains(searchText.lowercased()) {
                    pokemonFilter.append(pokemon)
                }
            }
        }
        self.tablaPokemon.reloadData()
    }
}

// MARK: - Delegate
extension ListaPokemonViewController: PokemonManagerDelegate {
    func mostrarListaPokemon(lista: [Pokemon]) {
        pokemons = lista
        
        DispatchQueue.main.async {
            self.pokemonFilter = lista
            self.tablaPokemon.reloadData()
        }
    }
}

// MARK: - TableView
extension ListaPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaPokemon.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaPokemonTableViewCell
        
        celda.idCell.text = "\(pokemonFilter[indexPath.row].id)"
        celda.nameCell.text = pokemonFilter[indexPath.row].name.capitalizingFirstLetter()
        celda.attackCell.text = "\(pokemonFilter[indexPath.row].attack)"
        celda.defenseCell.text = "\(pokemonFilter[indexPath.row].defense)"
        
        let type = pokemonFilter[indexPath.row].type.capitalizingFirstLetter()
        let color = UIColor(pokemonType: type)
        celda.typeCell.backgroundColor = color 
        celda.typeCell.textColor = type == "Normal" ? .black : .white
        celda.typeCell.text = " \(type) "
        
        if let urlString = pokemonFilter[indexPath.row].imageUrl as? String {
            if let imageUrl = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                    let image = UIImage(data: imageData)
                    
                    DispatchQueue.main.async {
                        celda.imageCell.image = image
                    }
                }
            }
        }
        
        return celda
    }
    
    // MARK: - Enviar datos a la vista detalle
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokemonSelected = pokemonFilter[indexPath.row]
        
        performSegue(withIdentifier: "verPokemon", sender: self)
        tablaPokemon.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verPokemon" {
            let verPokemon = segue.destination as! DetallePokemonViewController
            verPokemon.pokemonMostrar = pokemonSelected
        }
    }
    
}
