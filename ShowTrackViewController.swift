//
//  ShowTrackViewController.swift
//  rower1
//
//  Created by Marcin Kulwicki on 23/01/17.
//  Copyright © 2017 Marcin Kulwicki. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit



class ShowTrackViewController: UIViewController , CLLocationManagerDelegate , MKMapViewDelegate {
    
    
    let fileManager = NSFileManager.defaultManager()
    
    @IBOutlet weak var obrazek: UIImageView!
    @IBOutlet weak var theMapLoad: MKMapView!
    
    var managerLoad:CLLocationManager!
    var myLocationsLoad: [CLLocation] = []
    var spanX = 0.2
    var spanY = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        managerLoad = CLLocationManager()
        managerLoad.delegate = self
        managerLoad.desiredAccuracy = kCLLocationAccuracyBest
        managerLoad.requestWhenInUseAuthorization()
        managerLoad.startUpdatingLocation()
        theMapLoad.delegate = self
        theMapLoad.showsUserLocation = true
        // Do any additional setup after loading the view.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        myLocationsLoad.append(locations[0])
        
        
        
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blueColor()
            polylineRenderer.lineWidth = 4
            return polylineRenderer
        }
        return nil
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            
            let colorPointAnnotation = annotation as! ColorPointAnnotation
            pinView?.pinTintColor = colorPointAnnotation.pinColor
        }
        else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var iStepperValue = 1.0
    
    @IBOutlet weak var outletPlusMinus: UIStepper!
    @IBAction func ValueChangedPlusMinus(sender: AnyObject) {
        
        iStepperValue = outletPlusMinus.value
        if outletPlusMinus.value > 50 {
            if spanX > 0.006{
                spanY = spanY - spanY/2.5
                spanX = spanX - spanX/2.5
            }
        }else{
            spanX = spanX + spanX/2
            spanY = spanY + spanY/2
        }
        
        let newRegion = MKCoordinateRegion(center: theMapLoad.centerCoordinate, span: MKCoordinateSpanMake(spanX, spanY))
        theMapLoad.setRegion(newRegion, animated: true)
        
        outletPlusMinus.value = 50
    }
    
    
    @IBOutlet weak var infoOTrasie: UILabel!
    var i = 0
    var jednowykonanie = 0
    @IBAction func touchDownWyswietl(sender: AnyObject) {
    
        
        if jednowykonanie == 0 {
            jednowykonanie = jednowykonanie + 1
            pokazPoi()
        }
        
        theMapLoad.removeOverlays(theMapLoad.overlays)
            
        
        do{
            let czytaj = try NSString(contentsOfFile: "/Users/marcinkulwicki/Desktop/rower1/Trasy/ust.txt", encoding: NSUTF8StringEncoding)
            let nazwyPlikow = czytaj.componentsSeparatedByString("+Separator")
            if nazwyPlikow.count == i{ i = 0
            }
            do{
                let czytajTrasa = try NSString(contentsOfFile: nazwyPlikow[i], encoding: NSUTF8StringEncoding)
                    var czytajTrasa_pom = czytajTrasa.componentsSeparatedByString("+Separator")
                
                
                                        var stringInformacji = "Na trasie nie wystepuja odcinki szutrowe, natezenie ruchu jest duze oraz mozna pokonywac ja na rowerach:"
                                        let valueToInf = czytajTrasa_pom[0].componentsSeparatedByString("+")
                                        if "SzuterOn" == valueToInf[0]{ stringInformacji = stringInformacji.stringByReplacingOccurrencesOfString(" nie", withString: "")}
                                        if "NatS" == valueToInf[1] {stringInformacji = stringInformacji.stringByReplacingOccurrencesOfString("duze", withString: "srednie")}
                                        if "NatM" == valueToInf[1] {stringInformacji = stringInformacji.stringByReplacingOccurrencesOfString("duze", withString: "male")}
                                        if "GorEn" == valueToInf[2] { stringInformacji = stringInformacji + "Gorskich "}
                                        if "TurEn" == valueToInf[3] { stringInformacji = stringInformacji + "Turystycznych "}
                                        if "MiejEn" == valueToInf[4] { stringInformacji = stringInformacji + "Miejskich "}
                                        if "KolEn" == valueToInf[5] { stringInformacji = stringInformacji + "Kolarskich "}
                                        infoOTrasie.text = stringInformacji
                
                                        if valueToInf[6] == "PozTrudBZT" { obrazek.image = UIImage(named: "proste.png")}
                                        if valueToInf[6] == "PozTrudCT" { obrazek.image = UIImage(named: "coraz to trudniejsza.png")}
                                        if valueToInf[6] == "PozTrudTPiK" { obrazek.image = UIImage(named: "wymagajace na poczatku i na koncu.png")}
                                        if valueToInf[6] == "PozTrudTNP" { obrazek.image = UIImage(named: "coraz to latwiejsza.png")}
                                        if valueToInf[6] == "PozTrudLPiK" { obrazek.image = UIImage(named: "wymagajace_w_srodku.png")}
                
                
                
                
                czytajTrasa_pom[1] = czytajTrasa_pom[1].stringByReplacingOccurrencesOfString("lat: ", withString: "\nlat: ")
                czytajTrasa_pom[1] = czytajTrasa_pom[1].stringByReplacingOccurrencesOfString(" lon: ", withString: "\n\nlat: ")
                
                let podzial = czytajTrasa_pom[1].componentsSeparatedByString("\n\nlat: ")
                
                //sa przygotowane wsp pora je wpisac do CLLocationCoordinate2D
                
                var c1 = myLocationsLoad[myLocationsLoad.count - 1].coordinate
                var c2 = myLocationsLoad[myLocationsLoad.count - 2].coordinate
                // tylko po to zeby zainicjowac zmienna
                
                
                for var ci = 1 ; ci < podzial.count - 2 ; ci = ci + 2 {
                    c1.latitude = (podzial[ci] as NSString).doubleValue
                    c1.longitude = (podzial[ci+1] as NSString).doubleValue
                    c2.latitude = (podzial[ci+2] as NSString).doubleValue
                    c2.longitude = (podzial[ci+3] as NSString).doubleValue
                    
                    var a = [c1 , c2]
                    
                    var polyline = MKPolyline(coordinates: &a, count: a.count)
                    theMapLoad.addOverlay(polyline)
                    
                }
                var newRegion = MKCoordinateRegion(center: c1, span: MKCoordinateSpanMake(spanX, spanY))
                theMapLoad.setRegion(newRegion, animated: true)
                
                
                
            }catch let error as NSError{
                infoOTrasie.text = "To juz wszystkie trasy, klikajac wyswietl pokaza sie te same trasy od nowa"
                print("nie wczytalo pliku Trasa")
            }
            
        }catch let error as NSError{
            print("nie wczytalo pliku ust")
        }
        
        i = i + 1
    }
    func pokazPoi(){
        
        var path = "/Users/marcinkulwicki/Desktop/rower1/Trasy/schronisko.txt"
        
        for var liczba_plikow = 0 ; liczba_plikow <= 2 ; liczba_plikow = liczba_plikow + 1{
            if liczba_plikow == 1{ path = "Users/marcinkulwicki/Desktop/rower1/Trasy/punktmed.txt" }
            if liczba_plikow == 2{ path = "Users/marcinkulwicki/Desktop/rower1/Trasy/nieprzejezdne.txt" }
            
            ////////////***************/////////////
            do{
                let czytaj = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                let czytaj_separator = czytaj.componentsSeparatedByString("+Separator")
                
                for var i = 0 ; i < czytaj_separator.endIndex - 1 ; i = i + 1{
                    
                    let czytaj_plus = czytaj_separator[i].componentsSeparatedByString("+")
                    let c1 = Double(czytaj_plus[0])
                    let c2 = Double(czytaj_plus[1])
                    
                    var coordinate = myLocationsLoad[myLocationsLoad.count-1].coordinate
                    coordinate.latitude = c1!
                    coordinate.longitude = c2!
                    
                    let anno = MKPointAnnotation()
                    anno
                    
                    if liczba_plikow == 0 {let annotation = ColorPointAnnotation(pinColor: UIColor.greenColor())
                        
                        annotation.coordinate = coordinate
                        annotation.title = "Schronisko"
                        
                        theMapLoad.addAnnotation(annotation)}
                    if liczba_plikow == 1 {let annotation = ColorPointAnnotation(pinColor: UIColor.redColor())
                        
                        annotation.coordinate = coordinate
                        annotation.title = "Punkt Medyczny"
                        
                        theMapLoad.addAnnotation(annotation)}
                    if liczba_plikow == 2 {let annotation = ColorPointAnnotation(pinColor: UIColor.blackColor())
                        
                        annotation.coordinate = coordinate
                        annotation.title = "Brak przejazdu"
                        
                        theMapLoad.addAnnotation(annotation)}
                }
                
                
            }catch let error as NSError{
                print("wczytanie schronisk w ViewControler nie udalo sie")
            }
            ////////////***************/////////////
            
        }
    }
    
    

}

