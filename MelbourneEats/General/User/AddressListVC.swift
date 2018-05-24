//
//  AddressListVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/20.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class AddressListVC: BaseViewController {
    @IBOutlet var table: UITableView!
    fileprivate var list: Array<JSONDictionary> = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
        setUI()
    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Address"
        addNavigationBarLeftItem(self, action: #selector(popBack), image: #imageLiteral(resourceName: "返回白"))
        addNavigationBarRightItem(self, action: #selector(rightItemAction), image: #imageLiteral(resourceName: "ic_add"))
    }
    
    override func rightItemAction() {
        let vc = UIStoryboard.Scene.addressAddVC
        let nav = BaseNavigationViewController.init(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
    func setUI(){
        loadList("")
        
    }
    
    func loadList(_ text: String) {
        self.list = User.shared().addresses!
        self.table.reloadData()
    }
}


//MARK: - UITableViewDelegate, UITableViewDataSource
extension AddressListVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AddressListCell = tableView.dequeueReusableCell(withIdentifier: "AddressListCell", for: indexPath) as! AddressListCell
        cell.bindAddress(list[indexPath.row])
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
