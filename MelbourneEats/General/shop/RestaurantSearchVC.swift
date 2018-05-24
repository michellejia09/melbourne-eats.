//
//  RestaurantSearchVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/18.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class RestaurantSearchVC: BaseViewController{
    @IBOutlet var table: UITableView!
    @IBOutlet weak var text: UITextField!
    fileprivate var list: Array<JSONDictionary> = []
 
    
    
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
    }
    
    @IBAction func disAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadList(_ text: String) {
        
        let arr = User.shared().restaurantList
        
      
        let result = arr!.filter {
            (($0["name"] as? String)?.contains("Little"))!
        } as Array
        if result.count == 0 {
            showHUDWithText("NO search result", 1.5)
            return
        }
        self.list = result
        self.table.reloadData()
    }
    
    
    
    
}


extension RestaurantSearchVC:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        //loadData
        if textField.text?.count != 0 {
            loadList(textField.text!)
        } else {
            
        }
        return true
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension RestaurantSearchVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RestaurantCellListCell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCellListCell", for: indexPath) as! RestaurantCellListCell
        cell.bindData((User.shared().restaurantList?[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
 
        let vc = UIStoryboard.Scene.restaurantVC as! RestaurantVC
        vc.dict = User.shared().restaurantList?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}


public extension String {
    /// Checking if String contains input
    public func contains(_ find: String) -> Bool {
        return self.range(of: find) != nil
    }
    
    /// Checking if String contains input with comparing options
    public func contains(_ find: String, compareOption: NSString.CompareOptions) -> Bool {
        return self.range(of: find, options: compareOption) != nil
    }
}
