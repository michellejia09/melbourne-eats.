//
//  FoodListVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/18.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class FoodListVC: BaseViewController{

    @IBOutlet weak var table1: UITableView!
    fileprivate var list1: Array<JSONDictionary> = []
    
    @IBOutlet weak var table2: UITableView!
    fileprivate var list2: Array<JSONDictionary> = []
    
    @IBOutlet weak var amount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setUI()
    }
    
    func setUI(){
        loadList1("")
        loadList2("")
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
        amount.text = "￥" + "\(total)"
    }
    
    
    
    func loadList1(_ text: String) {
        self.list1 = User.shared().foodTypeList!
        self.table1.reloadData()
    }
    func loadList2(_ text: String) {
        self.list2 = (User.shared().foodList?.first!)!
        self.table2.reloadData()
    }
    
    @IBAction func orderAction(_ sender: Any) {
        if User.shared().carList?.count != 0 {
            let vc = UIStoryboard.Scene.confirmOrderVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func carAction(_ sender: Any) {
        let vc = UIStoryboard.Scene.shopCarVC
        let nav = BaseNavigationViewController.init(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
    
}



//MARK: - UITableViewDelegate, UITableViewDataSource
extension FoodListVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table1 {
            return list1.count;
        }
        return list2.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == table1 {
            let cell: FoodTypeListCell = tableView.dequeueReusableCell(withIdentifier: "FoodTypeListCell", for: indexPath) as! FoodTypeListCell
            cell.bindData(list1[indexPath.row])
            return cell
        }
        let cell: FoodListCell = tableView.dequeueReusableCell(withIdentifier: "FoodListCell", for: indexPath) as! FoodListCell
        cell.bindData(list2[indexPath.row])
        cell.clickBlock = { (dict: JSONDictionary) in
            User.shared().carList?.append(dict)
            self.countAmount()
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView == table1 {
            self.list2 = (User.shared().foodList?[indexPath.row])!
            table2.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == table1 {
            return CGFloat.leastNormalMagnitude
        }
        return 45
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == table1 {
            return nil
        }
        let hv = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.size.width-95, height: 45))
        hv.backgroundColor = UIColor.white
        let t = UILabel.init(frame: CGRect.init(x: 15, y: 5, width: 100, height: 35))
        t.text = "Fried"
        t.font = UIFont.boldSystemFont(ofSize: 16.0)
        t.textAlignment = .left
        hv.addSubview(t)
        return hv
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}
