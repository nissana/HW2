//
//  introViewController.swift
//  HW2_Carousel
//
//  Created by Nissana Akranavaseri on 2/13/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import UIKit

class intViewController: UIViewController, UIScrollViewDelegate  {
//    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var introImageView: UIImageView!
//    
//    @IBOutlet weak var tile1View: UIImageView!
//    @IBOutlet weak var tile2View: UIImageView!
//    @IBOutlet weak var tile3View: UIImageView!
//    @IBOutlet weak var tile4View: UIImageView!
//    @IBOutlet weak var tile5View: UIImageView!
//    @IBOutlet weak var tile6View: UIImageView!
    
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    var tiles: [Float]
    
    var tx : Float
    var ty : Float
    var scale : Float
    var rotation : Float
    
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
    
    //    func scrollViewDidScroll(scrollView: UIScrollView!) {
    //        var offset = Float(scrollView.contentOffset.y)
    //
    //        //content offset: 0->568
    //        //x offset: -30->0
    //        //y offset: -285->0
    //
    //        var tx = convertValue(offset, 0, 568, -30, 0)
    //        var ty = convertValue(offset, 0, 568, -285, 0)
    //
    //        var scale = convertValue(offset, 0, 568, 1, 1 )
    //        var rotation = convertValue(offset, 0, 568, -10, 0)
    //
    //        //transation = x, y
    //        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
    //        //scale
    //        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
    //        //rotate
    //        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation)*M_PI/180))
    //
    //        //println("content offset: \(offset)")
    //    }
    
    func tilesConvertedValues{
        
        for index in xOffsets{
            
            tx = convertValue(offset, 0, 568, xOffsets(index), 0)
            ty = convertValue(offset, 0, 568, yOffsets(index), 0)
            scale = convertValue(offset, 0, 568, scales(index), 1 )
            rotation = convertValue(offset, 0, 568, rotations(index), 0)
            
            tile[index] =
                
                println("Tile \(index + 1): \(tx) \(ty) \(scale) \(rotation) ")
            
            pixTransform(tx, ty, scale, rotation)
            
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset = Float(scrollView.contentOffset.y)
        
        //content offset: 0->568
        //x offset: -30->0
        //y offset: -285->0
        
        for tile in xOffsets{
            tx = convertValue(offset, 0, 568, xOffsets(index), 0)
            ty = convertValue(offset, 0, 568, yOffsets(index), 0)
            scale = convertValue(offset, 0, 568, scales(index), 1 )
            rotation = convertValue(offset, 0, 568, rotations(index), 0)
            
            println("Tile \(index + 1): \(tx) \(ty) \(scale) \(rotation) ")
            
            pixTransform(tx, ty, scale, rotation)
            
        }
        
        //        tx = convertValue(offset, 0, 568, -30, 0)
        //        ty = convertValue(offset, 0, 568, -285, 0)
        //        scale = convertValue(offset, 0, 568, 1, 1 )
        //        rotation = convertValue(offset, 0, 568, -10, 0)
        
        //println("content offset: \(offset)")
    }
    
    func pixTransform (tx:Float, ty:Float, scale:Float, rotation:Float){
        //transation = x, y
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        //scale
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
        //rotate
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation)*M_PI/180))
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
