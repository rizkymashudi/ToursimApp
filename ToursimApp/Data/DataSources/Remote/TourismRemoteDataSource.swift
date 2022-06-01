// 
//  TourismRemoteDataSource.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import Foundation
import RxSwift

public protocol TourismRemoteDataSource {
  func getTourismList() ->  Observable<[Places]>
}

public struct DefaultTourismRemoteDataSource: TourismRemoteDataSource {
  public init(){}

  public func getTourismList() -> Observable<[Places]> {
    return NetworkService.shared.connect(api: .tourismList(api: .tourismList), mappableType: TourismResponse.self).map { $0._places ?? [] }
  }
}
