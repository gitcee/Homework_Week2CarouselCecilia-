//
//  myTutorialViewController.swift
//  CarouselCecilia
//
//  Created by Chang, Cecilia on 11/8/15.
//  Copyright © 2015 Cee. All rights reserved.
//

import UIKit

class myTutorialViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var backupButton: UIImageView!
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
        
        var page : Int = Int(round(scrollView.contentOffset.x/320))

        pageView.currentPage = page
        
        pageView.hidden = false
        
        if page == 3 {
            pageView.hidden = true
            
            backupButton.alpha = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        
        backupButton.alpha = 0
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
