
//  HomeVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/16.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class HomeVC: BaseViewController, UITextFieldDelegate{
 
    @IBOutlet weak var table: UITableView!
    fileprivate var list: Array<JSONDictionary> = []
    fileprivate var totalPages = 0
    fileprivate var currentPage = 1 {
        didSet {
            loadList()
        }
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Homepage"
//        addNavigationBarTitle("Homepage")
        addNavigationBarLeftItem(self, action: #selector(popBack), image: #imageLiteral(resourceName: "账号"))
        addNavigationBarRightItem(self, action: #selector(rightItemAction), image: #imageLiteral(resourceName: "搜索"))
        
        setUI()
    }
    
    
    override func popBack() {
        let vc = UIStoryboard.Scene.personInfoVC
        navigationController?.pushViewController(vc, animated: true)
    }
    override func rightItemAction() {
        let vc = UIStoryboard.Scene.restaurantSearchVC
        let nav = BaseNavigationViewController.init(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    func setUI(){
//        http://www.58pic.com/tupian/waimai.html
        
        
        "http:​/​/​pic.jj20.com/​up/​allimg/​1111/​04061Q54619/​1P406154619-3.jpg"
        
        
        /*** MJRefresh ***/
        table.addLegendHeader { [weak self] in
            self?.refresh()
        }
        table.addLegendFooter { [weak self] in
            self?.loadMore()
        }
        table.footer.isHidden = true
        refresh()
    }
    
    
    // MARK: - port Requst
    /// refresh data
    private func refresh() {
        currentPage = 1
    }
    private func loadMore() {
        if currentPage < totalPages {
            currentPage += 1
        } else {
            table.footer.noticeNoMoreData()
        }
    }
    
    func loadList() {
        showHUD()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
            self.dismissHUD()
            self.table.header.endRefreshing()
            self.table.footer.endRefreshing()
            self.list = User.shared().restaurantList!
            self.table.reloadData()
        }
    }
    
}




//MARK: CycleViewDelegate
extension HomeVC: CycleViewDelegate {
    func cycleViewDidSelectedItemAtIndex(_ index: NSInteger) {
//        let demoVc = DemoController()

//        demoVc.view.backgroundColor = UIColor.white
//        navigationController?.pushViewController(demoVc, animated: true)
        let vc = UIStoryboard.Scene.restaurantVC as! RestaurantVC
        vc.dict = User.shared().hotRestaurantList?[index]
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeVC : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
            return 0
        }
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RestaurantCellListCell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCellListCell", for: indexPath) as! RestaurantCellListCell
        cell.bindData((User.shared().restaurantList?[indexPath.row])!)
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
        let vc = UIStoryboard.Scene.restaurantVC as! RestaurantVC
        vc.dict = User.shared().restaurantList?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section==0 {
            return 220
        }
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section==0 {
            //Loading image
            let pointY = 44 + UIApplication.shared.statusBarFrame.size.height
            let cycleView : CycleView = CycleView(frame: CGRect(x: 0, y: pointY, width: UIScreen.main.bounds.size.width, height: 220))
            cycleView.delegate = self
            cycleView.mode = .scaleAspectFill
            cycleView.imageURLStringArr = ["banner01.jpg", "banner02.jpg", "banner03.jpg", "banner04.jpg"]
            return cycleView
        }
        
        let hv = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 35))
        hv.backgroundColor = colorMain
        let t = UILabel.init(frame: hv.bounds)
        t.text = "- More Restaurant -"
        t.font = UIFont.boldSystemFont(ofSize: 12.0)
        t.textAlignment = .center
        t.textColor = UIColor.white
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
