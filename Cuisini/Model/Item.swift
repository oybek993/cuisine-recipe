//
//  Item.swift
//  Cuisini
//
//  Created by Oybek on 2/10/21.
//

import UIKit

struct Item {
    var name: String
    var ingredients: [IngredientsArr]
    var steps: [StepsArr]
    var desc: String
    var img_url: String
    
}
struct IngredientsArr {
    var name: String
}
struct StepsArr {
    var name: String
}
