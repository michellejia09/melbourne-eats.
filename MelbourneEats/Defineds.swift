//
//  Defineds.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/16.
//  Copyright © 2018年 michelle. All rights reserved.
//
import Foundation
import UIKit

//Version NO
let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String

let APPDelegate = UIApplication.shared.delegate as! AppDelegate

let ScreenBounds = UIScreen.main.bounds
let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

// iphonex
let isIphonex = CGSize.init(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!)


let colorMain = UIColor.init(red: 0.380, green: 0.792, blue: 0.753, alpha: 1.00)












