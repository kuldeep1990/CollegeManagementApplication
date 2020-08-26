//
//  CollegeDetailsViewController.swift
//  CollegeManagementApplication
//
//  Created by KULDEP KUMAR PRAJAPATI on 15/07/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class CollegeDetailsViewController: UITableViewController {

    @IBOutlet weak var lbColCity: UILabel!
    @IBOutlet weak var lbColUniversity: UILabel!
    @IBOutlet weak var lbColAddress: UILabel!
    @IBOutlet weak var lbColName: UILabel!
    
    
    
    var collegeDetails: College?
    var indexRow = Int()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        lbColName.text = "Name : \(collegeDetails?.name ?? "")"
        lbColAddress.text = "Address : \(collegeDetails?.address ?? "")"
        lbColCity.text = "City : \(collegeDetails?.city ?? "")"
        lbColUniversity.text = "University : \(collegeDetails?.university ?? "")"
    }

    
    @IBAction func editClicked(_ sender: UIBarButtonItem) {
        let formVC = self.storyboard?.instantiateViewController(identifier: "CollegeFormViewController") as! CollegeFormViewController
        formVC.isUpdate = true
        formVC.collegeDetails = collegeDetails
        formVC.indexRow = indexRow
        self.navigationController?.pushViewController(formVC, animated: false)
        
    }
    

}
