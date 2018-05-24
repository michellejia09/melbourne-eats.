//
//  RestaurantInfoVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/18.
//  Copyright © 2018年 michelle. All rights reserved.
//
import Foundation
import UIKit

class RestaurantInfoVC: BaseTableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Restaurant Info"
        setUI()
    }
    
    func setUI(){
        
    }
    
    @IBAction func callPhoneAction(_ sender: Any) {
        
        let alertVC : UIAlertController = UIAlertController.init(title: "Call:10086？", message: "", preferredStyle: .alert)
        let falseAA : UIAlertAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        let trueAA : UIAlertAction = UIAlertAction.init(title: "Confirm", style: .default) { (alertAction) in
            
            UIApplication.shared.openURL(NSURL.init(string: "tel://10086")! as URL)
        }
        alertVC.addAction(falseAA)
        alertVC.addAction(trueAA)
        present(alertVC, animated: true, completion: nil)
    }
}
