//
//  pointsOfInterest.swift
//  Ness Botanic Gardens App
//
//  Created by Olivia Faulds on 02/04/2022.
//

import Foundation
import MapKit


struct PointsOfInterest{
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    
}

struct InterestList{
    static let PofInterest = [
        PointsOfInterest(name: "Pine Woods", coordinates: CLLocationCoordinate2D(latitude: 53.27417    , longitude: -3.04405), description: "The pinewood has a number of paths to investigate and is also home to many fine examples of rhododendrons."),
        PointsOfInterest(name: "Old House Area", coordinates: CLLocationCoordinate2D(latitude: 53.272057, longitude: -3.043731), description: "Mickwell Brow was built in 1898 as the first phase of Arthur Bulley's vision for what is now Ness botanic Gardens.The images show both old and new views of the house."),
        PointsOfInterest(name: "Water Garden", coordinates: CLLocationCoordinate2D(latitude: 53.270263, longitude: -3.043095), description: "This area was originally created for use as a research project in the 1960's before being planted with a stunning range of trees which all have fabulous autumn colour and beautiful winter barks."),
        PointsOfInterest(name: "Rock Garden", coordinates: CLLocationCoordinate2D(latitude: 53.271159, longitude: -3.042296), description: "One of the original features of Ness, the Rock Garden was orginally created by A.K Bulley on the site of an old clay marl pit, to house his ever increasing collection of alpines."),
        PointsOfInterest(name: "Azalea Walk", coordinates: CLLocationCoordinate2D(latitude: 53.272233, longitude: -3.046131), description: "So called for its colour displays of Azaleas in the Spring, the area also has stunning snowdrop displays in February. Fabulous birches and rowans, part of the botanical collections surround the children's play area."),
        PointsOfInterest(name: "Terraces", coordinates: CLLocationCoordinate2D(latitude: 53.27154, longitude: -3.042687), description: "The sun baked terraces allows us to grow slightly tender plants outdoors all year round and provides fantastic views of the surrounding Gardens."),
        PointsOfInterest(name: "Potager Area", coordinates: CLLocationCoordinate2D(latitude: 53.273368, longitude: -3.044382), description: "The Potager is a scenic vegetable/food growing area.  Food grown here is used for the Tea Rooms, sold at harvest time to the public (by way of a donations box) and the pumpkins are used for carving/cooking for Halloween."),
        PointsOfInterest(name: "Herbaceous Area", coordinates: CLLocationCoordinate2D(latitude: 53.272797, longitude: -3.044747), description: "Another original area of Ness although the layout has changed over the years. It now houses 120 metres of herbaceous borders which look beautiful from May to February."),
        PointsOfInterest(name: "Ness Botanische", coordinates: CLLocationCoordinate2D(latitude: 53.273015, longitude: -3.043567), description: "Designed in 2009 by Chris Beardshaw and exhibited at RHS Tatton Show where it won Gold and Best in Show.  It celebrates the botanical research at Ness and the pleasure afforded to our visitors.")]
    }







     

