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
    let strMeal: String // Titulo
    let strCategory: String
    let strArea: String //Ciudad
    
    let strMealThumb: String //Imagen
    let strInstructions: String? //Detalles de como se hace el prodcuto
    let strYoutube: String? //YouTube
    let strSource: String? //Pagina externa para hacer el pro
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    func getIngredients() -> [String] {
        var ingredientsList: [String] = [
            strIngredient1 ?? "",
            strIngredient2 ?? "",
            strIngredient3 ?? "",
            strIngredient4 ?? "",
            strIngredient5 ?? "",
            strIngredient6 ?? "",
            strIngredient7 ?? "",
            strIngredient8 ?? "",
            strIngredient9 ?? "",
            strIngredient10 ?? "",
            strIngredient11 ?? "",
            strIngredient12 ?? "",
            strIngredient13 ?? "",
            strIngredient14 ?? "",
            strIngredient15 ?? "",
            strIngredient16 ?? "",
            strIngredient17 ?? "",
            strIngredient18 ?? "",
            strIngredient19 ?? "",
            strIngredient20 ?? "",
        ]
        
        ingredientsList = ingredientsList.filter { ingredient in
            !ingredient.isEmpty
        }
        
        return ingredientsList
    }
    
    func getMeasures() -> [String] {
        var measuresList: [String] = [
            strMeasure1 ?? "",
            strMeasure2 ?? "",
            strMeasure3 ?? "",
            strMeasure4 ?? "",
            strMeasure5 ?? "",
            strMeasure6 ?? "",
            strMeasure7 ?? "",
            strMeasure8 ?? "",
            strMeasure9 ?? "",
            strMeasure10 ?? "",
            strMeasure11 ?? "",
            strMeasure12 ?? "",
            strMeasure13 ?? "",
            strMeasure14 ?? "",
            strMeasure15 ?? "",
            strMeasure16 ?? "",
            strMeasure17 ?? "",
            strMeasure18 ?? "",
            strMeasure19 ?? "",
            strMeasure20 ?? "",
        ]
        
        measuresList = measuresList.filter { measure in
            !measure.trimmingCharacters(in: .whitespaces).isEmpty
        }
        
        return measuresList
    }
    
    
 /*   enum CodingKeys: String, CodingKey {
        case strInstructions = "instrucciones"
        case strYoutube = "video"
        case strSource = "origen"
        case strIngredient1 = "ingrediente1"
        case strIngredient2 = "ingrediente2"
        case strIngredient3 = "ingrediente3"
        case strIngredient4 = "ingrediente4"
        case strIngredient5 = "ingrediente5"
        case strIngredient6 = "ingrediente6"
        case strIngredient7 = "ingrediente7"
        case strIngredient8 = "ingrediente8"
        case strIngredient9 = "ingrediente9"
        case strIngredient10 = "ingrediente10"
        case strIngredient11 = "ingrediente11"
        case strIngredient12 = "ingrediente12"
        case strIngredient13 = "ingrediente13"
        case strIngredient14 = "ingrediente14"
        case strIngredient15 = "ingrediente15"
        case strIngredient16 = "ingrediente16"
        case strIngredient17 = "ingrediente17"
        case strIngredient18 = "ingrediente18"
        case strIngredient19 = "ingrediente19"
        case strIngredient20 = "ingrediente20"
        
        case idMeal, strMeal,strMealThumb,strCategory, strArea
             //
        

 
    }
*/
    
}
