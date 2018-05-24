//
//  ConfirmOrderVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/16.
//  Copyright © 2018年 michelle. All rights reserved.
//
import Foundation
import UIKit

class ConfirmOrderVC: BaseTableViewController, UITextFieldDelegate{
    @IBOutlet var table: UITableView!
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var addressDetail: UITextField!
    @IBOutlet weak var time: UITextField!
    
    @IBOutlet weak var totalFree: UITextField!
   
    @IBOutlet weak var free: UILabel!
    
    @IBOutlet weak var des: UITextView!
    
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
        title = "Confirm Order"
        
        submitBtn.layer.cornerRadius = 20
        submitBtn.layer.borderColor = colorMain.cgColor
        submitBtn.layer.borderWidth = 1.0
        
        
        
        countAmount()
    }
    func countAmount() {
        var total: Double = 0.0
        for f in User.shared().carList! {
            if let p = f["price"] as? String {
                let ps = Double(p)
                total += ps!
            }
        }
        totalFree.text = "￥" + "\(total)"
    }
    
    @IBAction func submitAction(_ sender: Any) {
        var info = JSONDictionary()
        info["orderNo"] = tel.text!
        info["tel"] = tel.text!
        info["address"] = address.text!
        info["addressDetail"] = addressDetail.text!
        info["time"] = time.text!
        info["totalFree"] = totalFree.text!
        info["free"] = "3.5"
        showHUD()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
            User.shared().orderList?.append(info)
            
            self.showSuccessHUD("Pay Sucessful！")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
                if (self.navigationController?.viewControllers.count)! > 2 {
                    self.navigationController?.popToRootViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
}


