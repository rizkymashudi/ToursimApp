//
//  HomeTabBarViewController.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import UIKit

class HomeTabBarViewController: UITabBarController{
  
  // MARK: - Variables
  private let navigator: HomeNavigator

  init(navigator: HomeNavigator){
    self.navigator = navigator
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - lifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
  }
    
  // MARK: - Setup views
  private func configureTabBar(){
    tabBar.backgroundColor = .white
    tabBar.barTintColor = .white
    tabBar.tintColor = .tintColor
    
    delegate = self
    
    let homeTab = createTabBarController(vc: navigator.homeViewController, image: UIImage.home!, title: "Destinations List")
    let profileTab = createTabBarController(vc: navigator.profileViewController, image: UIImage.profile!, title: "Profile")
    
    viewControllers = [homeTab, profileTab]
  }
  
  private func createTabBarController(vc: UIViewController, image: UIImage, title: String) -> UINavigationController {
    let tabController = UINavigationController(rootViewController: vc)
    tabController.tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
    tabController.tabBarItem.selectedImage = image.withRenderingMode(.alwaysTemplate)
    tabController.tabBarItem.title = title
    tabController.navigationBar.prefersLargeTitles = true
    vc.navigationItem.title = title
    
    return tabController
  }
}

extension HomeTabBarViewController: UITabBarControllerDelegate {
  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    
  }
}
