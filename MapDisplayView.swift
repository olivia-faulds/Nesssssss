//
//  MapDisplayView.swift
//  Ness Botanic Gardens App
//
//  Created by Olivia Faulds on 03/04/2022.
//

import SwiftUI
import MapKit
import CoreLocation


let map = MKMapView()


struct MapDisplayView: UIViewRepresentable {
func makeUIView(context: Context) -> MKMapView{
    @State var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53.272271, longitude: -3.044379), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
   map.region = location
   map.delegate = context.coordinator
   map.showsUserLocation = true
    //addOverlay()
    addAnnotations()
   
   return map

}
    
    // function that adds pins to the map with relevant infomation
    func addAnnotations(){
        // array to hold all coordinates of important places in the park
        let coords = [  CLLocationCoordinate2D(latitude: 53.27417, longitude: -3.04405), CLLocationCoordinate2D(latitude: 53.272057, longitude: -3.043731), CLLocationCoordinate2D(latitude: 53.270263, longitude: -3.043095), CLLocationCoordinate2D(latitude: 53.271159, longitude: -3.042296), CLLocationCoordinate2D(latitude: 53.272233, longitude: -3.046131), CLLocationCoordinate2D(latitude: 53.27154, longitude: -3.042687), CLLocationCoordinate2D(latitude: 53.273368, longitude: -3.044382), CLLocationCoordinate2D(latitude: 53.272797, longitude: -3.044747), CLLocationCoordinate2D(latitude: 53.273015, longitude: -3.043567),
            CLLocationCoordinate2D(latitude: 53.273913, longitude: -3.043581),
            CLLocationCoordinate2D(latitude: 53.274265, longitude: -3.044941),
            CLLocationCoordinate2D(latitude: 53.272182, longitude: -3.042320),
            CLLocationCoordinate2D(latitude: 53.271077, longitude: -3.048479),
            CLLocationCoordinate2D(latitude: 53.27254777515376, longitude: -3.04171526703762),
            CLLocationCoordinate2D(latitude: 53.27198623191509, longitude: -3.04444364542983),
            CLLocationCoordinate2D(latitude: 53.271966, longitude:  -3.044981), CLLocationCoordinate2D(latitude: 53.270030, longitude: -3.047339), CLLocationCoordinate2D(latitude: 53.27241422643997, longitude: -3.043035364418998),
        CLLocationCoordinate2D(latitude: 53.272766863712135,  longitude: -3.046318680461002),
        CLLocationCoordinate2D(latitude: 53.27332284565514, longitude: -3.0454840824188505),
        CLLocationCoordinate2D(latitude: 53.27262587357994, longitude: -3.0431842211864217)];
    
        
        // array to hold pin titles
        let title = ["Pine Woods", "Old House Area","Water Garden", "Rock Garden", "Azalea Walk", "Terraces", "Potager Area", "Herbaceous Area", "Ness Botanische","Pinewood and Rhododendron Boarder", "Woodland Garden", "Car Park", "Wildflower Meadows", "Bus Stop", "Mediterranean Garden", "Picnic Lawn", "The Spinney", "Cafe", "Childrens Play", "Coach House/Education Centre", "Visitor Centre"]
        // array to hold pin descriptions
        let description = ["The pinewood has a number of paths to investigate and is also home to many fine examples of rhododendrons.", "Mickwell Brow was built in 1898 as the first phase of Arthur Bulley's vision for what is now Ness botanic Gardens.", "This area was originally created for use as a research project in the 1960's before being planted with a stunning range of trees which all have fabulous autumn colour and beautiful winter barks.", "One of the original features of Ness, the Rock Garden was orginally created by A.K Bulley on the site of an old clay marl pit, to house his ever increasing collection of alpines.", "So called for its colour displays of Azaleas in the Spring, the area also has stunning snowdrop displays in February. Fabulous birches and rowans, part of the botanical collections surround the children's play area.", "The sun baked terraces allows us to grow slightly tender plants outdoors all year round and provides fantastic views of the surrounding Gardens.", "The sun baked terraces allows us to grow slightly tender plants outdoors all year round and provides fantastic views of the surrounding Gardens.", "Another original area of Ness although the layout has changed over the years. It now houses 120 metres of herbaceous borders which look beautiful from May to February.", "Designed in 2009 by Chris Beardshaw and exhibited at RHS Tatton Show where it won Gold and Best in Show.  It celebrates the botanical research at Ness and the pleasure afforded to our visitors.", "", "", "", "", "Here you will find the closest bus stop to the park which runs local services.", "", "", "", "Here you will find Ness Botanic Gardens own cafe with locally sorced food and ingredients.", "Here you will find a childrens play area", "", "Here you will find our visitor centre, please find us here if you have any questions/enquiries about Ness Botanic Gardens"]
        
        
    // for loop that adds all pins to map
        var x = 0
            for coord in coords{
                let anno = MKPointAnnotation();
                anno.coordinate = coord;
                anno.title = title[x]
                anno.subtitle = description[x]
                map.addAnnotation(anno);
                x = x+1
            
            }

        // Array that holds coordinates of all toilets at Ness botanic gardens
        let toiletCoords = [CLLocationCoordinate2D(latitude: 53.27213, longitude: -3.043327),
            CLLocationCoordinate2D(latitude: 53.273038, longitude: -3.046388)]
        
        // Loop to add all restrooms
            for coord in toiletCoords{
                let anno = MKPointAnnotation();
                anno.coordinate = coord;
                anno.title = "Restrooms"
                map.addAnnotation(anno);
            }
        
        //Array that holds coordinates of view points
        let viewPointCoords = [CLLocationCoordinate2D(latitude: 53.271914, longitude: -3.044026), CLLocationCoordinate2D(latitude: 53.269987, longitude: -3.045368), CLLocationCoordinate2D(latitude: 53.270599, longitude: -3.047535)]
        
        // Loop to add all restrooms
            for coord in viewPointCoords{
                let anno = MKPointAnnotation();
                anno.coordinate = coord;
                anno.title = "View Point"
                anno.subtitle = "Here you will find a great view point over the gardens"
                map.addAnnotation(anno);
            }
    }
    
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
        
    final class Coordinator: NSObject, MKMapViewDelegate{
        
        //Optional as the user can turn off loaction services for entire phone and therefore location cannot be used
        
        var parent: MapDisplayView
        
        init(_ parent: MapDisplayView){
            self.parent = parent
            
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
            
            if annotationView == nil{
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Annotation View")
                
            }

            
            if let title = annotation.title, title == "Car Park"{
                annotationView?.image = UIImage(systemName: "car")
            }else if let title = annotation.title, title == "Restrooms"{
                annotationView?.image = UIImage(named: "restroom")
                annotationView?.frame.size = CGSize(width: 20, height: 20)
                annotationView?.backgroundColor = UIColor(red: 42/255, green: 169/255, blue: 243/255, alpha: 1.0)
            }else if let title = annotation.title, title == "Cafe"{
                annotationView?.image = UIImage(systemName: "fork.knife.circle")
            }else if let title = annotation.title, title == "Childrens Play"{
                annotationView?.image = UIImage(named: "park")
                annotationView?.frame.size = CGSize(width: 20, height: 20)
            }else if let title = annotation.title, title == "Picnic Lawn"{
                annotationView?.image = UIImage(systemName: "fork.knife.circle")
            }else if let title = annotation.title, title == "Bus Stop"{
                annotationView?.image = UIImage(systemName: "bus")
            }else if let title = annotation.title, title == "Visitor Centre"{
                annotationView?.image = UIImage(systemName: "info.fill")
            }else if let title = annotation.title, title == "Coach House/Education Centre"{
                annotationView?.image = UIImage(systemName: "house")
            }else if let title = annotation.title, title == "View Point"{
                annotationView?.image = UIImage(systemName: "eye.circle")
            }else if let title = annotation.title, title == "Bus Stop"{
                annotationView?.image = UIImage(systemName: "bus")
            } else if let description = annotation.subtitle, description == ""{
                annotationView?.image = UIImage(systemName: "leaf")
            }else if annotation === mapView.userLocation{
                annotationView?.image =  UIImage(named: "bluedot")
                annotationView?.frame.size = CGSize(width: 20, height: 20)
            }else{
                annotationView?.image = UIImage(systemName: "leaf.fill")
    
         
         }
            
            
            let subtitleView = UILabel()
                subtitleView.font = subtitleView.font.withSize(12)
                subtitleView.numberOfLines = 0
                subtitleView.text = annotation.subtitle!
                annotationView!.detailCalloutAccessoryView = subtitleView
            
            annotationView?.canShowCallout = true
            
            
            return annotationView
            

        }
                 
    }
        
    }
    
    




        
    

struct MapDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        MapDisplayView()
    }
}

