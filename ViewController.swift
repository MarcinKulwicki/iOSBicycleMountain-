//
//  ViewController.swift
//  rower1
//
//  Created by Marcin Kulwicki on 29/11/16.
//  Copyright © 2016 Marcin Kulwicki. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

struct trasa {
    
    var d2 : String = ""
    var probka = 0
    var nr_track = 1
    var d1 : String = "Hello"
    
}

var koordynaty : String = ""
var vectra = trasa()

class ViewController: UIViewController , CLLocationManagerDelegate , MKMapViewDelegate {

    
    
    
    @IBOutlet weak var theMap: MKMapView!
    @IBOutlet weak var theLabel: UILabel!
    
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    var saveTrack = 0
    var line_idx = 0
    var spanX = 0.011
    var spanY = 0.011
    
    //(d1: (lati), d2: (latitude: 0, longtitude:0), probka: 1, nr_track: 1)
    
    //fukncja umożliwia powrót
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        theMap.delegate = self
        theMap.showsUserLocation = true
        
        //gesty
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
        
        theMap.addGestureRecognizer(gestureRecognizer)
        
    }
    func handleTap (gestureReconizer: UILongPressGestureRecognizer){
        let location = gestureReconizer.locationInView(theMap)
        let coordinate = theMap.convertPoint(location, toCoordinateFromView: theMap)
        koordynaty = String(coordinate.latitude) + "+" + String(coordinate.longitude)
        print(coordinate) //Sa kordynaty!
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("sbPopUpID") as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMoveToParentViewController(self)
        
        let annotation = ColorPointAnnotation(pinColor: UIColor.grayColor())
        
        annotation.coordinate = coordinate
        annotation.title = "Nowo dodany punkt"
        
        theMap.addAnnotation(annotation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        myLocations.append(locations[0])
        
        
        var newRegion = MKCoordinateRegion(center: theMap.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        
        theMap.setRegion (newRegion, animated: true)
        
        if(myLocations.count > 1){
            var sourceIndex = myLocations.count - 1
            var destinationIndex = myLocations.count - 2
            
            
            
            if saveTrack == 1 {
            let c1 = myLocations[sourceIndex].coordinate
            let c2 = myLocations[destinationIndex].coordinate
                vectra.d2 = vectra.d2 +
                    "lat: " + c1.latitude.description + " lon: " + c1.longitude.description  + "\n"
            var a = [c1 , c2]
                var b = [c1, c2]
                vectra.probka = vectra.probka + 1
            var polyline = MKPolyline(coordinates: &b, count: b.count)
                theMap.addOverlay(polyline)
            }
            else{
                theMap.removeOverlays(theMap.overlays)
                    }
        }
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
    @IBAction func button1(sender: AnyObject) {
        
        if line_idx == 0{
            
            line_idx = line_idx + 1
            buttonSave.accessibilityActivate()
            
            pokazPoi()
            
        }
        
    
        if saveTrack == 0 {
            saveTrack = 1
            sender.setTitle("STOP", forState: .Normal)
            
            
        }
        else if saveTrack == 1{
            saveTrack = 2
            sender.setTitle("Zapisz Trase", forState: .Normal)
            
        }
        else {
            saveTrack = 0
            sender.setTitle("START", forState: .Normal)
            
            buttonSave.accessibilityActivate()
            
            
        }
    }
    @IBOutlet weak var buttonSave: UIButton!
    
    var iStepperValue = 1.0
    @IBOutlet weak var outletPlusMinus: UIStepper!
    @IBAction func valueChangedPlusMinus(sender: AnyObject) {
  
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
        
        outletPlusMinus.value = 50
        
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
        
                var coordinate = myLocations[myLocations.count-1].coordinate
                coordinate.latitude = c1!
                coordinate.longitude = c2!
                
                let anno = MKPointAnnotation()
                anno
                
                if liczba_plikow == 0 {let annotation = ColorPointAnnotation(pinColor: UIColor.greenColor())
                
                annotation.coordinate = coordinate
                annotation.title = "Schronisko"
                
                    theMap.addAnnotation(annotation)}
                if liczba_plikow == 1 {let annotation = ColorPointAnnotation(pinColor: UIColor.redColor())
                    
                    annotation.coordinate = coordinate
                    annotation.title = "Punkt Medyczny"
                    
                    theMap.addAnnotation(annotation)}
                if liczba_plikow == 2 {let annotation = ColorPointAnnotation(pinColor: UIColor.blackColor())
                    
                    annotation.coordinate = coordinate
                    annotation.title = "Brak przejazdu"
                    
                    theMap.addAnnotation(annotation)}
            }
            
            
        }catch let error as NSError{
            print("wczytanie schronisk w ViewControler nie udalo sie")
        }
        ////////////***************/////////////
    
        }
    }
    
}
class ColorPointAnnotation: MKPointAnnotation{
    var pinColor: UIColor
    
    init(pinColor:UIColor){
        self.pinColor = pinColor
        super.init()
    }
}
