//
//  MapOverlay.swift
//  Ness Botanic Gardens App
//
//  Created by Olivia Faulds on 01/05/2022.
//

/*import Foundation
import UIKit
import MapKit


class MapBounds {
  var name: String?

  var mid = CLLocationCoordinate2D()
  var topLeft = CLLocationCoordinate2D()
  var topRight = CLLocationCoordinate2D()
  var bottomLeft = CLLocationCoordinate2D()
  var bottomRight = CLLocationCoordinate2D()
  
  var overlayBoundingMapRect: MKMapRect?
}





class MapOverlay: NSObject, MKOverlay {
  var coordinate: CLLocationCoordinate2D
  var boundingMapRect: MKMapRect
    var overlayBoundingMapRect: MKMapRect {
      get {
        let topLeft = MKMapPointForCoordinate(overlayTopLeftCoordinate)
        let topRight = MKMapPointForCoordinate(overlayTopRightCoordinate)
        let bottomLeft = MKMapPointForCoordinate(overlayBottomLeftCoordinate)
          
        return MKMapRectMake(
          topLeft.x,
          topLeft.y,
          fabs(topLeft.x - topRight.x),
          fabs(topLeft.y - bottomLeft.y))
      }
    }
    

  init(park: MapBounds) {
      boundingMapRect = park.overlayBoundingMapRect?
    coordinate = park.mid
  }
}

class ParkMapOverlayView: MKOverlayRenderer {
  var overlayImage: UIImage
  
  init(overlay:MKOverlay, overlayImage:UIImage) {
    self.overlayImage = overlayImage
    super.init(overlay: overlay)
  }
  
  override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
    guard let imageReference = overlayImage.cgImage else { return }
    
    let rect = self.rect(for: overlay.boundingMapRect)
    context.scaleBy(x: 1.0, y: -1.0)
    context.translateBy(x: 0.0, y: -rect.size.height)
    context.draw(imageReference, in: rect)
  }
}
*/
