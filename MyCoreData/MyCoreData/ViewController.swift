//
//  ViewController.swift
//  MyCoreData
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 huxinqian. All rights reserved.
//
//不需要操作数据库，new一个person对象，然后保存就OK，比之前的sqlite简单
//进入后台才保存

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var stuName: UITextField!
    
    @IBOutlet weak var stuPhone: UITextField!
    
    //拿到自己当前的应用代理
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //保留上下文
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: Any) {
        let person = Person(context: context)
        person.name = stuName.text
        person.phone = stuPhone.text
        appDelegate.saveContext()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//    //先查询到这个记录更改，所以先实现查询更新和删除就很简单了
//    @IBAction func update(_ sender: Any) {
//        let fetch: NSFetchRequest<Person> = Person.fetchRequest()
//        //面向对象里面给查询条件
//        fetch.predicate = NSPredicate(format: "name=%@", stuName.text!)
//        let persons = try? context.fetch(fetch)
//        if let p = persons?.first {
//            p.phone = stuPhone.text!
//        }
//    }
//    //先找到这个对象再去删除
//    @IBAction func del(_ sender: Any) {
//        let fetch: NSFetchRequest<Person> = Person.fetchRequest()
//        //面向对象里面给查询条件
//        fetch.predicate = NSPredicate(format: "name=%@", stuName.text!)
//        let persons = try? context.fetch(fetch)
//        if let p = persons?.first {
//            context.delete(p)
//        }
//    }
//    //数据库的查询和b保存都有可能出错，所以都要使用try
//    @IBAction func query(_ sender: Any) {
//        let fetch: NSFetchRequest<Person> = Person.fetchRequest()
//        //面向对象里面给查询条件
//        fetch.predicate = NSPredicate(format: "name=%@", stuName.text!)
//        let persons = try? context.fetch(fetch)
//        if let p = persons?.first {
//            stuPhone.text = p.phone
//        }
//    }
}

