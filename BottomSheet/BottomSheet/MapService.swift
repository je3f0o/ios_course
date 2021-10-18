//
//  MapService.swift
//  BottomSheet
//
//  Created by Batkhishig on 2021.10.16.
//

import SwiftUI
import MapKit

class MapService {
    let api = "API_client"
    let key = "API_SECRET"
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )
    
    var view: some View {
        Circle()
    }
    
    static let shared = MapService()
    
    fileprivate init() {
        
    }
}
