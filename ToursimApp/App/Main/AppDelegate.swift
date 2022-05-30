//
//  AppDelegate.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private let assembler = AppAssembler()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let navigator: HomeNavigator = assembler.resolve()
    navigator.navigateToHome(window: window)
    window?.makeKeyAndVisible()
    
    return true
  }


}

