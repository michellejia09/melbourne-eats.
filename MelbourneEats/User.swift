//
//  User.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/16.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]
let UDF_kCurrentUserId = "currentUserId"           //Search,save user info

public class User {
    private static let _sharedInstance = User()
    
    static func shared() -> User {
        return _sharedInstance
    }
 
    
    /*User information*/
    var userId: String?
    var nickName: String?
    var mobile: String?             //mobile
    var age: String? = "18"
    var sex: String? = "1"
    
    var addresses: Array<JSONDictionary>? = [["name":"Michelle","tel":"0451372363","address":"123 little st, Melbourne,VIC,3000"],
        ["name":"Michelle","tel":"0451372363","address":"123 little st, Melbourne,VIC,3000"],
        ["name":"Michelle","tel":"0451372363","address":"123 little st, Melbourne,VIC,3000"]] {
        didSet {
            
        }
    }
    
    var hotRestaurantList: Array<JSONDictionary>? = [["name":"Little Sichuan",
                                                    "type":"Catering Class",
                                                    "serverType":"Fast food、Chinese",
                                                    "time":"Mon-Sun 06:00 ~ 21:00",
                                                    "address":"20 Swanston St,Melbourne, VIC,3000",
                                                    "tel":"10081",
                                                    "url":""],
                                                     ["name":"Little Sichuan",
                                                      "type":"Catering Class",
                                                      "serverType":"Fast food、Chinese",
                                                      "time":"Mon-Sun 06:00 ~ 21:00",
                                                      "address":"20 Swanston St,Melbourne, VIC,3000",
                                                      "tel":"10081",
                                                      "url":""],
                                                     ["name":"Little Sichuan",
                                                      "type":"Catering Class",
                                                      "serverType":"Fast food、Chinese",
                                                      "time":"Mon-Sun 06:00 ~ 21:00",
                                                      "address":"20 Swanston St,Melbourne, VIC,3000",
                                                      "tel":"10081",
                                                      "url":""]]
    
    var restaurantList: Array<JSONDictionary>? = [["name":"Little Sichuan",
                                                   "type":"Catering Class",
                                                   "serverType":"Fast food、Chinese",
                                                   "time":"Mon-Sun 06:00 ~ 21:00",
                                                   "address":"20 Swanston St,Melbourne, VIC,3000",
                                                   "tel":"10081",
                                                   "url":""],
                                                  ["name":"Little Sichuan",
                                                   "type":"Catering Class",
                                                   "serverType":"Fast food、Chinese",
                                                   "time":"Mon-Sun 06:00 ~ 21:00",
                                                   "address":"20 Swanston St,Melbourne, VIC,3000",
                                                   "tel":"10081",
                                                   "url":""],
                                                  ["name":"Little Sichuan",
                                                   "type":"Catering Class",
                                                   "serverType":"Fast food、Chinese",
                                                   "time":"Mon-Sun 06:00 ~ 21:00",
                                                   "address":"20 Swanston St,Melbourne, VIC,3000",
                                                   "tel":"10081",
                                                   "url":""],
                                                  ["name":"Little Sichuan",
                                                   "type":"Catering Class",
                                                   "serverType":"Fast food、Chinese",
                                                   "time":"Mon-Sun 06:00 ~ 21:00",
                                                   "address":"20 Swanston St,Melbourne, VIC,3000",
                                                   "tel":"10081",
                                                   "url":""]]
    
    var foodTypeList: Array<JSONDictionary>? = [["name":"Fried"], ["name":"Vege"],["name":"Vegen"],["name":"Snack"]]
    var foodList: Array<Array<JSONDictionary>>? = [[["name":"Fried Pork", "price":"25.90", "saleNumber":"178"],
                                                    ["name":"Fried Chicken", "price":"25.90", "saleNumber":"12"],
                                                    ["name":"Fried Prawn", "price":"25.90", "saleNumber":"34"],
                                                    ["name":"Fried Vege", "price":"25.90", "saleNumber":"34"]],
                                            [["name":"Apple", "price":"5.90", "saleNumber":"8"],
                                             ["name":"Corn", "price":"7.90", "saleNumber":"18"],
                                             ["name":"Potato", "price":"9.90", "saleNumber":"234"],
                                             ["name":"Fried Eggplant", "price":"5.90", "saleNumber":"22"]],
                                            [["name":"Fried Rice", "price":"11.90", "saleNumber":"24"],
                                             ["name":"Bao", "price":"12.90", "saleNumber":"123"],
                                             ["name":"Cumcanber", "price":"12.90", "saleNumber":"543"],
                                             ["name":"Tomato", "price":"10.90", "saleNumber":"43"]],
                                            [["name":"Deep fried Pork", "price":"25.90", "saleNumber":"13"],
                                             ["name":"puff", "price":"12.90", "saleNumber":"54"],
                                             ["name":"Tart", "price":"6.90", "saleNumber":"11"],
                                             ["name":"Meat Ball", "price":"5.90", "saleNumber":"13"]]]
    
    
    
    
    
    var carList: Array<JSONDictionary>? = []
    var orderList: Array<JSONDictionary>? = []
    
    var currentAddress: String? = ""
    
    
    
    
 
    
//    var userInfo: JSONDictionary  = [:] {
//        didSet {
//            bind(userInfo)
////            NotificationCenter.default.post(name: PPConfig.NotificationNameKey.UserInfoDidChanged, object: nil)
//        }
//    }

    static var isLogined: Bool {
        
        if let currentId: String = UserDefaults.standard.object(forKey: UDF_kCurrentUserId) as? String {
            if let user: JSONDictionary = UserDefaults.standard.dictionary(forKey: currentId) {
                User.shared().bind(user)
                return true
            }
        }
        if let _ = User.shared().userId {
            return true
        }
        return false
    }
 
    
    /// 登录成功后
    func bind(_ info: JSONDictionary) {
        let idStr = info["id"] as! String
        UserDefaults.standard.set(idStr, forKey: UDF_kCurrentUserId)
        UserDefaults.standard.set(info, forKey: idStr)
        
        
        ///
        if let idNo = info["id"] as? NSNumber {
            self.userId = String(describing: idNo.intValue)
        }

        self.nickName = info["nickName"] as? String
    
        self.mobile = info["tel"] as? String
 
        if let ag = info["age"] as? String {
            self.age = ag
        }
        if let sx = info["sex"] as? String {
            self.sex = sx
        }
    }
    

 
    func logout() {
        UserDefaults.standard.removeObject(forKey: UDF_kCurrentUserId)
 
//        User.shared().userInfo.removeAll()
        User.shared().userId = nil
        User.shared().nickName = nil
        
        User.shared().mobile = nil

        User.shared().age = "18"
        User.shared().sex = "1"
        
    }
    
    
}
