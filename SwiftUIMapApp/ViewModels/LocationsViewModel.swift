//
//  LocationsViewModel.swift
//  SwiftUIMapApp
//
//  Created by Wataru Miyakoshi on 2024/04/01.
//

import Foundation
import MapKit
import SwiftUI

@MainActor
final class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    /// 現在のロケーション
    @Published var mapLocation: Location {
        didSet {
            updateMapLocation(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(
        latitudeDelta: 0.1,
        longitudeDelta: 0.1
    )
    
    @Published var isShowingLocationList: Bool = false

    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapLocation(location: locations.first!)
    }
    
    private func updateMapLocation(location: Location) {
        mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan
        )
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            isShowingLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            isShowingLocationList = false
        }
    }
    
    func nextButtonPressed() {
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation})
        else {
            print("Could not find current index")
            return
        }
        
        // Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex)
        else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next index IS valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
