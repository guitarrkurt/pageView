//
//  ViewController.swift
//  pruebaPageView
//
//  Created by guitarrkurt on 25/10/15.
//  Copyright (c) 2015 guitarrkurt. All rights reserved.
// TUTORIAL: www.youtube.com/watch?v=8bltsDG2ENQ

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageTitles = NSArray(objects: "Algo1", "Algo2", "Algo3")
        self.pageImages = NSArray(objects: "app2-02", "app2-03", "app2-04")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        
        var startVC = self.viewControllerAtIndex(0) as ContentViewController
        
        var viewControllers = NSArray(object: startVC)
        
        
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
        
        
        
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60)
        
        
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)

        
    }

    @IBAction func restartAction(sender: AnyObject) {
        
        var startVC = self.viewControllerAtIndex(0) as ContentViewController
        
        var viewControllers = NSArray(object: startVC)
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
    }

    
    func viewControllerAtIndex(index: Int) -> ContentViewController{
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            
            return ContentViewController()
            
        }
        
        
        
        var vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        
        
        vc.imageFile = self.pageImages[index]as! String
        
        vc.titleText = self.pageTitles[index]as! String
        
        vc.pageIndex = index
        
        
        return vc
        
        
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
        
    {

        var vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int

        if (index == 0 || index == NSNotFound)
            
        {
            
            return nil

        }

        index--
        
        return self.viewControllerAtIndex(index)

    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
    
        
        var vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound){
            return nil
        }
        
        index++
        
        if (index == self.pageTitles.count){
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
   func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

