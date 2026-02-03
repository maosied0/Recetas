//
//  ComidaViewCell.swift
//  Recetas
//
//  Created by Jonathan Ibarra on 28/1/26.
//

import UIKit

class ComidaViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var imagView: UIView!
    
    @IBOutlet weak var cardView: UIView!
    
    
    @IBOutlet weak var paisLabel: UILabel!
    @IBOutlet weak var categoriaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with comida: Comida) {
        titleLabel.text = comida.strMeal
        thumbnailImageView.loadFrom(url: comida.strMealThumb)
        paisLabel.text = comida.strArea
        categoriaLabel.text = comida.strCategory
        
        
        imagView.layer.cornerRadius = 70
        imagView.layer.masksToBounds = true
        
        
        cardView.layer.cornerRadius = 100
        cardView.layer.masksToBounds = true
    }
    
}
