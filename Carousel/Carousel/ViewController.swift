//
//  ViewController.swift
//  Carousel
//
//  Created by Seab on 12/28/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class ProjectorPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        view.backgroundColor = UIColor.white
        
        let frameViewController = FrameViewController()
        frameViewController.imageName = imageNames.first
        let viewControllers = [frameViewController]
        setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
    }
    
    let imageNames = ["scenery", "teddy", "thinker"]
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentImageName = (viewController as! FrameViewController).imageName
        let currentIndex = imageNames.index(of: currentImageName!)
        
        if currentIndex! < imageNames.count - 1 {
            let frameViewController = FrameViewController()
            frameViewController.imageName = imageNames[currentIndex! + 1]
            return frameViewController
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentImageName = (viewController as! FrameViewController).imageName
        let currentIndex = imageNames.index(of: currentImageName!)
        
        if currentIndex! > 0 {
            let frameViewController = FrameViewController()
            frameViewController.imageName = imageNames[currentIndex! - 1]
            return frameViewController
        }
        return nil
    }
}
class FrameViewController: UIViewController {
    
    var imageName: String? {
        didSet {
            imageView.image = UIImage(named: imageName!)
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = UIColor.black
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(imageView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

