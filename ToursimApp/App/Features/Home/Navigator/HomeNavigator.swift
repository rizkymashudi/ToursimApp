// 
//  HomeNavigator.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import UIKit

protocol HomeNavigator {
  func navigateToHome(window: UIWindow?)
  func navigateToDetail(from viewController: UIViewController, with id: Int)
  
  var homeViewController: HomeViewController { get }
//  var popularViewController: SearchViewController { get }
//  var favoriteViewController: FavoriteViewController { get }
}

struct DefaultHomeNavigator: HomeNavigator {
  private let assembler: Assembler

  init(assembler: Assembler) {
    self.assembler = assembler
  }

  func navigateToHome(window: UIWindow?) {
    let homeTabBar: HomeTabBarViewController = assembler.resolve()
    window?.rootViewController = homeTabBar
  }
  
  func navigateToDetail(from viewController: UIViewController, with id: Int) {
    <#code#>
  }
  
  var homeViewController: HomeViewController {
    assembler.resolve()
  }
  
  
  
}
