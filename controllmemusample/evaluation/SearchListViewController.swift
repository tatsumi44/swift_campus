//
//  SearchListViewController.swift
//  controllmemusample
//
//  Created by tatsumi kentaro on 2018/03/09.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Firebase

class SearchListViewController: UIViewController,UITableViewDataSource{
    
    @IBOutlet var mainTable: UITableView!
    var tagArray = [[String]]()
    var db: Firestore!
    var evaluationArray = [Evaluation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTable.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        evaluationArray = [Evaluation]()
        print(tagArray.count)
        print(tagArray)
        db = Firestore.firestore()
        switch tagArray.count {
        case 1:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                        self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))
                        print(self.evaluationArray)
                    }
                    self.mainTable.reloadData()
                }
            })
            
        case 2:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").whereField("\(tagArray[1][0])", isEqualTo: "\(tagArray[1][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                              self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))

                    }
                    self.mainTable.reloadData()
                }
            })
        case 3:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").whereField("\(tagArray[1][0])", isEqualTo: "\(tagArray[1][1])").whereField("\(tagArray[2][0])", isEqualTo: "\(tagArray[2][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                               self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))

                    }
                    self.mainTable.reloadData()
                }
            })
        case 4:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").whereField("\(tagArray[1][0])", isEqualTo: "\(tagArray[1][1])").whereField("\(tagArray[2][0])", isEqualTo: "\(tagArray[2][1])").whereField("\(tagArray[3][0])", isEqualTo: "\(tagArray[3][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                                self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))
                 }
                    self.mainTable.reloadData()
                }
            })
        case 5:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").whereField("\(tagArray[1][0])", isEqualTo: "\(tagArray[1][1])").whereField("\(tagArray[2][0])", isEqualTo: "\(tagArray[2][1])").whereField("\(tagArray[3][0])", isEqualTo: "\(tagArray[3][1])").whereField("\(tagArray[4][0])", isEqualTo: "\(tagArray[4][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                     self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))

                    }
                    self.mainTable.reloadData()
                }
            })
        case 6:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").whereField("\(tagArray[1][0])", isEqualTo: "\(tagArray[1][1])").whereField("\(tagArray[2][0])", isEqualTo: "\(tagArray[2][1])").whereField("\(tagArray[3][0])", isEqualTo: "\(tagArray[3][1])").whereField("\(tagArray[4][0])", isEqualTo: "\(tagArray[4][1])").whereField("\(tagArray[5][0])", isEqualTo: "\(tagArray[5][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                                  self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))

                    }
                    self.mainTable.reloadData()
                }
            })
        case 7:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").whereField("\(tagArray[1][0])", isEqualTo: "\(tagArray[1][1])").whereField("\(tagArray[2][0])", isEqualTo: "\(tagArray[2][1])").whereField("\(tagArray[3][0])", isEqualTo: "\(tagArray[3][1])").whereField("\(tagArray[4][0])", isEqualTo: "\(tagArray[4][1])").whereField("\(tagArray[5][0])", isEqualTo: "\(tagArray[5][1])").whereField("\(tagArray[6][0])", isEqualTo: "\(tagArray[6][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                                 self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))

                    }
                    self.mainTable.reloadData()
                }
            })
        case 8:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").whereField("\(tagArray[1][0])", isEqualTo: "\(tagArray[1][1])").whereField("\(tagArray[2][0])", isEqualTo: "\(tagArray[2][1])").whereField("\(tagArray[3][0])", isEqualTo: "\(tagArray[3][1])").whereField("\(tagArray[4][0])", isEqualTo: "\(tagArray[4][1])").whereField("\(tagArray[5][0])", isEqualTo: "\(tagArray[5][1])").whereField("\(tagArray[6][0])", isEqualTo: "\(tagArray[6][1])").whereField("\(tagArray[7][0])", isEqualTo: "\(tagArray[7][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                                self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))

                    }
                    self.mainTable.reloadData()
                }
            })
        case 9:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").whereField("\(tagArray[1][0])", isEqualTo: "\(tagArray[1][1])").whereField("\(tagArray[2][0])", isEqualTo: "\(tagArray[2][1])").whereField("\(tagArray[3][0])", isEqualTo: "\(tagArray[3][1])").whereField("\(tagArray[4][0])", isEqualTo: "\(tagArray[4][1])").whereField("\(tagArray[5][0])", isEqualTo: "\(tagArray[5][1])").whereField("\(tagArray[6][0])", isEqualTo: "\(tagArray[6][1])").whereField("\(tagArray[7][0])", isEqualTo: "\(tagArray[7][1])").whereField("\(tagArray[8][0])", isEqualTo: "\(tagArray[8][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                                   self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))

                    }
                    self.mainTable.reloadData()
                }
            })
        case 10:
            db.collection("courseEvaluation").whereField("\(tagArray[0][0])", isEqualTo: "\(tagArray[0][1])").whereField("\(tagArray[1][0])", isEqualTo: "\(tagArray[1][1])").whereField("\(tagArray[2][0])", isEqualTo: "\(tagArray[2][1])").whereField("\(tagArray[3][0])", isEqualTo: "\(tagArray[3][1])").whereField("\(tagArray[4][0])", isEqualTo: "\(tagArray[4][1])").whereField("\(tagArray[5][0])", isEqualTo: "\(tagArray[5][1])").whereField("\(tagArray[6][0])", isEqualTo: "\(tagArray[6][1])").whereField("\(tagArray[7][0])", isEqualTo: "\(tagArray[7][1])").whereField("\(tagArray[8][0])", isEqualTo: "\(tagArray[8][1])").whereField("\(tagArray[9][0])", isEqualTo: "\(tagArray[9][1])").getDocuments(completion: { (snap, error) in
                if let error = error{
                    print("\(error)")
                }else{
                    for document in (snap?.documents)!{
                        let data = document.data()
                           self.evaluationArray.append(Evaluation(className: data["courseName"] as! String, teacherName: data["teacherName"] as! String, course: data["course"] as! String, year: data["year"] as! String, attendance: data["attendance"] as! String, textbook: data["textbook"] as! String, courseEvaluation: data["courseEvaluation"] as! String, different: data["different"] as! String, coursedetail: data["courseDetail"] as! String, postuid: document.documentID, middleExamination: data["middleExamination"] as! String, finalExamination: data["finalExamination"] as! String))

                    }
                    self.mainTable.reloadData()
                }
            })
            
            
        default:
            return
        }
        print(evaluationArray)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return evaluationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let courseName = cell.contentView.viewWithTag(1) as! UILabel
        let year = cell.contentView.viewWithTag(2) as! UILabel
        let course = cell.contentView.viewWithTag(3) as! UILabel
        let dayOfTheWeek = cell.contentView.viewWithTag(4) as! UILabel
        let courseTime = cell.contentView.viewWithTag(5) as! UILabel
        let courseEvaluation = cell.contentView.viewWithTag(6) as! UILabel
        let different = cell.contentView.viewWithTag(7) as! UILabel
        let coursedetail = cell.contentView.viewWithTag(8) as! UILabel
        
        courseName.text = evaluationArray[indexPath.row].className
        year.text = evaluationArray[indexPath.row].year
        course.text = evaluationArray[indexPath.row].course
        dayOfTheWeek.text = evaluationArray[indexPath.row].attendance
        courseTime.text = evaluationArray[indexPath.row].textbook
        courseEvaluation.text = "授業評価　\(evaluationArray[indexPath.row].courseEvaluation!)"
        courseEvaluation.textColor = UIColor.red
        different.text = "難易度　\(evaluationArray[indexPath.row].different!)"
        different.textColor = UIColor.red
        coursedetail.text = evaluationArray[indexPath.row].coursedetail
        return cell
    }
    
}
