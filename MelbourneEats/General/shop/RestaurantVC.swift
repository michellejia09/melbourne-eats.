//  RestaurantVC.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/16.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class RestaurantVC: BaseViewController{
    
    @IBOutlet weak var viewPagerNavigationBar:BmoViewPagerNavigationBar!
    @IBOutlet weak var viewPagerSegmentedView: SegmentedView!
    @IBOutlet weak var viewPager: BmoViewPager!
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        navigationController?.setNavigationBarHidden(true, animated: animated)
    //    }
    
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(animated)
    //        navigationController?.setNavigationBarHidden(false, animated: animated)
    //    }
    
    var dict: JSONDictionary? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        if let n = dict?["name"] as? String {
            title = n
        }
        
        setUI()
    }
    
    func setUI(){
        viewPagerNavigationBar.viewPager = viewPager
        viewPagerNavigationBar.layer.masksToBounds = true
        viewPagerNavigationBar.layer.cornerRadius = viewPagerSegmentedView.layer.cornerRadius
        viewPager.presentedPageIndex = 0
        viewPager.infinitScroll = true
        viewPager.dataSource = self
    }
    
}





extension RestaurantVC: BmoViewPagerDataSource {
    
    
    // Optional
    func bmoViewPagerDataSourceNaviagtionBarItemNormalAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedStringKey : Any]? {
        return [
            NSAttributedStringKey.foregroundColor : viewPagerSegmentedView.strokeColor
        ]
    }
    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedStringKey : Any]? {
        return [
            NSAttributedStringKey.foregroundColor : UIColor.white
        ]
    }
    func bmoViewPagerDataSourceNaviagtionBarItemTitle(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> String? {
        switch page {
        case 0:
            return "Order"
        case 1:
            return "Restaurant"
        case 2:
            return "User Review"
        default:
            return "Comments"
        }
    }
    func bmoViewPagerDataSourceNaviagtionBarItemSize(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> CGSize {
        return CGSize(width: navigationBar.bounds.width / 4, height: navigationBar.bounds.height)
    }
    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedBackgroundView(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = viewPagerSegmentedView.strokeColor
        return view
    }
    
    // Required
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        return 4
    }
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        switch page {
        case 0:
            let vc = UIStoryboard.Scene.foodListVC
            return vc
        case 1:
            let vc = UIStoryboard.Scene.restaurantInfoVC
            return vc
        case 2:
            let vc = UIStoryboard.Scene.restaurantCommentListVC
            return vc
        default:
            let vc = UIStoryboard.Scene.restaurantCommentVC
            return vc
        }
    }
}

