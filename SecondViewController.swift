//
//  SecondViewController.swift
//  rower1
//
//  Created by Marcin Kulwicki on 26/12/16.
//  Copyright © 2016 Marcin Kulwicki. All rights reserved.
//

import UIKit
import RebekkaTouch


var path = "/Users/marcinkulwicki/Desktop/rower1/Trasy/Trasa_0.txt"
var path2 = "/Users/marcinkulwicki/Desktop/rower1/Trasy/Trasa_1.txt"
var nrTrasy = 1

class SecondViewController:  UIViewController  {

    
    
    //Obsluga plikow
    let fileManager = NSFileManager.defaultManager()
    
    
    //Koniec obslugi
    
    
    var iAboutTrack = "SzuterOff+NatS+GorEn+TurDis+MiejDis+KolDis"
    var poziomTrud = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    

    
    
    
    @IBOutlet weak var myLPiK: UIButton!
    @IBOutlet weak var myTPiK: UIButton!
    @IBOutlet weak var myTNP: UIButton!
    @IBOutlet weak var myCT: UIButton!
    @IBOutlet weak var myBZT: UIButton!
    @IBOutlet weak var myPrefK: UIButton!
    @IBOutlet weak var myPrefM: UIButton!
    @IBOutlet weak var myPrefT: UIButton!
    @IBOutlet weak var myPrefG: UIButton!
    @IBOutlet weak var myNatM: UIButton!
    @IBOutlet weak var myNatS: UIButton!
    @IBOutlet weak var myNatD: UIButton!
    @IBOutlet weak var mySzuterInf: UISwitch!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //    let newVC: SecondViewController = segue.destinationViewController as! SecondViewController
    //}
    
    @IBAction func switchSzuter(sender: AnyObject) {
        if mySzuterInf.on{
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("SzuterOff", withString: "SzuterOn")
            
        }
        else{
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("SzuterOn", withString: "SzuterOff")
        }
    }
    //Nasteznie ruchu
    
    @IBAction func touchDownD(sender: AnyObject) {
        myNatD.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myNatS.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myNatM.setTitleColor(UIColor.grayColor(), forState: .Normal)
        iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("NatS", withString: "NatD")
        iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("NatM", withString: "NatD")
    }
    @IBAction func touchDownS(sender: AnyObject) {
        myNatD.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myNatS.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myNatM.setTitleColor(UIColor.grayColor(), forState: .Normal)
        iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("NatD", withString: "NatS")
        iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("NatM", withString: "NatS")
    }
    @IBAction func touchDownM(sender: AnyObject) {
        myNatD.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myNatS.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myNatM.setTitleColor(UIColor.blueColor(), forState: .Normal)
        iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("NatD", withString: "NatM")
        iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("NatS", withString: "NatM")
    }
    //Preferowany rodzaj roweru
    
    @IBAction func touchDownG(sender: AnyObject) {
        if iAboutTrack.containsString("GorDis") == true{
            myPrefG.setTitleColor(UIColor.blueColor(), forState: .Normal)
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("GorDis", withString: "GorEn")
        }
        else
        {
            myPrefG.setTitleColor(UIColor.grayColor(), forState: .Normal)
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("GorEn", withString: "GorDis")
        }
    }
    @IBAction func touchDownT(sender: AnyObject) {
        if iAboutTrack.containsString("TurDis") == true{
            myPrefT.setTitleColor(UIColor.blueColor(), forState: .Normal)
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("TurDis", withString: "TurEn")
        }
        else
        {
            myPrefT.setTitleColor(UIColor.grayColor(), forState: .Normal)
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("TurEn", withString: "TurDis")
        }
    }
    
    @IBAction func touchDownMi(sender: AnyObject) {
        if iAboutTrack.containsString("MiejDis") == true{
            myPrefM.setTitleColor(UIColor.blueColor(), forState: .Normal)
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("MiejDis", withString: "MiejEn")
        }
        else
        {
            myPrefM.setTitleColor(UIColor.grayColor(), forState: .Normal)
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("MiejEn", withString: "MiejDis")
        }
    }
    
    @IBAction func touchDownK(sender: AnyObject) {
        if iAboutTrack.containsString("KolDis") == true{
            myPrefK.setTitleColor(UIColor.blueColor(), forState: .Normal)
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("KolDis", withString: "KolEn")
        }
        else
        {
            myPrefK.setTitleColor(UIColor.grayColor(), forState: .Normal)
            iAboutTrack = iAboutTrack.stringByReplacingOccurrencesOfString("KolEn", withString: "KolDis")
        }
    }
   // Poziom trudnosci
    @IBAction func touchDownBZT(sender: AnyObject) {
        myBZT.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myCT.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myTNP.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myTPiK.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myLPiK.setTitleColor(UIColor.grayColor(), forState: .Normal)
        poziomTrud = 1
    }
    @IBAction func touchDownCT(sender: AnyObject) {
        myBZT.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myCT.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myTNP.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myTPiK.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myLPiK.setTitleColor(UIColor.grayColor(), forState: .Normal)
        poziomTrud = 2
    }
    @IBAction func touchDownTNP(sender: AnyObject) {
        myBZT.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myCT.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myTNP.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myTPiK.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myLPiK.setTitleColor(UIColor.grayColor(), forState: .Normal)
        poziomTrud = 3
    }
    @IBAction func touchDownTPiK(sender: AnyObject) {
        myBZT.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myCT.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myTNP.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myTPiK.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myLPiK.setTitleColor(UIColor.grayColor(), forState: .Normal)
        poziomTrud = 4
    }
    @IBAction func touchDownLPiK(sender: AnyObject) {
        myBZT.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myCT.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myTNP.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myTPiK.setTitleColor(UIColor.grayColor(), forState: .Normal)
        myLPiK.setTitleColor(UIColor.blueColor(), forState: .Normal)
        poziomTrud = 5
    }
    
//Zapisywanie trasy
    
    
    @IBAction func touchDownZapisz(sender: AnyObject) {
    switch (poziomTrud)
    {
    case 1:
        iAboutTrack = iAboutTrack + "+PozTrudBZT+Separator\n"
        break
    
    case 2:
        iAboutTrack = iAboutTrack + "+PozTrudCT+Separator\n"
        break
        
    case 3:
        iAboutTrack = iAboutTrack + "+PozTrudTNP+Separator\n"
        break
        
    case 4:
        iAboutTrack = iAboutTrack + "+PozTrudTPiK+Separator\n"
        break
        
    case 5:
        iAboutTrack = iAboutTrack + "+PozTrudLPiK+Separator\n"
        break
    
    default:
        
        break
        }
        //Zapisywanie
        let currentPath = fileManager.currentDirectoryPath
        let dirPath = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let docsDir = dirPath[0].path
        let docsURL = dirPath[0]
        
        
    
        
        
        let baseUrl = NSURL (string: "/Users/marcinkulwicki/Desktop/rower1/Trasy/Trasa_0.txt")
        let ftpUrl = NSURL (string: "ftp://192.168.2.28:21/Trasa_0.txt")
        let stream = CFWriteStreamCreateWithFTPURL(nil, ftpUrl!).takeUnretainedValue()
        var cfstatus = CFWriteStreamOpen(stream) as Bool
        if cfstatus == false {
            print("nie polaczylo ftp")
        }
        print(cfstatus)
        
        
        
        do{
            try iAboutTrack.writeToURL(ftpUrl!, atomically: false, encoding: NSUTF8StringEncoding)
        }catch let error as NSError {
            print("Wrong with save to file URL")
        }
        //print("conceted")
        
        //let cfRead = CFReadStreamCreateWithFile(nil, baseUrl!)
        //let cfWrite = CFWriteStreamCreateWithFile(nil, ftpUrl!)
        
        ////var conf = NSURLSession()
        //conf.downloadTaskWithURL(ftpUrl!)
        //print(conf)
        
            while fileManager.fileExistsAtPath(path) == true
            {
                path = path.stringByReplacingOccurrencesOfString(path, withString: path2)
                var myString1 = String(nrTrasy)
                var myString2 = String(nrTrasy + 1)
                path2 = path2.stringByReplacingOccurrencesOfString("Trasa_" + myString1, withString: "Trasa_" + myString2)
                nrTrasy = nrTrasy + 1
            }
        
        
        do {
            iAboutTrack = iAboutTrack + vectra.d2
            try iAboutTrack.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
        }catch let error as NSError {
            print("Wrong with save to file")
        }
        //Koniec Zapisywania
        
        
    self.performSegueWithIdentifier("unwindToViewController", sender: self)
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
