// 
//  TourismRepository.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import Foundation
import RxSwift

public protocol TourismRepository {
  func getTourismList() -> Observable<[Place]>
}
