//
//  ViewController.swift
//  Bai2b
//
//  Created by Cntt20 on 7/5/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var urlImage1: UITextField!
    @IBOutlet weak var urlImage2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //
    func fetchImage1(_url : String)
    {
        
        let url = URL(string: _url)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let downloadedImage = UIImage(data: data!) {
                    self.image1.image = downloadedImage
                    
                }
            })
            
        }).resume()
        
    }
    func fetchImage2(_url : String)
    {
        
        let url = URL(string: _url)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let downloadedImage = UIImage(data: data!) {
                    self.image2.image = downloadedImage
                    
                }
            })
            
        }).resume()
        
    }
    //
    @IBAction func loadImage(_ sender: Any) {
        if urlImage1.text != "" || urlImage1.text != "" {
            fetchImage1(_url: urlImage1.text!)
            fetchImage2(_url: urlImage2.text!)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Please insert your image url!!!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

