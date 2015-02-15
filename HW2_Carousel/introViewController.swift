//
//  introViewController.swift
//  HW2_Carousel
//
//  Created by Nissana Akranavaseri on 2/13/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import UIKit

class introViewController: UIViewController, UIScrollViewDelegate  {
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    var tx : Float!
    var ty : Float!
    var scale : Float!
    var rotation : Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.        
        scrollView.contentSize = introImageView.frame.size
        scrollView.delegate = self
             println(scrollView.contentSize)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset = Float(scrollView.contentOffset.y)

        //content offset: 0->568
        //x offset: -30->0
        //y offset: -285->0
        
        //var tx = convertValue(offset, 0, 568, -55, 0)
        //var ty = convertValue(offset, 0, 568, -305, 0)
        //var scale = convertValue(offset, 0, 568, 1, 1 )
        //var rotation = convertValue(offset, 0, 568, -10, 0)
        
        tx = convertValue(offset, 0, 568, -55, 0)
        ty = convertValue(offset, 0, 568, -305, 0)
        scale = convertValue(offset, 0, 568, 1, 1 )
        rotation = convertValue(offset, 0, 568, -10, 0)
        
        //transation = x, y
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        //scale
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
        //rotate
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation)*M_PI/180))
        
        //println("content offset: \(offset)")
        tx = convertValue(offset, 0, 568, 20, 0)
        ty = convertValue(offset, 0, 568, -260, 0)
        scale = convertValue(offset, 0, 568, 1.65, 1 )
        rotation = convertValue(offset, 0, 568, -10, 0)
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(scale), CGFloat(scale))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotation)*M_PI/180))
        
        tx = convertValue(offset, 0, 568, 36, 0)
        ty = convertValue(offset, 0, 568, -435, 0)
        scale = convertValue(offset, 0, 568, 1.7, 1 )
        rotation = convertValue(offset, 0, 568, 10, 0)
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(scale), CGFloat(scale))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotation)*M_PI/180))
        
        tx = convertValue(offset, 0, 568, 60, 0)
        ty = convertValue(offset, 0, 568, -418, 0)
        scale = convertValue(offset, 0, 568, 1.6, 1 )
        rotation = convertValue(offset, 0, 568, 10, 0)
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(scale), CGFloat(scale))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotation)*M_PI/180))
        
        tx = convertValue(offset, 0, 568, -120, 0)
        ty = convertValue(offset, 0, 568, -520, 0)
        scale = convertValue(offset, 0, 568, 1.65, 1 )
        rotation = convertValue(offset, 0, 568, 10, 0)
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(scale), CGFloat(scale))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotation)*M_PI/180))
        
        tx = convertValue(offset, 0, 568, -75, 0)
        ty = convertValue(offset, 0, 568, -505, 0)
        scale = convertValue(offset, 0, 568, 1.65, 1 )
        rotation = convertValue(offset, 0, 568, -10, 0)
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(scale), CGFloat(scale))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotation)*M_PI/180))
        
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
