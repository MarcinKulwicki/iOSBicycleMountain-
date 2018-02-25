//
//  PopUpViewController.swift
//  rower1
//
//  Created by Marcin Kulwicki on 28/01/17.
//  Copyright © 2017 Marcin Kulwicki. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    let fileManager = NSFileManager.defaultManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func toutchDownZamknij(sender: AnyObject) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func touchDownSchronisko(sender: AnyObject) {
        let path = "/Users/marcinkulwicki/Desktop/rower1/Trasy/schronisko.txt"
        do{
        var czytaj = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            czytaj = (czytaj as String) + koordynaty + "+Separator"
            try czytaj.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
        }catch let error as NSError{
            print("wczytanie i dopisanie schroniska nie dziala")
        }
        self.view.removeFromSuperview()
    }
    @IBAction func touchDownPunktMed(sender: AnyObject) {
        let path = "/Users/marcinkulwicki/Desktop/rower1/Trasy/punktmed.txt"
        do{
            var czytaj = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            czytaj = (czytaj as String) + koordynaty + "+Separator"
            try czytaj.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
        }catch let error as NSError{
            print("wczytanie i dopisanie punktu med nie dziala")
        }
        
        self.view.removeFromSuperview()
    }
    @IBAction func touchDownNieprzejezdne(sender: AnyObject) {
        let path = "/Users/marcinkulwicki/Desktop/rower1/Trasy/nieprzejezdne.txt"
        do{
            var czytaj = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            czytaj = (czytaj as String) + koordynaty + "+Separator"
            try czytaj.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
        }catch let error as NSError{
            print("wczytanie i dopisanie nieprzejezdnych fragmentow nie dziala")
        }
        
        
        
        self.view.removeFromSuperview()
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
