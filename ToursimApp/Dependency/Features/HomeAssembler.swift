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
//  func resolve() -> HomeViewModel
//  func resolve() -> GetHomeListUseCase
//  func resolve() -> HomeRepository
//  func resolve() -> HomeRemoteDataSource
//  func resolve() -> HomeLocalDataSource
}

extension HomeAssembler where Self: Assembler {
  func resolve() -> HomeNavigator {
    return DefaultHomeNavigator(assembler: self)
  }

  func resolve() -> HomeViewController {
    return HomeViewController(viewModel: resolve())
  }

  func resolve() -> HomeTabBarViewController {
    return HomeTabBarViewController()
  }
//  func resolve() -> HomeViewModel {
//    return HomeViewModel(useCase: resolve())
//  }
//
//  func resolve() -> GetHomeListUseCase {
//    return GetHomeList()
//  }
//
//  func resolve() -> HomeRepository {
//    return DefaultHomeRepository(remoteDataSource: resolve(),
//                            localDataSource: resolve())
//  }
//
//  func resolve() -> HomeRemoteDataSource {
//    return DefaultHomeRemoteDataSource()
//  }
//
//  func resolve() -> HomeLocalDataSource {
//    return DefaultHomeLocalDataSource()
//  }
}
