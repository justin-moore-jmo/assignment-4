//
//  ViewController.swift
//  Working Data Table
//
//  Created by Justin Moore on 4/2/19.
//  Copyright © 2019 Justin Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    //this sets number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArray.count
    }
    
    //this fills rows with content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cellInTableView")!
        let holdertText = selectedArray[indexPath.row]
        myCell.textLabel?.text = holdertText
        return myCell
    }
    
    var myCoolData:[String] = ["The Shawshank Redemption", "Pulp Fiction" , "Fight Club", "Spider-Man: Into the Spider-Verse"]
    var mySweetData:[String] = ["To Kill a Mockingbird", "Things Fall Apart" , "The Kite Runner" , "Temeraire Series"]

    @IBOutlet weak var myCustomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCustomTableView.dataSource = self
        selectedArray = myCoolData
    }
    
    
    @IBAction func removeButton(_ sender: Any) {
        if myCoolData.count > 0{
        myCoolData.removeLast()
        }
        selectedArray = myCoolData
        myCustomTableView.reloadData()
    }
    
    @IBAction func removeButton2(_ sender: Any) {
        if mySweetData.count > 0{
        mySweetData.removeLast()
        }
        selectedArray = mySweetData
        myCustomTableView.reloadData()
    }
    
    
    @IBOutlet weak var appendMovieTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        myCoolData.append(appendMovieTextField.text ?? "Blah")
        selectedArray = myCoolData
        myCustomTableView.reloadData()
    }
    
    @IBAction func addButton2(_ sender: Any) {
    mySweetData.append(appendMovieTextField.text ?? "Blah")
        selectedArray = mySweetData
        myCustomTableView.reloadData()
    }
    
    
    var selectedArray:[String] = []
    
    @IBAction func switchToMovies(_ sender: Any) {
        selectedArray = myCoolData
        myCustomTableView.reloadData()
    }
    
    
    @IBAction func switchToBooks(_ sender: Any) {
        selectedArray = mySweetData
        myCustomTableView.reloadData()
    }
}

