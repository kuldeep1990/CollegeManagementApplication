//
//  DatabaseHelper.swift
//  CollegeManagementApplication
//
//  Created by KULDEP KUMAR PRAJAPATI on 14/07/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {
    
    static let shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCollegeData(collegeDict: [String:String]) {
        let college = NSEntityDescription.insertNewObject(forEntityName:
            "College", into: context) as! College
        college.name = collegeDict["collegeName"]
        college.address = collegeDict["collegeAddress"]
        college.city = collegeDict["collegeCity"]
        college.university = collegeDict["collegeUniversity"]
        
        do {
            try context.save()
        } catch let err {
            print("college save error :- \(err.localizedDescription)")
        }
        
    }
    
    
    func getAllCollegeData() -> [College]{
        var arrCollege = [College]()
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            arrCollege = try context.fetch(fetchRequest) as! [College]
        }catch let err{
            print("Error in college fetch :- \(err.localizedDescription)")
        }
        return arrCollege
    }

    func deleteCollegeData(index: Int) -> [College] {
        var collegeData = self.getAllCollegeData() //GetData
        context.delete(collegeData[index])         // Remove from Coredata
        collegeData.remove(at: index)              // Remove from CollegeArray
        
        do {
            try context.save()
        } catch let err {
            print("Delete data :- \(err.localizedDescription)")
        }
        
      return collegeData
    }
    
    func editCollegeData(collegeDict: [String : String],index :Int) {
        var college = self.getAllCollegeData()
        college[index].name = collegeDict["collegeName"]
        college[index].address = collegeDict["collegeAddress"]
        college[index].city = collegeDict["collegeCity"]
        college[index].university = collegeDict["collegeUniversity"]
        do{
            try context.save()
        }catch{
            print("error in edit")
        }
    }
}
