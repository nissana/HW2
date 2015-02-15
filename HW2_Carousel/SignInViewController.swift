//
//  SignInViewController.swift
//  HW2_Carousel
//
//  Created by Nissana Akranavaseri on 2/14/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var loginBTNContainer: UIView!
    
    var alertView: UIAlertView!
    var kbHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // emailTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignInButton(sender: AnyObject) {
        // Delay for 2 seconds, then run the code between the braces.
        delay(0.5 , {() -> () in
        self.checkPassword()
        })
    }

    @IBAction func panGesture(sender: AnyObject) {
           view.endEditing(true)
    }
    
//NOTE//
//In button func{
//    UIView.animateWithDuration(3.0, animations:{ ()-> Void in
//    self.
//    })
//}
//Logout, to get rid of the current modal screen (not from navigation controller)
//    IBbutton fuction{
//    dismissViewControllerAnimated(true, completion: nil)
//
//Set Correction config to no ~
//    keyboardIsShowing: Bool! = false
    
    func checkPassword() {
        //empty
        if (emailTextField.text.isEmpty || passwordTextField.text.isEmpty)
        {
            alertView = UIAlertView(title: "Email / Password Required", message: "Please enter your email and password.", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            view.endEditing(true)
        }
        
        //not empty, signing in
        else
        {
            alertView = UIAlertView(title: "Signing in...", message:nil, delegate: nil, cancelButtonTitle:nil)
            alertView.show()
            delay(1 , {() -> () in
                self.alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.view.endEditing(true)
                })
            
            if (emailTextField.text == "email@mail.com" && passwordTextField.text == "password") {
            //if (emailTextField.text == "e" && passwordTextField.text == "p") {

                delay(1.5 , {() -> () in
                    self.alertView.dismissWithClickedButtonIndex(0, animated: true)
                    self.performSegueWithIdentifier("signInSeque", sender: self)
                })
            } else {
                delay(1 , {() -> () in
                self.alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password.", delegate: nil, cancelButtonTitle: "OK")
                self.alertView.show()
                self.view.endEditing(true)
                })
            }
        }
    }
    
    
    //KEYBOARD Detections
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        kbHeight = kbSize.height
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            //move up the container
            self.loginContainer.center.y = self.kbHeight - 20
            self.loginBTNContainer.center.y = self.kbHeight + 100
            // self.loginContainer.center.y = kbSize.height - self.loginContainer.center.y/4
            }, completion: nil)
        
        //        println("kb \(kbSize.height)")
        //        println(self.loginContainer.center.y)
        //        println(self.loginBTNContainer.center.y)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.loginContainer.center.y = self.kbHeight + 100
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
   
    //HELPERS
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        // buttonIndex is 0 for Cancel
        // buttonIndex ranges from 1-n for the other buttons.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
