//
//  CollegeListViewCell.swift
//  CollegeManagementApplication
//
//  Created by KULDEP KUMAR PRAJAPATI on 15/07/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class CollegeListViewCell: UITableViewCell {

    @IBOutlet weak var lbCollegeName: UILabel!
    @IBOutlet weak var lbCollegeAddress: UILabel!
    @IBOutlet weak var lbCollegeCity: UILabel!
    @IBOutlet weak var lbCollegeUniversity: UILabel!
    
    
    var college: College?{
        didSet{
            lbCollegeName.text = "Name : \(college?.name ?? "")"
            lbCollegeAddress.text = "Address : \(college?.address ?? "")"
            lbCollegeCity.text = "City : \(college?.city ?? "")"
            lbCollegeUniversity.text = "University : \(college?.university ?? "")"
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
