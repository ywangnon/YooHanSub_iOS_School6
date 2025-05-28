//
//  ViewController.swift
//  MapTest
//
//  Created by Hansub Yoo on 2018. 4. 6..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var coordinateLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moveToInitialCoordinate(())
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("권한 필요")
        default:
            locationManager.requestLocation()
        }
    }
    
    @IBAction private func startUpdatingLocation(_ sender: Any) {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("권한 필요")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
        }
    }
    
    @IBAction private func stopUpdatingLocation(_ sender: Any) {
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction private func updateCurrentLocation(_ sender: Any) {
        locationManager.requestLocation()
        let coordinate = mapView.centerCoordinate
        coordinateLabel.text = String(format: "위도: %2.4f, 경도 %2.4f", arguments: [coordinate.latitude, coordinate.longitude])
    }
    
    @IBAction private func addAnnoAtCenter(_ sender: Any) {
        let annotation = MKPointAnnotation()
        annotation.title = "MapCenter"
        annotation.coordinate = mapView.centerCoordinate
        mapView.addAnnotation(annotation)
        coordinateLabel.text = "Annotation 추가"
    }
    
    @IBAction private func addAnnoAtNamsan(_ sender: Any) {
        let namsan = MKPointAnnotation()
        namsan.title = "남산"
        namsan.subtitle = "남산타워"
        namsan.coordinate = CLLocationCoordinate2D(latitude: 37.5514, longitude: 126.9880)
        mapView.addAnnotation(namsan)
        coordinateLabel.text = "Annotation 남산 추가"
    }
    
    @IBAction private func removeAllAnnotations(_ sender: Any) {
        mapView.removeAnnotations(mapView.annotations)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction private func moveToInitialCoordinate(_ sender: Any) {
        // 광화문 세종대왕
        let center = CLLocationCoordinate2D(latitude: 37.572851, longitude: 126.976881)
        // 위도 111 km / 경도 : 위도에 따라 111 ~ 0 km
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(center, span)
        mapView.setRegion(region, animated: true)
    }
}


// MARK: - CLLocationManager

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let coordinate = location.coordinate
        coordinateLabel.text = String(format: "위도: %2.4f, 경도 %2.4f", arguments: [coordinate.latitude, coordinate.longitude])
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Authorized")
        default:
            print("Unauthorized")
        }
    }
}
