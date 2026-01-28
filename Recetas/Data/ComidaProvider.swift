//
//  ComidaProvider.swift
//  Recetas
//
//  Created by Jonathan Ibarra on 28/1/26.
//

import Foundation

class ComidaProvider {
    
    func getComidaList() async -> [Comida] {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=")
        
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
            print(error)
            return []
            
        }
    }
    func getComidaById(id: String) -> Comida? {
        return nil
    }
    
}
