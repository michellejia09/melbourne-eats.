//
//  RestaurantCell.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/18.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit


//MARK:-
class RestaurantCellListCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var questionBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var postStatus: UIButton!
    @IBOutlet weak var stateWith: NSLayoutConstraint!
    
    
    var clickBlock: (( ) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
 
    func bindData(_ info: JSONDictionary) {
        if let n = info["name"] as? String {
            name.text = n
        }
    }
}


//MARK:-
class RestaurantCommentListCell: UITableViewCell {
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var questionBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var postStatus: UIButton!
    @IBOutlet weak var stateWith: NSLayoutConstraint!
    
    
    var clickBlock: (( ) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
}

//MARK:-
class FoodTypeListCell: UITableViewCell {
    
    @IBOutlet weak var lv: UIView!
    @IBOutlet weak var rv: UIView!
    @IBOutlet weak var name: UILabel!
    
    var clickBlock: (( ) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func bindData(_ info: JSONDictionary) {
        if let n = info["name"] as? String {
            name.text = n
        }
    }
    
}


//MARK:-
class FoodListCell: UITableViewCell {
 
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var saleNumber: UILabel!
    var dict: JSONDictionary?
    
    var clickBlock: ((_ info: JSONDictionary) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func bindData(_ info: JSONDictionary) {
        dict = info
        
        if let n = info["name"] as? String {
            name.text = n
        }
        if let p = info["price"] as? String {
            price.text = p
        }
        if let s = info["saleNumber"] as? String {
            saleNumber.text = "Monthly\(s)"
        }
    }
    
    @IBAction func addClickAction(_ sender: Any) {
        if let c = clickBlock {
            c(dict!)
        }
        
    }
}

//MARK:-
class CarFoodListCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var number: UILabel!
    
    
    var clickBlock: (( ) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func jianAction(_ sender: Any) {
    }
    @IBAction func addAction(_ sender: Any) {
    }
    
    
    func bindData(_ info: JSONDictionary) {
        
        if let n = info["name"] as? String {
            name.text = n
        }
        if let p = info["price"] as? String {
            price.text = p
        }
//        if let s = info["saleNumber"] as? String {
//            saleNumber.text = "Monthly\(s)"
//        }
    }
    
}


//MARK:-
class AddressListCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var address: UILabel!
    
    var clickBlock: (( ) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bindAddress(_ info: JSONDictionary) {
        if let n = info["name"] as? String {
            name.text = n;
        }
        if let t = info["tel"] as? String {
            tel.text = t;
        }
        if let a = info["address"] as? String {
            address.text = a;
        }
        
    }
    
}

