//
//  CollegeFormViewController.swift
//  CollegeManagementApplication
//
//  Created by KULDEP KUMAR PRAJAPATI on 14/07/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class CollegeFormViewController: UIViewController {

//    MARK: Outlets
    @IBOutlet weak var txtCollegeAddress: UITextField!
    @IBOutlet weak var txtCollegeName: UITextField!
    @IBOutlet weak var txtCollegeUniversity: UITextField!
    @IBOutlet weak var txtCollegeCity: UITextField!
    var isUpdate=false
    var indexRow=Int()
    @IBOutlet weak var save: UIButton!
    var collegeDetails: College?
    
    
    
//    MARK: View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtCollegeName.text = collegeDetails?.name
        self.txtCollegeAddress.text = collegeDetails?.address
        self.txtCollegeCity.text = collegeDetails?.city
        self.txtCollegeUniversity.text = collegeDetails?.university
    }
    

   
   
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            save.setTitle("Update", for: .normal)
        }else{
            save.setTitle("Save", for: .normal)
        }
    }
    

}

//MARK: Action
extension CollegeFormViewController{
    @IBAction func saveInformation(_ sender: UIButton) {
        self.collegeSaveData()
       }
}

//MARK: Methods
extension CollegeFormViewController{
    func collegeSaveData() {
        guard  let collegeName = txtCollegeName.text else { return }
        guard  let collegeAddress = txtCollegeAddress.text else { return }
        guard  let collegeCity = txtCollegeCity.text else { return }
        guard  let collegeUniversity = txtCollegeUniversity.text else { return }
    
    
        let collegeDict = [
            "collegeName" : collegeName,
            "collegeAddress" : collegeAddress,
            "collegeCity" : collegeCity,
            "collegeUniversity" : collegeUniversity
        ]
        if isUpdate {
            DatabaseHelper.shareInstance.editCollegeData(collegeDict: collegeDict, index: indexRow)
            isUpdate = false
        }else{
        DatabaseHelper.shareInstance.saveCollegeData(collegeDict: collegeDict)
        }
        
        let backCollegeList = self.storyboard?.instantiateViewController(withIdentifier: "CollegeListViewController") as! CollegeListViewController
        backCollegeList.modalPresentationStyle = .fullScreen
        self.present(backCollegeList, animated:true, completion:nil)
    
    }
}
