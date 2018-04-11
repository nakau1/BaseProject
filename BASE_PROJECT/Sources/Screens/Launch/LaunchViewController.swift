//
//  BASE_PROJECT
//  Copyright Nakayasu Yuichi All rights reserved.
//
import UIKit

class LaunchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Appearance.fix()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(TopViewController.create(), animated: false) {}
    }
}
