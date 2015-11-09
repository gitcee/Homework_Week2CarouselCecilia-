//
//  LoginViewController.swift
//  CarouselCecilia
//
//  Created by Chang, Cecilia on 11/7/15.
//  Copyright © 2015 Cee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var sign_in_nav_bar: UIImageView!
    
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var SigninButton: UIButton!
    @IBOutlet weak var SigninIndicator: UIActivityIndicatorView!
   
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            scrollView.delegate = self
        
            scrollView.contentSize = scrollView.frame.size
            scrollView.contentInset.bottom = 110
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -110
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
       sign_in_nav_bar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        sign_in_nav_bar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.4) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.sign_in_nav_bar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.sign_in_nav_bar.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -40 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
        
    }

    @IBAction func didPressLogin(sender: AnyObject) {
        SigninIndicator.startAnimating()
        SigninButton.selected = true
        
        if EmailField.text == "abcd" && PasswordField.text == "abcde" {
            delay(1, closure: { () -> () in
                // Stop animating the activity indicator.
                self.SigninIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.SigninButton.selected = false
                // perform the Segue to the next screen.
                self.performSegueWithIdentifier("LoginOK", sender: nil)
            })

           
        } else {
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.SigninIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.SigninButton.selected = false
                // Create and Show UIAlertController...see guide, Using UIAlertController
                let alertController = UIAlertController(title: "Oppps", message: "too bad it's wrong", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            })
        }
        
    }
    @IBAction func didTapScreen(sender: AnyObject) {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
