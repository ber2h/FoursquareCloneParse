//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Bertuğ Horoz on 6.11.2022.
//

import Foundation
import UIKit

class placeModel{
    
    static let sharedInstance = placeModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmos = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    private init() {}
    
}
