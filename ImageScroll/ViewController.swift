//
//  ViewController.swift
//  ImageScroll
//
//  Created by Alexander Ischenko on 19.07.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Variables
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .purple
        sv.delegate = self
        sv.contentSize = CGSize(width: view.frame.size.width, height: 1500)
        sv.scrollIndicatorInsets = UIEdgeInsets(top: 270 - view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
        return sv
    }()
    var imageView: UIImageView = {
        let image = UIImage(named: "bmw")
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        //MARK: - Frames
        
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 270)
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
}
        
    //MARK: - UIScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        var width = view.frame.width - offsetY * 2
        width = max(view.frame.width, width)
        imageView.frame = CGRect(x: min(0, offsetY), y: min(0, offsetY), width: width, height: 270 - offsetY)
        
        if offsetY < 0 {
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: imageView.frame.size.height - view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
        }
    }
}
