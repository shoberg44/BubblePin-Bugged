//
//  ViewController.swift
//  BubblePin
//
//  Created by STEVEN HOBERG on 12/1/22.
//

import UIKit
class AppData{
    enum itemType: String {
        case general = "general"
        case password = "password"
    }
    static var noteList : [Item] = [] //make a Item parent class
    static var selectedRow = 0
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView! //noteCell is the identifier of custom cell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        //AppData.noteList.append(Item(name: "Test Name", type: .general, favorite: false, id: 1))
        //AppData.noteList.append(GeneralNote(name: "ahh", type: AppData.itemType.general, favorite: false, id: 2, text: "why isn't this working?"))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.noteList.count //number of rows in table view
    }
    //stoovier
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell")! as! CellClass
        cell.configure(titleLabel: AppData.noteList[indexPath.row].name, typeLabel: AppData.noteList[indexPath.row].type.rawValue, pinIcon: AppData.noteList[indexPath.row].favorite)
        return cell //returns data for cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
        {
            if editingStyle == .delete {
                // Delete the row from the data source
                AppData.noteList.remove(at: indexPath.row)
                // Then, delete the row from the table itself
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.selectedRow = indexPath.row
        //if AppData.noteList[AppData.selectedRow]
        if AppData.noteList[AppData.selectedRow].type == AppData.itemType.general {
            performSegue(withIdentifier: "generalSegue", sender: Any?.self)
        }
        else { //detects password note
            /*
             if AppData.noteList[AppData.selectedRow].type == AppData.itemType.password {
                performSegue(withIdentifier: "passwordSegue", sender: Any?.self)
            }
             */
        }
            //performSegue(withIdentifier: "generalSegue", sender: Any?.self)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableViewOutlet.reloadData()
    }
    
    @IBAction func sort(_ sender: UIBarButtonItem) { //puts pinned/favoretting item on top
        for i in 0..<AppData.noteList.count{
            if AppData.noteList[i].favorite == true{
                AppData.noteList.insert(AppData.noteList.remove(at: i), at: 0)
            }
        }
        tableViewOutlet.reloadData()
    }
    
    
    
}


