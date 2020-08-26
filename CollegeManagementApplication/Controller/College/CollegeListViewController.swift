//
//  ViewController.swift
//  CollegeManagementApplication
//
//  Created by KULDEP KUMAR PRAJAPATI on 14/07/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController {

    @IBOutlet weak var collegeListView: UITableView!
    var arrCollege = [College]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewWillAppear(_ animated: Bool){
        self.arrCollege = DatabaseHelper.shareInstance.getAllCollegeData()
        self.collegeListView.reloadData()
    }

    @IBAction func addInformation(_ sender: UIBarButtonItem) {
        let collegeForm = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
}

extension CollegeListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
        return arrCollege.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeListViewCell", for: indexPath) as! CollegeListViewCell
        cell.college = arrCollege[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        let collegeDetailsVC =
            self.storyboard?.instantiateViewController(withIdentifier: "CollegeDetailsViewController") as! CollegeDetailsViewController
        collegeDetailsVC.collegeDetails=arrCollege[indexPath.row]
        collegeDetailsVC.indexRow = indexPath.row
        self.navigationController?.pushViewController(collegeDetailsVC,
                                                      animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func  tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                    forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrCollege = DatabaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            self.collegeListView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
   
}

