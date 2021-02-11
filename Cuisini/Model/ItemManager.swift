//
//  ItemManager.swift
//  Cuisini
//
//  Created by Oybek on 2/11/21.
//

import UIKit

struct ItemManager {
//    let url = Bundle.main.url(forResource: "cuisine", withExtension: "json")
//
//    func parseJSON(data: Data) -> Item? {
//        let decoder = JSONDecoder()
//
//        do {
//            let decodedData = try decoder.decode(ItemData.self, from: data)
//
//            let name = decodedData.food[0].name
//            let ingredients = decodedData.food[0].ingredients
//            let steps = decodedData.food[0].steps
//            let desc = decodedData.food[0].desc
//            let img_url = decodedData.food[0].img_url
//            let item = Item(name: name, ingredients: ingredients, steps: steps, desc: desc, img_url: img_url)
//            return item
//        } catch {
//            print(error)
//            return nil
//        }
//    }
    
    var name = ""
    var img_url = URL(string: "https://google.com")
    var ingredients = [""]
    var desc = ""
    var steps = [""]
    var itemIndex = 0
    var itemsCount = 0
    
    mutating func parseJSON() {
        if let url = Bundle.main.url(forResource: "cuisine", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([ItemData].self, from: data)
                name = decodedData[itemIndex].name
                img_url = URL(string: decodedData[itemIndex].img_url)
                for ingredient in decodedData[itemIndex].ingredients {
                    ingredients.append(ingredient.name)
                }
                desc = decodedData[itemIndex].desc
                
                for step in decodedData[itemIndex].steps {
                    steps.append(step.name)
                }
                itemsCount = decodedData.count
            } catch {
                print("error:\(error)")
            }
        }
        
    }
}
