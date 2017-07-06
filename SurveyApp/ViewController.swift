//
//  ViewController.swift
//  SurveyApp
//
//  Created by Jacob Edmond on 7/5/17.
//  Copyright © 2017 Jacob Edmond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var progressLabel: UILabel!

    var currentViewController:UIViewController?
    
    var pageIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextTapped(_ sender: Any) {

        
        switch (pageIndex) {
        case 1:
            // Go to Second View Controller
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: "SecondVC")
            
            if let fromVC = currentViewController, let toVC = nextViewController {
                
                switchChildViewControllers(fromVC: fromVC, toVC: toVC)
            }
            
            break
            
        case 2:
            // Go to Third View Controller
            break
            
        default:
            break
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        currentViewController = segue.destination
    }
    
    func switchChildViewControllers(fromVC:UIViewController, toVC:UIViewController) {
        
        // Tell the current VC that it's transitioning
        fromVC.willMove(toParentViewController: nil)
        
        // Add the new VC
        self.addChildViewController(toVC)
        containerView.addSubview(toVC.view)
        
        // Remove the old VC
        fromVC.view.removeFromSuperview()
        fromVC.removeFromParentViewController()
        
        // Size the from of the toVC
        toVC.view.frame = containerView.bounds
        
        // Tell the new VC that it has transitioned
        toVC.didMove(toParentViewController: self)
        
        // Set the currentViewController property to toVC
        currentViewController = toVC
        
    }
    
}
