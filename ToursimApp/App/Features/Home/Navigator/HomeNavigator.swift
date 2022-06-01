// 
//  HomeNavigator.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import UIKit

protocol HomeNavigator {
  func navigateToHome(window: UIWindow?)
  func navigateToDetail(from viewController: UIViewController, data: Place)
  
  var homeViewController: HomeViewController { get }
  var profileViewController: ProfileViewController { get }
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
  
  func navigateToDetail(from viewController: UIViewController, data: Place) {
    let nextViewController: DetailViewController = assembler.resolve()
    nextViewController.tourismDetail = data
    nextViewController.hidesBottomBarWhenPushed = true
    viewController.navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  var homeViewController: HomeViewController {
    assembler.resolve()
  }
  
  var profileViewController: ProfileViewController {
    assembler.resolve()
  }
  
  
}
