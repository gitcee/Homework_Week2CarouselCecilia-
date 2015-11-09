//
//  IntroViewController.swift
//  CarouselCecilia
//
//  Created by Chang, Cecilia on 11/7/15.
//  Copyright © 2015 Cee. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
            scrollView.delegate = self

        
        scrollView.contentSize = CGSize(width: 320, height: 1136)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        func scrollViewDidScroll(scrollView: UIScrollView) {
            // This method is called as the user scrolls
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
