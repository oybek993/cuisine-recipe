//
//  ItemData.swift
//  Cuisini
//
//  Created by Oybek on 2/11/21.
//

import UIKit

struct ItemData: Codable {
    var name: String
    var ingredients: [Ingredients]
    var steps: [Steps]
    var desc: String
    var img_url: String

}

struct Ingredients: Codable {
    var name: String
}

struct Steps: Codable {
    var name: String
}
