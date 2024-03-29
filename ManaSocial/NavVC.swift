import UIKit

class NavVC: UINavigationController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Color of the title at the top of the navigation controller.
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Buttons color.
        self.navigationBar.tintColor = UIColor.white
        
        // Background color of the navigation bar.
        self.navigationBar.barTintColor = UIInfo.MCOLOR_BLACK
        
        // Display translucent.
        self.navigationBar.isTranslucent = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
}
