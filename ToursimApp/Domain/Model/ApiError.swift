//
//  ApiError.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import Foundation

enum ApiError: Error {
  case unknown
  case connectionError
  case invalidJSONError
  case middlewareError(code: Int, message: String?)
  case failedMappingError
}
