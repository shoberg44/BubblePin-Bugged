//
//  GeneralNote.swift
//  BubblePin
//
//  Created by STEVEN HOBERG on 12/12/22.
//

import Foundation
class GeneralNote : Item{
    var text : String
     init(name: String, type: AppData.itemType, favorite: Bool, id: Int, text : String) {
         self.text = text
         super.init(name: name, type: type, favorite: favorite, id: id)
    }
}
