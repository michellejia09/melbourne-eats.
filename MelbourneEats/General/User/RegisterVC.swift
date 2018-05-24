//
//  RegisterVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/17.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class RegisterVC: BaseTableViewController, UITextFieldDelegate{
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var telNoTF: UITextField!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var sendCodeBtn: FetchSMSCodeButton!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var agreeBtn: UIButton!
    
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
        title = "Register"
        
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
    
    /// Agree tick
    @IBAction func agreeAction(_ sender: Any) {
        let btn: UIButton = sender as! UIButton
        agreeBtn.isSelected = !btn.isSelected
    }
    
    /// Register porotocol
    @IBAction func quryRegisterProtoclAction(_ sender: Any) {
//        let advc = WebH5VC()
//        advc.titleStr = ""
//        advc.path = Config.userAgreement
//        advc.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(advc, animated: true)
    }
    
    @IBAction func submitAction(_ sender: Any) {
        view.endEditing(true)
        if telNoTF.text!.isEmpty {
            showHUDWithText("Enter Phone Number", 1.5)
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
     
        if passwordTF.text!.count < 6 || passwordTF.text!.count > 20 {
            showHUDWithText("Password is not legal，Please enter 6-20 character", 1.5)
            return
        }
        if !agreeBtn.isSelected {
            showHUDWithText("Agree App protocol", 1.5)
            return
        }
 
        var info = JSONDictionary()
        info["tel"] = telNoTF.text!
        info["id"] = telNoTF.text!
        info["password"] = passwordTF.text!
        info["userName"] = "MelbourneEats" + telNoTF.text!
        info["nickName"] = "Michelle"
        info["age"] = "18"
        info["sex"] = "1"
        
        
        showHUD()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
            self.showSuccessHUD("Congrats，Registing sucessful！")
            //
            let idStr = info["id"] as! String
            UserDefaults.standard.set(info, forKey: idStr)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
}
