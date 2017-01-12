import UIKit

/// Add your own flow to Application
///
enum ApplicationFlow: String {
    case main = "main"
    case signIn = "signIn"
    case signUp = "signUp"
}

class Router {
    static let instance = Router()
    /// class AppDelegate by default
    /// provide your own class name if needed
    ///
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
}

//MARK: - Application flow
extension Router {
    
    /// Use for run app in AppDelagate
    ///
    func runAppWith(_ flow: ApplicationFlow) {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        switchTo(flow)
        appDelegate.window?.makeKeyAndVisible()
    }
    
    /// Maybe using in Runtime
    ///
    func switchTo(_ flow: ApplicationFlow) {
        var flowController: UIViewController!
        switch flow {
        case .main:
            flowController = mainFlowController()
        case .signIn:
            flowController = signInFlowController()
        case .signUp:
            flowController = signUpFlowController()
        }
        appDelegate.window!.rootViewController = flowController
    }
    
    /// Add your own flow controller instance
    ///
    /// - Returns: UIViewController (UINavigationController)
    private func mainFlowController() -> UIViewController {
        return Storyboard.main.instantiateViewController(withIdentifier: ApplicationFlow.main.rawValue)
    }
    
    private func signInFlowController() -> UIViewController {
        return UINavigationController(rootViewController: Storyboard.signIn.instantiateViewController(withIdentifier: ApplicationFlow.signIn.rawValue))
    }
    
    private func signUpFlowController() -> UIViewController {
        return UINavigationController(rootViewController: Storyboard.signUp.instantiateViewController(withIdentifier: ApplicationFlow.signUp.rawValue))
    }
}

struct Storyboard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
    static let signIn = UIStoryboard(name: "SignIn", bundle: nil)
    static let signUp = UIStoryboard(name: "SignUp", bundle: nil)
}
