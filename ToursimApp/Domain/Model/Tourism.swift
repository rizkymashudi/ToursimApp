//
//  Tourism.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import Foundation

public protocol Tourism {
  var error: Bool? { get }
  var message: String? { get }
  var count: Int? { get }
  var places: [Place]? { get }
}

public protocol Place {
  var id: Int? { get }
  var name: String? { get }
  var address: String? { get }
  var longitude: Double? { get }
  var latitude: Double? { get }
  var like: Int? { get }
  var image: String? { get }
  var description: String? { get }
}
