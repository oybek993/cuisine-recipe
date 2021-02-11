//
//  DetailViewController.swift
//  Cuisini
//
//  Created by Oybek on 2/10/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrIndex = 0
    var img = UIImageView()
    var desc = ""
    var ingredientItems = [""]
    var steps = [""]
    var itemManager = ItemManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        itemManager.itemIndex = arrIndex
        itemManager.parseJSON()
        tableView.dataSource = self
        tableView.rowHeight = 300
        tableView.register(UINib(nibName: "anotherCell", bundle: nil), forCellReuseIdentifier: "another")
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "item")
        
    }
    
}

extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstCell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath) as! ItemCell
        let anotherCell = tableView.dequeueReusableCell(withIdentifier: "another", for: indexPath) as! anotherCell
        
        if indexPath.section == 0 {
            firstCell.img.loadImg(url: itemManager.img_url!)
            firstCell.label.text = itemManager.name
            return firstCell
        } else if indexPath.section == 1 {
            anotherCell.items = itemManager.ingredients
            return anotherCell
        } else {
            anotherCell.label.text = " Steps"
            anotherCell.items = itemManager.steps
            return anotherCell
        }
        
        
    }
    
    
}
