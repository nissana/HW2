//
//  ConvoViewController.swift
//  HW2_Carousel
//
//  Created by Nissana Akranavaseri on 2/14/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import UIKit

class ConvoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func BackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
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
