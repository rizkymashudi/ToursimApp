//
//  TourismAPI.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import Foundation
import Moya

enum TourismAPI {
  case tourismList
}

extension TourismAPI: TargetType {
    
  var path: String {
    switch self {
    case .tourismList:
      return "/list"
    }
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var task: Task {
    switch self {
    case .tourismList:
      return .requestPlain
    }
  }

  // below is just a stub
  var headers: [String : String]? { nil }
  var baseURL: URL { URL(string: "")! }
  var sampleData: Foundation.Data { Data() }
  
}
