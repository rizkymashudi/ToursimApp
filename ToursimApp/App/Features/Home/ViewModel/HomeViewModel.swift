//
//  HomeViewModel.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import RxCocoa
import RxSwift
import Foundation

class HomeViewModel {
  let tourism: BehaviorRelay<[Place]> = .init(value: [Place]())

  private let disposeBag = DisposeBag()
  private let useCase: GetTourismListUseCase
  
  var canLoadMoreModels = true

  init(useCase: GetTourismListUseCase) {
    self.useCase = useCase
  }
  
  func getTourismList() {
    useCase.execute().subscribe(onNext: { [weak self] result in
      self?.tourism.accept(result)
    }).disposed(by: disposeBag)
  }

}
