//
//  ViewController.swift
//  TableTest
//
//  Created by iamqjin on 2017. 1. 31..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var list = [TestVO]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        cell.textLabel?.text = self.list[indexPath.row].testText
//        cell.textLabel?.text = "hello"
        return cell
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성", preferredStyle: .alert)
        
        alert.addTextField() {
            (tf) in tf.placeholder = "내용 입력하세요"
        }
        
        let ok = UIAlertAction(title: "확인", style: .default) {
            (_) in
            
            if let title = alert.textFields?[0].text {
                
                let testVO = TestVO()
                testVO.testText = title
                
                self.list.append(testVO)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .default)
     
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: false)
        
        
    }



}

