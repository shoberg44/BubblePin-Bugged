//
//  NewNoteViewController.swift
//  BubblePin
//
//  Created by STEVEN HOBERG on 12/7/22.
//

import UIKit

class NewNoteViewController: UIViewController {

    @IBOutlet weak var favSwitch: UISwitch!
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var nameInput: UITextField!
    var type : AppData.itemType = .general
    var isFav = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addNoteButton(_ sender: UIButton) {
        
        if favSwitch.isOn{ //fav switch
            isFav = true
        }
        else{
            isFav = false
        }
        
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            type = .general
        case 1:
            type = .password
        default:
            type = .general
        }
        if (nameInput.text == "" ){
            return
        }
        else if type == .general{
            AppData.noteList.append(GeneralNote(name: nameInput.text!, type: type, favorite: isFav, id: 0, text: ""))
            print(AppData.noteList[AppData.noteList.count-1].name)
        }
        else if type == .password{
            AppData.noteList.append(Item(name: nameInput.text!, type: type, favorite: isFav, id: 0))
            print("password")
        }
        resetInputs()
    }
    func resetInputs(){
        favSwitch.isOn = false
        segmentedControlOutlet.selectedSegmentIndex = 0
        nameInput.text = ""
    }
    

}
