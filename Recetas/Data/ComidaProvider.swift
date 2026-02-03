//
//  ComidaProvider.swift
//  Recetas
//
//  Created by Jonathan Ibarra on 28/1/26.
//

import Foundation

class ComidaProvider {
    
    static  func getComidaList(query: String) async -> [Comida] {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(query)")
        
        guard let url = url else {
            print("Invalid URL")
            return []
            
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(ComidaBusqueda.self, from: data)
            
            return result.meals
            
        }catch {
            print("Invalid data")
          
            return []
            
        }
    }
    
    
  static  func getComidaById(idMeal: String) async -> Comida? {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)")
        
        guard let url = url else {
            print("Invalid URL")
            return nil
            
        }
            do {
                
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let result = try JSONDecoder().decode(ComidaBusqueda.self, from: data)
                
                return result.meals.first
            }catch{
                print("Invalid data")
                return nil
            }
        
            }
    }
    

