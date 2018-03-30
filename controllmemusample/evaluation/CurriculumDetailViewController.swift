//
//  CurriculumDetailViewController.swift
//  controllmemusample
//
//  Created by tatsumi kentaro on 2018/03/29.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class CurriculumDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
    var evaluation:Evaluation!
    var numOfcell: Int!
    let titleArray = ["授業の詳細","コメント","授業の評価"]
    let detailTitleArray = ["出席","教科書","中間試験","期末試験"]
    var detailArray = [String]()
    var evaluationArray = [String]()
    let evaluationTitleArray = ["難易度","充実度"]
    
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var different: UILabel!
    @IBOutlet weak var evaluationText: UILabel!
    @IBOutlet weak var mainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        className.text = evaluation.className
        teacherName.text = evaluation.teacherName
        year.text = evaluation.year
        course.text = evaluation.course
        different.text = evaluation.different
        evaluationText.text = evaluation.courseEvaluation
        different.textColor = UIColor.orange
        evaluationText.textColor = UIColor.orange
        mainTable.dataSource = self
        mainTable.delegate = self
        detailArray = [evaluation.attendance,evaluation.textbook,evaluation.middleExamination,evaluation.finalExamination]
        evaluationArray = [evaluation.different,evaluation.courseEvaluation]

        // Do any additional setup after loading the view.
    }
    //セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return titleArray.count
    }
    //１セクションの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return detailTitleArray.count
        case 1:
            return 1
        case 2:
            return evaluationTitleArray.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        switch indexPath.section{
        case 0:
            let title = cell.contentView.viewWithTag(1) as! UILabel
            let contents = cell.contentView.viewWithTag(2) as! UILabel
            title.text = detailTitleArray[indexPath.row]
            contents.text = detailArray[indexPath.row]
        case 1:
            let contents = cell.contentView.viewWithTag(1) as! UILabel
            contents.text = evaluation.coursedetail
        case 2:
            let title = cell.contentView.viewWithTag(1) as! UILabel
            let contents = cell.contentView.viewWithTag(2) as! UILabel
            title.text = evaluationTitleArray[indexPath.row]
            contents.text = evaluationArray[indexPath.row]
            contents.textColor = UIColor.orange

        default :
            break
        }
        return cell
    }
    //セクションタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return titleArray[section]
    }
    //タイトルの色を決定
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = UIColor.orange
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
