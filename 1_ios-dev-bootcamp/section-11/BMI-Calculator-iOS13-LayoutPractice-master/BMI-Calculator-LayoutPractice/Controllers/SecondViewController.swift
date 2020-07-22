// UIKit contains all contents of Foundation, so no need to
// import both of the frameworks
import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        view.backgroundColor = UIColor.red
        // Adds a sub-view to a parent view
        // Most UIKit objects (label, buttons) are sub classes of UIView
        view.addSubview(label)
        
        
    }
    
}
