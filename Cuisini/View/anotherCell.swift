//
//  anotherCell.swift
//  Cuisini
//
//  Created by Oybek on 2/10/21.
//

import UIKit

class anotherCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView.delegate = self
        tableView.dataSource = self
    }
    var items = ["milkhgsdfjhgasdfjhgasdjfhkgasdjsjhdfgjshdkgfjshdgfajhksdfhkgsadjhfg", "pear", "flour","milk", "pear", "flour","milk", "pear", "flour","milk", "pear", "flour"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ingredientCell")
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.sizeToFit()
        cell.textLabel?.text = "— \(items[indexPath.row])"
        return cell
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
