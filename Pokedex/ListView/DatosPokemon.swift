//
//  DatosPokemon.swift
//  Pokedex
//
//  Created by Mariano Martin Battaglia on 07/02/2023.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
}
