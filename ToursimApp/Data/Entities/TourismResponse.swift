// 
//  Tourism.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import Foundation
import ObjectMapper

public struct TourismResponse: Tourism, Mappable {
  public var error: Bool?
  public var message: String?
  public var count: Int?
  public var places: [Place]? {
    _places
  }
  public var _places: [Places]?
  
  public init?(map: Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: Map) {
    error <- map["error"]
    message <- map["message"]
    count <- map["count"]
    _places <- map["places"]
  }
}

public struct Places: Place, Mappable {
  public var latitude: Double?
  public var longitude: Double?
  public var address: String?
  public var like: Int?
  public var name: String?
  public var description: String?
  public var id: Int?
  public var image: String?
  
  public init?(map: Map) {
    mapping(map: map)
  }
  
  public mutating func mapping(map: Map) {
    latitude <- map["latitude"]
    longitude <- map["longitude"]
    address <- map["address"]
    like <- map["like"]
    name <- map["name"]
    description <- map["description"]
    id <- map["id"]
    image <- map["image"]
  }
}
