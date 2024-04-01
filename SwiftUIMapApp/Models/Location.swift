//
//  Location.swift
//  SwiftUIMapApp
//
//  Created by Wataru Miyakoshi on 2024/04/01.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let name: String
    let cityName: String
    // MapKitを使用するのであれば、座標はCLLocationCoordinate2Dを使用する
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
