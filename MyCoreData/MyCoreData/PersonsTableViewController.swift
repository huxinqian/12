//
//  PersonsTableViewController.swift
//  MyCoreData
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 huxinqian. All rights reserved.
//
//实现显示数据库中的表

import UIKit
import CoreData

class PersonsTableViewController: UITableViewController {
    
    //拿到自己当前的应用代理
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //保留上下文
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var persons:[Person]?
    
    //抽象出来一个函数，方便后边刷新数据调用
    fileprivate func reloadData() {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        persons = try? context.fetch(fetch)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        //刷新界面数据
        reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let p = persons?[indexPath.row] {
            cell.textLabel?.text = p.name
        }
        
        // Configure the cell...
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetail" {
            let secVC = segue.destination as! DetailViewController
            
            //用sender决定传哪一个人的参数
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell),let p = persons?[indexPath.row] {
                secVC.person = p
            }
        }
    }
}
