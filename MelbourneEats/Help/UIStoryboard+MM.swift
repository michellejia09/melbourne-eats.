//
//  UIStoryboard+MM.swift
//  MelbourneEats
//
//  Created by michelle on 2018/3/21.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static var Main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    
    /// Signin
    struct Scene {
        static var loginVC: UIViewController {  //login
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "LoginVC")
        }
        static var registerVC: UIViewController {   //register
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "RegisterVC")
        }
        
        static var forgetPasswordVC: UIViewController { //forget password
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "ForgetPasswordVC")
        }
        
        static var personInfoVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "PersonInfoVC")
        }
        
        static var addressListVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "AddressListVC")
        }
        static var addressAddVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "AddressAddVC")
        }
        
        
        static var homeVC: UIViewController { //Homapage
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "HomeVC")
        }
        
        static var restaurantSearchVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "RestaurantSearchVC")
        }
        
        static var restaurantVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "RestaurantVC")
        }
        
        static var foodListVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "FoodListVC")
        }
        
        static var restaurantInfoVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "RestaurantInfoVC")
        }
        
        static var restaurantCommentVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "RestaurantCommentVC")
        }
        
        static var restaurantCommentListVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "RestaurantCommentListVC")
        }
        
        
        
        
        static var shopCarVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "ShopCarVC")
        }
        
        static var confirmOrderVC: UIViewController { //
            return UIStoryboard.Main.instantiateViewController(withIdentifier: "ConfirmOrderVC")
        }
    }
        
}
