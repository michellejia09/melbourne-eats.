
import Foundation
import UIKit


class BaseTableViewController: UITableViewController {
    
    /// MBProgressHUD
    var hud: MBProgressHUD?
    
    
    
    var animatedOnNavigationBar = true
    
    deinit {
        print("👻👻👻------------\(String(describing: self)) deinit")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        
        if #available(iOS 11.0, *) {
            if let view = self.view.subviews.first {
                if view.isKind(of: UIScrollView.self) {
                    (view as! UIScrollView).contentInsetAdjustmentBehavior = .never
                }
            }
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }

    
    var style: navigationBarStyle = .main
    
  
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if style == .white {
            return .default
        } else {
            return .lightContent
        }
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        if style == .white {
//            navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(PPConfig.PPColor.main), for: .default)
//            (navigationController as? PPNavigationController)?.titleColor = .white
//        } else {
//            navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(PPConfig.PPColor.main), for: .default)
//            (navigationController as? PPNavigationController)?.titleColor = .white
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(MTNavigationBarBackgroundColor), for: .default)
        //(navigationController as! MTNavigationController).titleColor = .white
        
    }
    
    
    // MARK: - ACTIONS
    
    func addNavigationBarLeftItem(_ taget: Any, action: Selector = #selector(popBack), image: UIImage? = #imageLiteral(resourceName: "backWhite")) {
//        var imgage: UIImage?
//        if let leftImg = image {
//        } else {
//            //            imgage = style == .white ? #imageLiteral(resourceName: "backGary") : #imageLiteral(resourceName: "backWhite")
//            imgage = #imageLiteral(resourceName: "backWhite")
//        }
        let item = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
        item.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = item
    }
    
 
    func addNavigationBarRightItem(_ taget: Any, action: Selector = #selector(rightItemAction), image: UIImage? = UIImage(named: "backWhite")) {
        let item = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
        item.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = item
    }
    

    
    func addNavigationBarRightItem(_ taget: Any, action: Selector = #selector(rightItemAction), text: String, color: UIColor? = .white) {
        //        let rightButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 68, height: 36))
        //        rightButton.contentHorizontalAlignment = .right
        //        rightButton.setTitle(text, for: .normal)
        //        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        //        rightButton.setTitleColor(color, for: .normal)
        //        rightButton.setTitleColor(color?.alpha(0.5), for: .highlighted)
        //        rightButton.addTarget(taget, action: action, for: .touchUpInside)
        
        let item = UIBarButtonItem(title: text, style: .plain, target: self, action: action)
        item.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = item
    }
    

//    @discardableResult
//    func addNavigationBarRightButton(_ taget: Any, action: Selector, image: UIImage)  -> UIButton {
//        let rightButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
//        rightButton.setImage(image, for: .normal)
//        rightButton.addTarget(taget, action: action, for: .touchUpInside)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
//        return rightButton
//    }
//    

//    @discardableResult
//    func addNavigationBarRightButton(_ taget: Any, action: Selector, text: String, color: UIColor? = .white) -> UIButton {
//        let rightButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 68, height: 36))
//        rightButton.contentHorizontalAlignment = .right
//        rightButton.setTitle(text, for: .normal)
//        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        rightButton.setTitleColor(color, for: .normal)
//        rightButton.setTitleColor(color?.alpha(0.5), for: .highlighted)
//        rightButton.addTarget(taget, action: action, for: .touchUpInside)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
//        return rightButton
//    }
    
   
    @discardableResult
    func addNavigationBarTitle(_ title: String, color: UIColor = .white) -> UILabel {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 29, height: 31))
        titleLabel.text = title
        titleLabel.font = NavBarTitleFont
        titleLabel.textColor = color
        titleLabel.sizeToFit()
        titleLabel.textAlignment = .center
        self.navigationItem.titleView = titleLabel
        return titleLabel
    }
    
   
    @objc func popBack() {
        if let root = self.navigationController?.viewControllers[0] {
            if root == self {
                self.navigationController?.dismiss(animated: true, completion: nil)
            } else {
                let _ = self.navigationController?.popViewController(animated: true)
            }
        } else {
            self.navigationController?.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
    @objc func rightItemAction() {
        
    }
    
    
    func showTips(_ message: String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 24))
        titleLabel.textAlignment = .center
        titleLabel.layer.cornerRadius = 3
        titleLabel.layer.masksToBounds = true
        titleLabel.text = message
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.backgroundColor = UIColor(red:0.26, green:0.28, blue:0.33, alpha:1.00)
        titleLabel.textColor = UIColor.white
        let layer = titleLabel.layer
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 3
        //titleLabel.sizeToFit()
        titleLabel.center = view.center
        view.addSubview(titleLabel)

        //        delay(1.5) {
        //            titleLabel.removeFromSuperview()
        //        }
        
    }
    
    
    
    
    // MARK: - MBProgressHUD
    func showHUD() {
        self.hud = MBProgressHUD.showAdded(to: view, animated: true)
        self.hud?.removeFromSuperViewOnHide = true
        self.hud?.mode = .indeterminate
        self.hud?.layer.shadowOpacity = 0.5
    }
    
    func showHUDWithMessage(msg: String) {
        self.hud = MBProgressHUD.showAdded(to: view, animated: true)
        self.hud?.removeFromSuperViewOnHide = true
        self.hud?.mode = .indeterminate
        self.hud?.label.text = msg
        self.hud?.layer.shadowOpacity = 0.5
    }
    
    func showHUDWithMessageAutoDismiss(msg: String) {
        self.hud = MBProgressHUD.showAdded(to: view, animated: true)
        self.hud?.removeFromSuperViewOnHide = true
        self.hud?.mode = .indeterminate
        self.hud?.label.text = msg
        self.hud?.layer.shadowOpacity = 0.5
        self.hud?.hide(animated: true, afterDelay: 1.5)
    }
    
    func showHUDWithText(_ text: String, _ duration: Double = 1.5) {
        self.hud = MBProgressHUD.showAdded(to: view, animated: true)
        self.hud?.removeFromSuperViewOnHide = true
        self.hud?.mode = .text
        self.hud?.label.text = text
        self.hud?.margin = 10.0
        self.hud?.layer.shadowOpacity = 0.5
        self.hud?.hide(animated: true, afterDelay: duration)
    }
    
    func showDetailsTextHUD(_ text: String, _ duration: Double = 1.5) {
        self.hud = MBProgressHUD.showAdded(to: view, animated: true)
        self.hud?.removeFromSuperViewOnHide = true
        self.hud?.mode = .text
        self.hud?.label.text = text
        self.hud?.margin = 10.0
        self.hud?.detailsLabel.font = UIFont.systemFont(ofSize: 15.0)
        self.hud?.layer.shadowOpacity = 0.5
        self.hud?.hide(animated: true, afterDelay: duration)
    }
    
    func showSuccessHUD(_ sucMsg: String) {
        if self.hud != nil {
            self.hud?.removeFromSuperview()
            self.hud = nil
        }
        self.hud = MBProgressHUD.showAdded(to: view, animated: true)
        self.hud?.removeFromSuperViewOnHide = true
        let iv = UIImageView.init(image: UIImage.init(named: "success"))
        self.hud?.customView = iv
        self.hud?.layer.shadowOpacity = 0.5
        self.hud?.mode = .customView
        if sucMsg.count > 0 {
            self.hud?.label.text = sucMsg
        }
        self.hud?.hide(animated: true, afterDelay: 1.0)
    }
    
    func showFailedHUD(_ failedMsg: String) {
        if self.hud != nil {
            self.hud?.removeFromSuperview()
            self.hud = nil
        }
        self.hud = MBProgressHUD.showAdded(to: view, animated: true)
        self.hud?.removeFromSuperViewOnHide = true
        let iv = UIImageView.init(image: UIImage.init(named: "fail"))
        self.hud?.customView = iv
        self.hud?.layer.shadowOpacity = 0.5
        self.hud?.mode = .customView
        if failedMsg.count > 0 {
            self.hud?.label.text = failedMsg
        }
        self.hud?.hide(animated: true, afterDelay: 1.0)
    }
    
    func dismissHUD() {
        MBProgressHUD.hide(for: view, animated: true)
    }

}

