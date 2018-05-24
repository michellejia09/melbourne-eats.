//
//  PersonInfoVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/16.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit


class PersonInfoVC: BaseTableViewController{
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var currentAddress: UILabel!
    

    
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
        title = "Personal Detail"
        addNavigationBarLeftItem(self, action: #selector(popBack), image: #imageLiteral(resourceName: "返回白"))
        
        name.text = User.shared().nickName
        tel.text = User.shared().mobile
        
        currentAddress.text = User.shared().currentAddress
        
    }
 
    @IBAction func chooseImageAction(_ sender: Any) {
    }
    
    @IBAction func action1(_ sender: Any) {

    }
    
    @IBAction func action2(_ sender: Any) {
        let vc = UIStoryboard.Scene.addressListVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func action3(_ sender: Any) {
    }
    
    @IBAction func action4(_ sender: Any) {
    }
    
    @IBAction func action5(_ sender: UISwitch) {
        if sender.isOn {
            APPDelegate.playMusic()
        } else {
            APPDelegate.pauseMusic()
        }
    }
    
    @IBAction func relocationAction(_ sender: Any) {
        currentAddress.text = User.shared().currentAddress
    }
    
    
    
    @IBAction func exitAction(_ sender: Any) {
        let alertvc = UIAlertController(title: nil,
                                        message: "Are your sure want to quit？",
                                        preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: { action in
            User.shared().logout()
            APPDelegate.signOutRequest()
        })
        alertvc.addAction(cancelAction)
        alertvc.addAction(okAction)
        self.present(alertvc, animated: true, completion: nil)
    }
    
    
}


