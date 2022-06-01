// 
//  HomeAssembler.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import Foundation

protocol HomeAssembler {
  func resolve() -> HomeNavigator
  func resolve() -> HomeViewController
  func resolve() -> HomeTabBarViewController
  func resolve() -> HomeViewModel
  
  func resolve() -> GetTourismListUseCase
  func resolve() -> TourismRepository
  func resolve() -> TourismRemoteDataSource
}

extension HomeAssembler where Self: Assembler {
  func resolve() -> HomeNavigator {
    return DefaultHomeNavigator(assembler: self)
  }

  func resolve() -> HomeViewController {
    return HomeViewController(navigator: resolve(), viewModel: resolve())
  }

  func resolve() -> HomeTabBarViewController {
    return HomeTabBarViewController(navigator: resolve())
  }
  
  func resolve() -> HomeViewModel {
    return HomeViewModel(useCase: resolve())
  }

  func resolve() -> GetTourismListUseCase {
    return GetTourismList(repository: resolve())
  }

  func resolve() -> TourismRepository {
    return DefaultTourismRepository(remoteDataSource: resolve())
  }

  func resolve() -> TourismRemoteDataSource {
    return DefaultTourismRemoteDataSource()
  }

//  func resolve() -> HomeLocalDataSource {
//    return DefaultHomeLocalDataSource()
//  }
}
