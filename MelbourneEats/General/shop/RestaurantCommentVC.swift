//
//  RestaurantCommentVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/18.
//  Copyright © 2018年 michelle. All rights reserved.
//
import Foundation
import UIKit

class RestaurantCommentVC: BaseTableViewController, UITextViewDelegate{
    
    @IBOutlet weak var tv: UITextView!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setUI()
    }
    
    func setUI(){
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.layer.borderWidth = 1.0
        submitBtn.layer.cornerRadius = 20
        submitBtn.layer.borderColor = colorMain.cgColor
        submitBtn.layer.borderWidth = 1.0
    }
    
    @IBAction func submitAction(_ sender: Any) {
        if tv.text!.isEmpty {
            showHUDWithText("Please fill this contents", 1.5)
            return
        }
        showHUD()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
            self.showSuccessHUD("Comments Sucessful！")
            self.tv.text = ""
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
    
    
    
}
