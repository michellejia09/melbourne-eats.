
import UIKit



class BaseNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationBar.isTranslucent = false
        self.navigationBar.backgroundColor = nil
        navigationBar.shadowImage = UIImage()       // hide bottom border
        navigationBar.barStyle = .default
        
        
        
        
        let overlayer = UIView()
        overlayer.frame = CGRect.init(x: 0, y: -20, width: ScreenWidth, height: 64)
        overlayer.isUserInteractionEnabled = false
        overlayer.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleHeight]
       
        let layer = CAGradientLayer().navChangeLayer(colorMain, colorMain)
//        let layer = CAGradientLayer().navChangeLayer(UIColor.white, UIColor.black)
        layer.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 64)
        overlayer.layer.addSublayer(layer)
        let bgimg = getImageFromView(view: overlayer)
        navigationBar.setBackgroundImage(bgimg, for: .default)
        
//
        
//        navigationBar.setBackgroundImage(UIImage.imageWith(PPConfig.PPColor.main), for: .default)
        navigationBar.tintColor = UIColor.white
        let textAttributes = {[
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)
            ]}
        navigationBar.titleTextAttributes = textAttributes()
        
        if responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.delegate = self
            delegate = self
        }
        
    }
    
    var titleColor: UIColor = UIColor.white {
        didSet {
            let textAttributes = {[
                NSAttributedStringKey.foregroundColor: UIColor.red,
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)
                ]}
            navigationBar.titleTextAttributes = textAttributes()
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            //UIApplication.shared.statusBarStyle = .default
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        if self.viewControllers.count == 2 {
            //UIApplication.shared.statusBarStyle = .lightContent
        }
        return super.popViewController(animated: animated)
    }
    
    /// disables swipe gestures
    public func disableSwipeBack() {
        interactivePopGestureRecognizer?.isEnabled = false
    }
    
    /// enables swipe gestures
    public func enableSwipeBack() {
        interactivePopGestureRecognizer?.isEnabled = true
    }
    
    /// toggles swipe gestures
    public func toggleSwipeBack() {
        guard let status = interactivePopGestureRecognizer?.isEnabled else {
            return
        }
        interactivePopGestureRecognizer?.isEnabled = !status
    }
}


extension BaseNavigationViewController: UIGestureRecognizerDelegate {
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        if responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) && animated {
            interactivePopGestureRecognizer?.isEnabled = false
        }
        
        return super.popToRootViewController(animated: animated)
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        if responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) && animated {
            interactivePopGestureRecognizer?.isEnabled = false
        }
        
        return super.popToViewController(viewController, animated: false)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == interactivePopGestureRecognizer {
            if self.viewControllers.count < 2 || self.visibleViewController == self.viewControllers[0] {
                return false
            }
        }
        
        return true
    }

}

extension BaseNavigationViewController: UINavigationControllerDelegate {
    //MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.isEnabled = true
        }
    }
}


extension UINavigationController {
   
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    open override var childViewControllerForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
}

fileprivate extension UIImage {
    /**
     
     
     - parameter color:
     
     - returns:
     */
    class func imageWith(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

extension UIViewController {
    
    func getImageFromView(view:UIView) ->UIImage{
        
        UIGraphicsBeginImageContext(view.bounds.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension CAGradientLayer {
    
    
    
    func navChangeLayer(_ color1: UIColor, _ color2: UIColor) -> CAGradientLayer {
        
        let gradientColors = [color1.cgColor,
                              color2.cgColor]
  
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        
        
        self.colors = gradientColors
        self.locations = gradientLocations
        
        
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        
        return self
    }
    
    
    func rainbowLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.red.cgColor,
                              UIColor.orange.cgColor,
                              UIColor.yellow.cgColor,
                              UIColor.green.cgColor,
                              UIColor.cyan.cgColor,
                              UIColor.blue.cgColor,
                              UIColor.purple.cgColor]
        
        
        let gradientLocations:[NSNumber] = [0.0, 0.17, 0.33, 0.5, 0.67, 0.83, 1.0]
        
       
        self.colors = gradientColors
        self.locations = gradientLocations
        
       
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        
        return self
    }
}
