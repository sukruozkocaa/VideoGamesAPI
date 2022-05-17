//
//  ViewController.swift
//  VideoGamesAppMVVM
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    private var gameListVM: GameListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    func setUp() {
        let url = URL(string: "https://api.rawg.io/api/games?key=6605d7512ebc4912a6c2c48ce1e37d91")!
        Webservice().getData(url: url) { results in
            if let results = results {
                self.gameListVM = GameListViewModel(results: results)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.gameListVM == nil ? 0 : self.gameListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gameListVM.numberOfRowsInSeciton(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GameTableViewCell
        let gameVM = gameListVM.gameAtIndex(indexPath.row)
        cell.nameLabel.text = gameVM.name
        cell.ratingLabel.text = "\(gameVM.rating!)"
        
        cell.releasedLabel.text = gameVM.released
        
        
        
        let url = URL(string: gameVM.background_image!)!
        do {
            let imageData = try Data(contentsOf: url)
            cell.pictureView.image = UIImage(data: imageData)
        }
        catch
        {
            print("Unable to load data: \(error)")
        }
        
        return cell
    }
    


}

