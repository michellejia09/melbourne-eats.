//
//  ForgetPasswordVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/17.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class ForgetPasswordVC: BaseTableViewController, UITextFieldDelegate{
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var telNoTF: UITextField!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var sendCodeBtn: FetchSMSCodeButton!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordAgainTF: UITextField!

    
    @IBOutlet weak var submitBtn: UIButton!
    
    
    
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
        title = "Forget Password"
        
        submitBtn.layer.cornerRadius = 20.0
        submitBtn.layer.borderColor = UIColor.brown.cgColor
        submitBtn.layer.borderWidth = 1.0
    }
    
    @IBAction func getCodeAction(_ sender: Any) {
        view.endEditing(true)
        
        if telNoTF.text!.count == 0 {
            showHUDWithText("Enter Phone number", 1.5)
            return
        }
        
        showHUD()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5) {
            self.sendCodeBtn.startCountdown()
            self.showSuccessHUD("Send sucessful, Defalut 0000")
        }
    }
 
    
    @IBAction func submitAction(_ sender: Any) {
        view.endEditing(true)
        if telNoTF.text!.isEmpty {
            showHUDWithText("Enter Phone number ", 1.5)
            return
        }
        if codeTF.text!.isEmpty {
            showHUDWithText("Enter Verification code", 1.5)
            return
        }
        if passwordTF.text!.isEmpty {
            showHUDWithText("Enter Password", 1.5)
            return
        }
        if passwordTF.text! != passwordAgainTF.text! {
            showHUDWithText("Two password is not match", 1.5)
            return
        }
        if passwordTF.text!.count < 6 || passwordAgainTF.text!.count > 20 {
            showHUDWithText("Password is not leagal，enter 6-20 character", 1.5)
            return
        }
 
        
        showHUD()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
            self.dismissHUD()
            //
            if let user: JSONDictionary = UserDefaults.standard.dictionary(forKey: self.telNoTF.text!) {
                var info = JSONDictionary()
                info["tel"] = user["tel"]
                info["id"] = user["id"]
                info["password"] = user["password"]
                info["userName"] = user["userName"]
                info["nickName"] = user["nickName"]
                info["age"] = user["age"]
                info["sex"] = user["sex"]
                let idStr = info["id"] as! String
                UserDefaults.standard.set(info, forKey: idStr)
                
                self.showSuccessHUD("Password reset sucessful！")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5) {
                    self.navigationController?.popViewController(animated: true)
                }
            } else {
                self.showHUDWithText("This account is invilad", 1.5)
            }
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
}
