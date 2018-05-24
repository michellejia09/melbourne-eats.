//
//  LoginVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/16.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: BaseTableViewController, UITextFieldDelegate{
    @IBOutlet var table: UITableView!
    
    
    @IBOutlet weak var tfv1: UIView!
    @IBOutlet weak var telNoTF: UITextField!
    @IBOutlet weak var tfv2: UIView!
    @IBOutlet weak var passwordTF: UITextField!

    @IBOutlet weak var loginBtn: UIButton!
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Login"
    
        setUI()
        
        
//        telNoTF.text = "13340263892"
//        passwordTF.text = "111111"
    }
    
    
    
    func setUI(){
        //statusbar
        let statusRect = UIApplication.shared.statusBarFrame
        table.contentInset = UIEdgeInsets(top: 0-statusRect.size.height-1, left: 0, bottom: 0, right: 0)
        
        tfv1.layer.cornerRadius = 22.5
        tfv1.layer.borderColor = colorMain.cgColor
        tfv1.layer.borderWidth = 1.0
        tfv2.layer.cornerRadius = 22.5
        tfv2.layer.borderColor = colorMain.cgColor
        tfv2.layer.borderWidth = 1.0
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        view.endEditing(true)
        if telNoTF.text!.isEmpty {
            showHUDWithText("Enter Phone number", 1.5)
            return
        }
  
        if passwordTF.text!.isEmpty {
            showHUDWithText("Enter Password", 1.5)
            return
        }

        
        showHUD()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
            self.dismissHUD()
            //
            if let user: JSONDictionary = UserDefaults.standard.dictionary(forKey: self.telNoTF.text!) {
                let ids = user["id"] as? String
                let ps = user["password"] as? String
                if self.telNoTF.text! == ids && self.passwordTF.text! == ps {
                    User.shared().bind(user)
                    self.showSuccessHUD("Sucessful！")
                    APPDelegate.signInRequest()
                } else {
                    self.showHUDWithText("This Account or Password is incorrect", 1.5)
                }
                
            } else {
                self.showHUDWithText("This Account is inviald", 1.5)
            }
        }
        
        
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let vc = UIStoryboard.Scene.registerVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func findPasswordAction(_ sender: Any) {
        let vc = UIStoryboard.Scene.forgetPasswordVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
}


