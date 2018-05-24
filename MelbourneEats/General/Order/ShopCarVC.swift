//
//  ShopCarVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/16.
//  Copyright © 2018年 michelle. All rights reserved.
//
import Foundation
import UIKit

class ShopCarVC: BaseViewController {
    @IBOutlet var table: UITableView!
    fileprivate var list: Array<JSONDictionary> = []
    
    @IBOutlet weak var amount: UILabel!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Shopping Cart"
        
    }
    
    func setUI(){
        loadList("")
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
        amount.text = "$" + "\(total)"
    }
    
    func loadList(_ text: String) {
        self.list = User.shared().carList!
        self.table.reloadData()
    }
    
    @IBAction func orderAction(_ sender: Any) {
        if User.shared().carList?.count != 0 {
            let vc = UIStoryboard.Scene.confirmOrderVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func carAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearCarAction(_ sender: Any) {
        self.list = []
        self.table.reloadData()
        User.shared().carList = []
        countAmount()
    }
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


//MARK: - UITableViewDelegate, UITableViewDataSource
extension ShopCarVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CarFoodListCell = tableView.dequeueReusableCell(withIdentifier: "CarFoodListCell", for: indexPath) as! CarFoodListCell
        cell.bindData(User.shared().carList![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //        ///
        //        let dict = list[indexPath.row] as JSONDictionary
        //        if let idstring = dict["id"] {
        //            let detailvc = UIStoryboard.PostScene.postDetailVC as! PostDetailVC
        //            detailvc.idStr = String(describing: idstring)
        //            detailvc.hidesBottomBarWhenPushed = true
        //            navigationController?.pushViewController(detailvc, animated: true)
        //        }
        //        let vc = UIStoryboard.Scene.restaurantVC
        //        navigationController?.pushViewController(vc, animated: true)
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

