//
//  DetailViewController.swift
//  Recetas
//
//  Created by Jonathan Ibarra on 29/1/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var thumbnaiImagView: UIImageView!
    
    @IBOutlet weak var mealLabel: UILabel! //Titulo
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var comida: Comida!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = comida.strMeal
        
        cargarDatos()

        // Do any additional setup after loading the view.
     
        
        thumbnaiImagView.loadFrom(url: comida.strMealThumb)
        
        
        
        func cargarDatos (){
            mealLabel.text = comida.strMeal
            categoryLabel.text = comida.strCategory
            instructionsLabel.text = comida.strInstructions
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let videoVC = segue.destination as! VideosViewController
        videoVC.configure(with: comida)
    }
     
    
    //func configure1() {
        /*titleLabel.text = comida.strMeal
        thumbnailImageView.loadFrom(url: comida.strMealThumb)
        paisLabel.text = comida.strArea
        categoriaLabel.text = comida.strCategory
        
        
        imagView.layer.cornerRadius = 70
        imagView.layer.masksToBounds = true
        
        
        cardView.layer.cornerRadius = 100
        cardView.layer.masksToBounds = true*/
  //  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
