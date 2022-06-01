//
//  ApiFactory.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import Foundation
import Moya

enum BaseApi {
  case tourismList(api: TourismAPI)
}

extension BaseApi: TargetType {
  var baseURL: URL {
    return URL(string: Constants.baseUrl)!
  }
  
  var path: String {
    switch self {
    case .tourismList(let api):
      return api.path
    }
  }
    
  var method: Moya.Method {
    switch self {
    case .tourismList(let api):
      return api.method
    }
  }
  
  var task: Task {
    switch self {
    case .tourismList(let api):
      return api.task
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .tourismList(let api):
      return api.headers
    }
  }
}

extension BaseApi {
  var endpointClosure: (BaseApi) -> Endpoint {
    return { _ in
      return MoyaProvider.defaultEndpointMapping(for: self)
    }
  }

  var composedUrl: URL? {
    get {
      let endpoint = endpointClosure(self)

      do {
        let url = try endpoint.urlRequest().url
        return url
      } catch {
        return nil
      }
    }
  }
}
