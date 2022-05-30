//
//  String.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import Foundation
import UIKit

extension String {
  func formatDate(withFormat format: String = "dd MM yyyy", sourceFormat: String = "dd-MM-yyyy") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = sourceFormat
    
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.locale = Locale.init(identifier: "id_ID")
    
    
    return formatter.string(from: dateFormatter.date(from: self) ?? Date())
  }
}
