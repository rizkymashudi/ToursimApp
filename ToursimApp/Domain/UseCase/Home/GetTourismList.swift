// 
//  GetTourismList.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import Foundation
import RxSwift

public protocol GetTourismListUseCase {
  func execute() -> Observable<[Place]>
}

open class GetTourismList: GetTourismListUseCase {
  private let repository: TourismRepository

  public init(repository: TourismRepository) {
    self.repository = repository
  }

  public func execute() -> Observable<[Place]> {
    return repository.getTourismList()
  }
}
