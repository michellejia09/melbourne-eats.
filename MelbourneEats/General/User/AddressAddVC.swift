//
//  AddressAddVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/20.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit
class AddressAddVC:BaseTableViewController, UITextFieldDelegate{
    @IBOutlet var table: UITableView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var address: UITextField!
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Add Address"
        
        addNavigationBarLeftItem(self, action: #selector(popBack), image: #imageLiteral(resourceName: "关闭"))
    }
    
    
    
    func setUI(){

    }
    
    @IBAction func submitAction(_ sender: Any) {
        view.endEditing(true)
        if name.text!.isEmpty {
            showHUDWithText("Enter Nickname", 1.5)
            return
        }
        if tel.text!.isEmpty {
            showHUDWithText("Enter Password", 1.5)
            return
        }
        
        if address.text!.isEmpty {
            showHUDWithText("Enter Detail Address", 1.5)
            return
        }
        
        var info = JSONDictionary()
        info["name"] = name.text!
        info["tel"] = tel.text!
        info["address"] = address.text!
        
        showHUD()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
            self.dismissHUD()
            User.shared().addresses?.append(info)
            self.showSuccessHUD("Sucessful！")
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}

