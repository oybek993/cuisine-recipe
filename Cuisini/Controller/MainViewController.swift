//
//  MainTableViewController.swift
//  Cuisini
//
//  Created by Oybek on 2/10/21.
//

import UIKit

class MainViewController: UITableViewController {
    var itemManager = ItemManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "item")
        tableView.rowHeight = 200
        itemManager.parseJSON()
    }
    var arrIndex = 0
}
extension UIImageView {
    func loadImg(url: URL) {
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
extension MainViewController {
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemManager.itemsCount
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        itemManager.itemIndex = indexPath.row
        itemManager.parseJSON()
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath) as! ItemCell
        cell.label.text = itemManager.name
        cell.img.loadImg(url: itemManager.img_url!)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        itemManager.itemIndex = indexPath.row
        arrIndex = indexPath.row
        performSegue(withIdentifier: "itemToDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailViewController
        destinationVC.arrIndex = arrIndex
    }
    

}

