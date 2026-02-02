//
//  DetailViewController.swift
//  Recetas
//
//  Created by Jonathan Ibarra on 29/1/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var thumbnaiImagView: UIImageView!
    
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    
    var comida: Comida!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = comida.strMeal
        
        thumbnaiImagView.loadFrom(url: comida.strMealThumb)
        
        // Recogemos los ingredientes y sus medidas
        let ingredientsList = comida.getIngredients()
        let measuresList = comida.getMeasures()
        
        // Montamos un texto con todos los ingredientes separados por salto de linea (\n)
        var ingredientsText = ""
        for index in comida.getIngredients().indices {
            if index != 0 { // Añadimos salto de linea en todos los elementos menos el primero
                ingredientsText += "\n"
            }
            ingredientsText += "\(index + 1). \(ingredientsList[index]) - \(measuresList[index])"
        }
        
        ingredientsLabel.text = ingredientsText
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
