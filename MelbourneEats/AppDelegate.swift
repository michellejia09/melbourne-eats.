//
//  AppDelegate.swift
//  MelbourneEats
//
//  Created by michelle on 2018/5/16.
//  Copyright © 2018年 michelle. All rights reserved.
//

import UIKit


import AVFoundation
import MediaPlayer

import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,CLLocationManagerDelegate {

    var window: UIWindow?
    
    var audioPlayer = AudioManager.sharedManager.audioPlayer
    
    let locationManager = CLLocationManager()
    var currentLocation:CLLocation!
    var lock = NSLock()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
//        window?.rootViewController = ESTabBarController.createTabbar2(delegate: nil)
        
        if User.isLogined {
            signInRequest()
        } else {
            let vc = UIStoryboard.Scene.loginVC
            let nav = BaseNavigationViewController(rootViewController: vc)
            window?.rootViewController = nav
        }
        
        
        
        preforMusic()
        playMusic()
        
        locPre()
        

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}



extension AppDelegate {
    ///
    /// Signin
    ///
    func signInRequest() {
        let vc = UIStoryboard.Scene.homeVC
        let nav = BaseNavigationViewController(rootViewController: vc)
        window?.rootViewController = nav
    }
    
    ///
    /// Signo0ut
    ///
    func signOutRequest() {
        User.shared().logout()
        
        let vc = UIStoryboard.Scene.loginVC
        let nav = BaseNavigationViewController(rootViewController: vc)
        window?.rootViewController = nav
    }
    
    
    func preforMusic() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            
        }
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        let pathURL = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: pathURL)
        } catch {
            audioPlayer = nil
        }
        audioPlayer?.prepareToPlay()
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
//        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
//            MPMediaItemPropertyTitle:"第一夫人",
//            MPMediaItemPropertyArtist:"张杰",
//            MPMediaItemPropertyArtwork:MPMediaItemArtwork(image: UIImage(named: "img.jpeg")!),
//            MPNowPlayingInfoPropertyPlaybackRate:1.0,
//            MPMediaItemPropertyPlaybackDuration:audioPlayer?.duration,
//            MPNowPlayingInfoPropertyElapsedPlaybackTime:audioPlayer?.currentTime
//        ]
    }
    
    func playMusic(){
        audioPlayer?.play()
    }
    
    func pauseMusic(){
        audioPlayer?.pause()
    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        switch event!.subtype {
        case .remoteControlPlay:  // play Button
            audioPlayer?.play()
        case .remoteControlPause:  // pause Button
            audioPlayer?.pause()
        case .remoteControlNextTrack:  // next
          
            break
        case .remoteControlPreviousTrack:  // previous
           
            break
        default:
            break
        }
    }
    
    func locPre() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //kCLLocationAccuracyNearestTenMeters;
        locationManager.distanceFilter = 50
        locationManager.requestWhenInUseAuthorization()
        //requestAlwaysAuthorization;
        locationManager.startUpdatingLocation()
        print("Start Location》》》")
    }
    
    /**
     *  CLlocationDelegate
     */
    //
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lock.lock()
        currentLocation = locations.last
        print("Current Location：\(currentLocation.coordinate.latitude)")
        
        print(currentLocation.coordinate.longitude)
        lock.unlock()
        
        
        let cg = CLGeocoder.init()
        cg.reverseGeocodeLocation(locations.first!) { (placemarks, error) in
            let placemark: CLPlacemark = (placemarks?.first)!
            if (placemarks?.count != 0) {
                User.shared().currentAddress = "\(String(describing: placemark.locality)) \(String(describing: placemark.subLocality)) \(placemark.thoroughfare)"
            }
        }
        
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Location error！！\(error)")
    }
}



class AudioManager: NSObject, AVAudioPlayerDelegate {
    static let sharedManager = AudioManager()  // singleton
    var audioPlayer: AVAudioPlayer!
}



