
//
//  RestaurantCommentListVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/18.
//  Copyright © 2018年 michelle. All rights reserved.
//
import Foundation
import UIKit

class RestaurantCommentListVC: BaseViewController{
    @IBOutlet var table: UITableView!
    fileprivate var list: Array<JSONDictionary> = []
    
    
    
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
        loadList("")
        
    
    }
    func loadList(_ text: String) {
        self.list = [["name":"Egg"],["name":"Egg"],["name":"Egg"],["name":"Egg"],["name":"Egg"],["name":"Egg"]]
        self.table.reloadData()
    }
    
    
    
    
}


//MARK: - UITableViewDelegate, UITableViewDataSource
extension RestaurantCommentListVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RestaurantCommentListCell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCommentListCell", for: indexPath) as! RestaurantCommentListCell
        //        cell.dict = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
 
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
