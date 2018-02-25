//
//  LoadViewController.swift
//  rower1
//
//  Created by Marcin Kulwicki on 20/01/17.
//  Copyright © 2017 Marcin Kulwicki. All rights reserved.
//

import UIKit

var iLoadTrack : String = "SzuterWsz+NatW+GorDis+TurDis+MiejDis+KolDis+WszEn"


class LoadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    let fileManager = NSFileManager.defaultManager()
    
    //outlety dla przycisków
    @IBOutlet weak var oTakSzutr: UIButton!
    @IBOutlet weak var oNieSzutr: UIButton!
    @IBOutlet weak var oWszystkieSzutr: UIButton!
    
    @IBOutlet weak var oMaleRuch: UIButton!
    @IBOutlet weak var oSrednieRuch: UIButton!
    
    @IBOutlet weak var oDuzeRuch: UIButton!
    @IBOutlet weak var oWszystkieRuch: UIButton!
    
    
    @IBOutlet weak var oGorRower: UIButton!
    @IBOutlet weak var oTurRower: UIButton!
    @IBOutlet weak var oMieRower: UIButton!
    @IBOutlet weak var oKolRower: UIButton!
    @IBOutlet weak var oWszRower: UIButton!
    
    //obsluga przycisków 
    
    //**************//Odcinki szutrowe na trasie?
    @IBAction func tDTakSzutr(sender: UIButton) {
        oTakSzutr.setTitleColor(UIColor.blueColor(), forState: .Normal)
        oNieSzutr.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oWszystkieSzutr.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("SzuterWsz", withString: "SzuterOn")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("SzuterOff", withString: "SzuterOn")
    }
    @IBAction func tDNieSzutr(sender: UIButton) {
        oTakSzutr.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oNieSzutr.setTitleColor(UIColor.blueColor(), forState: .Normal)
        oWszystkieSzutr.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("SzuterWsz", withString: "SzuterOff")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("SzuterOn", withString: "SzuterOff")
    }
    @IBAction func tDWszystkieSzutr(sender: UIButton) {
        oTakSzutr.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oNieSzutr.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oWszystkieSzutr.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("SzuterOn", withString: "SzuterWsz")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("SzuterOff", withString: "SzuterWsz")
    }
    //**************//Natezenie ruchu
    @IBAction func tDMaleRuch(sender: UIButton) {
        oMaleRuch.setTitleColor(UIColor.blueColor(), forState: .Normal)
        oSrednieRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oDuzeRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oWszystkieRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatS", withString: "NatM")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatD", withString: "NatM")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatW", withString: "NatM")
    }
    @IBAction func tDSrednieRuch(sender: UIButton) {
        oMaleRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oSrednieRuch.setTitleColor(UIColor.blueColor(), forState: .Normal)
        oDuzeRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oWszystkieRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatM", withString: "NatS")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatD", withString: "NatS")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatW", withString: "NatS")
    }
    @IBAction func tDDuzeRuch(sender: UIButton) {
        oMaleRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oSrednieRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oDuzeRuch.setTitleColor(UIColor.blueColor(), forState: .Normal)
        oWszystkieRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatM", withString: "NatD")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatS", withString: "NatD")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatW", withString: "NatD")
    }
    @IBAction func tDWszystkieRuch(sender: UIButton) {
        oMaleRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oSrednieRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oDuzeRuch.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oWszystkieRuch.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatM", withString: "NatW")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatS", withString: "NatW")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("NatD", withString: "NatW")    }
    //**************//Rodzaj roweru
    @IBAction func tDGorRower(sender: UIButton) {
        if oGorRower.currentTitleColor == UIColor.blueColor(){
            oGorRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        else{
            oGorRower.setTitleColor(UIColor.blueColor(), forState: .Normal)
        }
        oWszRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
    
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("GorDis", withString: "GorEn")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("WszEn", withString: "WszDis")
    }
    
    
    @IBAction func tDTurRower(sender: UIButton) {
        if oTurRower.currentTitleColor == UIColor.blueColor(){
            oTurRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        else{
            oTurRower.setTitleColor(UIColor.blueColor(), forState: .Normal)
        }
        oWszRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("TurDis", withString: "TurEn")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("WszEn", withString: "WszDis")
    }
    @IBAction func tDMieRower(sender: UIButton) {
        if oMieRower.currentTitleColor == UIColor.blueColor(){
            oMieRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        else{
            oMieRower.setTitleColor(UIColor.blueColor(), forState: .Normal)
        }
        oWszRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("MiejDis", withString: "MiejEn")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("WszEn", withString: "WszDis")
    }
    @IBAction func tDKolRower(sender: UIButton) {
        if oKolRower.currentTitleColor == UIColor.blueColor(){
            oKolRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        else{
            oKolRower.setTitleColor(UIColor.blueColor(), forState: .Normal)
        }
        oWszRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("KolDis", withString: "KolEn")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("WszEn", withString: "WszDis")
    }
    @IBAction func tDWszRower(sender: UIButton) {
        if oWszRower.currentTitleColor == UIColor.grayColor(){
            oWszRower.setTitleColor(UIColor.blueColor(), forState: .Normal)
        }
        else{
            oWszRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        oGorRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oTurRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oMieRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        oKolRower.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("GorEn", withString: "GorDis")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("TurEn", withString: "TurDis")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("MiejEn", withString: "MiejDis")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("KolEn", withString: "KolDis")
        iLoadTrack = iLoadTrack.stringByReplacingOccurrencesOfString("WszDis", withString: "WszEn")
    }
    @IBAction func touchDownWczytaj(sender: AnyObject) {
        
        var i = 0
        var iSearchTrack : String = ""
        
        var path = "/Users/marcinkulwicki/Desktop/rower1/Trasy/Trasa_0.txt"
        while fileManager.fileExistsAtPath(path) == true{
            path = path.stringByReplacingOccurrencesOfString("Trasa_" + String(i), withString: "Trasa_" + String(i+1))
            i = i + 1 //daje liczbe plikow        
        }
        
        
        
        print(i)
        path = "/Users/marcinkulwicki/Desktop/rower1/Trasy/Trasa_0.txt"
        for var j = 0 ; j < i ; j = j + 1{
            do{
            print("Plik nr: ")
            print(j)
        let czytaj = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                var czytaj_string = czytaj.componentsSeparatedByString("+Separator") // dzieli stringa na INFO i GPS
            
                let ustawienieTrasy = czytaj_string[0].componentsSeparatedByString("+") //dzieli informacje o trasie
                let ustawienieWyszukiwania = iLoadTrack.componentsSeparatedByString("+") //dzieli informacje o wyszukiwaniu
                
                //Informacje do wyszukiwania (paleta ifów)
                
                var pom = 0
                if ustawienieWyszukiwania[0] == "SzuterWsz" || ustawienieTrasy[0] == ustawienieWyszukiwania[0]{
                    if ustawienieWyszukiwania[1] == "NatW" || ustawienieTrasy[1] == ustawienieWyszukiwania[1]{
                        
                        if ustawienieWyszukiwania[6] == "WszEn"{pom = 1 }
                        if ustawienieWyszukiwania[2] == "GorEn" && ustawienieWyszukiwania[2] == ustawienieTrasy[2]{ pom = 1 }
                        if ustawienieWyszukiwania[3] == "TurEn" && ustawienieWyszukiwania[3] == ustawienieTrasy[3]{ pom = 1 }
                        if ustawienieWyszukiwania[4] == "MiejEn" && ustawienieWyszukiwania[4] == ustawienieTrasy[4]{ pom = 1 }
                        if ustawienieWyszukiwania[5] == "KolEn" && ustawienieWyszukiwania[5] == ustawienieTrasy[5]{ pom = 1 }
                            
                            
                        if pom == 1 {
                        iSearchTrack = iSearchTrack + path + "+Separator"
                            }
                        }}
                
                
                
                path = path.stringByReplacingOccurrencesOfString("Trasa_" + String(j), withString: "Trasa_" + String(j+1))
        }catch let error as NSError{
            print("wczytanie sie nie udalo")
        }
        }
        do{
            try iSearchTrack.writeToFile("/Users/marcinkulwicki/Desktop/rower1/Trasy/ust.txt", atomically: false, encoding: NSUTF8StringEncoding)
        }catch let error as NSError {
            print("nie zapisalo do ust")
        }
    }
}
