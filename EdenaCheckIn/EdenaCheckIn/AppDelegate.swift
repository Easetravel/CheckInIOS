

import SquarePointOfSaleSDK
import UIKit


@UIApplicationMain
class HelloChargeSwiftAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let sourceApplication = options[.sourceApplication] as? String,
            let window = window,
            let rootViewController = window.rootViewController,
            sourceApplication.hasPrefix("com.squareup.square") else {
                return false
        }
        
        let message: String
        let title: String
        do {
            let response = try SCCAPIResponse(responseURL: url)
            if response.isSuccessResponse {
                let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "thanksview") as UIViewController
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = initialViewControlleripad
                self.window?.makeKeyAndVisible()
            } else if let errorToPresent = response.error {
                title = "Error!"
                message = "Request failed: \(errorToPresent.localizedDescription)"
                let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                if var topController = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    topController.present(alertView, animated: true, completion: nil)
                    
                    // topController should now be your topmost view controller
                }
                
            
            } else {
                fatalError("We should never have received a response with neither a successful status nor an error message.")
            }
        } catch let error as NSError {
            title = "Error!"
            message = "Request failed: \(error.localizedDescription)"
        }
        
       
        
        return true
    }
}

