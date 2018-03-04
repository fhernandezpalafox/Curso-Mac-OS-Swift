//
//  ViewController.swift
//  AppEjercicio11
//
//  Created by Felipe Hernandez on 27/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa
import MapKit

class ViewController: NSViewController {

    @IBOutlet weak var mapa: MKMapView!
    
    @IBAction func cambiarTipoMapa(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegment {
        case 0:
            mapa.mapType = MKMapType.standard // = .standard
        case 1:
            mapa.mapType = .satellite
        case 2:
            mapa.mapType = .hybrid
        default:
            break
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let coordenada: CLLocationCoordinate2D = CLLocationCoordinate2DMake(21.152676, -101.711698)
        let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(coordenada, 2000, 2000)
        let anotacion = MKPointAnnotation()
        anotacion.title = "De La Salle Bajio"
        anotacion.coordinate = coordenada
        
        mapa.region = region
        mapa.addAnnotation(anotacion)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

