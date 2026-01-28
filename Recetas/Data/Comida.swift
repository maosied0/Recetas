//
//  Comida.swift
//  Recetas
//
//  Created by Jonathan Ibarra on 28/1/26.
//

import Foundation

struct ComidaBusqueda: Codable{
    let meals: [Comida]
}

struct Comida: Codable{
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
}
