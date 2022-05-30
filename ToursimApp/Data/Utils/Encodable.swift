//
//  Encodable.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import Foundation

extension Encodable {
  var parameters: [String: Any]? {
    let encoder: JSONEncoder = JSONEncoder()
    guard let data = try? encoder.encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
