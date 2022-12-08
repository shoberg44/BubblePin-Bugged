//
//  Item.swift
//  BubblePin
//
//  Created by STEVEN HOBERG on 12/6/22.
//

import Foundation
class Item{
    var name : String
    var type : AppData.itemType //naming covention is weird sorry
    var favorite : Bool
    var id : Int
    init(name: String,type: AppData.itemType, favorite: Bool, id: Int) {
        self.name = name
        self.type = type
        self.favorite = favorite
        self.id = id
    }
    init(){
        self.name = "Default"
        self.type = .general
        self.favorite = false
        self.id = 0
    }
}
