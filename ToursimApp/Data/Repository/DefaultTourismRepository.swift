// 
//  TourismRepository.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import Foundation
import RxSwift

public struct DefaultTourismRepository: TourismRepository {
  fileprivate let remoteDataSource: TourismRemoteDataSource

  public init(remoteDataSource: TourismRemoteDataSource) {
    self.remoteDataSource = remoteDataSource
  }

  public func getTourismList() -> Observable<[Place]> {
    remoteDataSource.getTourismList().map { $0 }
  }

}
