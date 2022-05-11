//
//  Trails.swift
//  Ness Botanic Gardens App
//
//  Created by Olivia Faulds on 10/03/2022.
//

import Foundation
import SwiftUI


struct Trail{
    let id = UUID()
    let title: String
    let description: String
    let duration: String
    let imageName: String
}

struct TrailList{
    static let avaliableTrails = [
        Trail(title: "Recommended Route", description: "A popular route taken by regulars: this walk takes you around many of the key features of the park whilst still keeping the walk reasonably short ", duration: "Difficulty: Average", imageName: "map"),
        Trail(title: "Water Walk", description: "Follow this trail if you wish to see all the ponds and water features Ness Botanic Gardens has to offer", duration: "Difficulty: Average-Hard", imageName: "WaterWalk"),
        Trail(title: "Full Tour", description: "Designed for visitors that wish to spend the whole day exploring every inch of the park.", duration: "Difficulty: Hard", imageName: "LongWalk"),
        Trail(title: "Kids Walk", description:"This walk is designed to take children round the parts of the park they will find most interesting. This is the shortest of the trails avaliable.", duration: "Difficulty: Easy", imageName: "KidsWalk")];
    
}

        
        
        
    
    


