//
//  ViewController.swift
//  Recetas
//
//  Created by Jonathan Ibarra on 27/1/26.
//

import UIKit

class RecetaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            let comidaList = await ComidaProvider().getComidaList()
            print(comidaList)
            
        }
    }


}

