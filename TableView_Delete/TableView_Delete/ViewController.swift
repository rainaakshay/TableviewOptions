//
//  ViewController.swift
//  TableView_Delete
//
//  Created by apple on 12/12/18.
//  Copyright © 2018 Seraphic. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var tableview: UITableView!
    
     var nums: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    
    //let cellReuseIdentifier = "Cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = String(nums[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
  //  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //    return true
    //}
    
/*   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            if let tv=tableview
            {
                nums.remove(at: indexPath.row)
                tv.deleteRows(at: [indexPath], with: .fade)
            }
            
        }
        
        
        
        
    }
    
  */
   
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            self.nums.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(self.nums)
        }
        
        let Edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
           
            
            
            
            let alert = UIAlertController(title: "Edit List Data", message: "Enter new data", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.text = "Put data here"
            }
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
                print("Text field: \(String(describing: textField!.text!))")
                self.nums[indexPath.row] = textField!.text!
                tableView.beginUpdates()
                tableView.reloadData()
                tableView.endUpdates()
            }))
            self.present(alert, animated: true, completion: nil)
            
           
        }
        let pop = UITableViewRowAction(style: .default, title: "PopUp")
        {
            (action,indexPath) in
            
            
            let popup = UIAlertController(title: "Popup Successful", message: "Test Alert", preferredStyle: .alert)
            popup.addAction(UIAlertAction(title: "Working!", style: .default ))
            self.present(popup, animated: true, completion: nil)
            
            
            
        }
        
        Edit.backgroundColor = UIColor.blue
        pop.backgroundColor = UIColor.init(displayP3Red: 180/255, green: 100/255, blue: 150/255, alpha: 0.5)
        return [delete, Edit,pop]
        
    }
    
    
    
    
}



