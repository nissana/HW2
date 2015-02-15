//
//  TutorialsViewController.swift
//  HW2_Carousel
//
//  Created by Nissana Akranavaseri on 2/14/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import UIKit

class TutorialsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var welcome1: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tLastScreenBtn: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scrollView.contentSize = welcome1.frame.size
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        
        tLastScreenBtn.hidden = true
        
        // println(scrollView.contentSize)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
//        println(scrollView.contentOffset.x)
        var page = Int(scrollView.contentOffset.x/320)
        pageControl.currentPage = page
        self.tLastScreenBtn.alpha = 0.2;
        
        println(scrollView.contentOffset.x)
        
        //fade-in for the last screen
        if(pageControl.currentPage == 3){
            UIView.animateWithDuration(0.5, animations:{ ()-> Void in
            self.tLastScreenBtn.alpha = 1;
            })
        }
        else if (scrollView.contentOffset.x > 800){
            pageControl.hidden = true
            tLastScreenBtn.hidden = false
        }
        else{
            self.pageControl.hidden = false
        }
        
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
