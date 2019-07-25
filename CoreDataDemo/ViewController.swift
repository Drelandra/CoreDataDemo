//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Andre Elandra on 05/07/19.
//  Copyright © 2019 Andre Elandra. All rights reserved.
// 

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dataContact:[Contact]? //contact array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addContactButton(_ sender: UIButton) {
      
        let contactData = Contact(context: self.context)
        
        contactData.name = nameTF.text
        contactData.phoneNumber = phoneNumberTF.text
        
        dataContact?.append(contactData)
        saveData()
        loadData()
        updateLayout()
    }
    
    func saveData() {
        
        do {
            try context.save()
        } catch {
            print("error", error)
        }
        
        updateLayout()
        
    }
    
    func loadData() {
        
        let request : NSFetchRequest = Contact.fetchRequest()
        
        do {
            dataContact = try context.fetch(request)
        } catch  {
            print("error load data", error)
        }
        
        updateLayout()
        
    }
    
    func updateLayout() {
        
        nameLabel.text = dataContact?.last?.name
        phoneNumberLabel.text = dataContact?.last?.phoneNumber
        
    }
    
}

