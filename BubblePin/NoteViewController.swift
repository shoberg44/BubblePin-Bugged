//
//  NoteViewController.swift
//  BubblePin
//
//  Created by STEVEN HOBERG on 12/12/22.
//

import UIKit

class NoteViewController: UIViewController {
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = AppData.noteList[AppData.selectedRow].name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
