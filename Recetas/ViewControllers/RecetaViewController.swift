//
//  ViewController.swift
//  Recetas
//
//  Created by Jonathan Ibarra on 27/1/26.
//

import UIKit

class RecetaViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var comidaList: [Comida] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        
        Task {
                comidaList = await ComidaProvider.getComidaList()
            print(comidaList)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
                
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comidaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Comida Cell", for: indexPath) as! ComidaViewCell
        let comida = comidaList[indexPath.row]
        cell.configure(with: comida)
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let IndexPath = tableView.indexPathForSelectedRow!
        let comida = comidaList[IndexPath.row]
        detailViewController.comida = comida
        tableView.deselectRow(at: IndexPath, animated: true)
        
    }
}
