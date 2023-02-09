//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Mariano Martin Battaglia on 07/02/2023.
//

import Foundation

protocol PokemonManagerDelegate {
    func mostrarListaPokemon(lista: [Pokemon])
}

struct PokemonManager {
    var delegate: PokemonManagerDelegate?
    
    func verPokemon() {
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("Error al obtener datos de la API ", error?.localizedDescription ?? "")
                }
                if let secureData = data?.parseData(remove: "null,") {
                    if let listPokemon = self.parseJSON(dataPokemon: secureData) {
                        print("Lista Pokemon: ", listPokemon)
                        delegate?.mostrarListaPokemon(lista: listPokemon)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(dataPokemon: Data) -> [Pokemon]? {
        let decoder = JSONDecoder()
        do {
            let dataDecoded = try decoder.decode([Pokemon].self, from: dataPokemon)
            return dataDecoded
        } catch {
            print("Error al decodificar los datos: ", error.localizedDescription)
            return nil
        }
    }
    
}

extension Data {
    func parseData(remove string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
