//
//  UIViewController.swift
//  MuviApp-IOS
//
//  Created by Uwais Alqadri on 23/08/21.
//

import UIKit
import SVProgressHUD

enum NavigationBarType {
  case largeTitle(title: String?)
  case backTransparent
}

protocol NavigationBarButtonHandler {
  func leftNavigationBarButtonTapped(sender: UIBarButtonItem?)
  func rightNavigationBarButtonTapped(sender: UIBarButtonItem?)
}

extension UIViewController {
  
  private func setDefaultNavigationTheme() {
    navigationController?.setNavigationBarHidden(false, animated: true)
    navigationController?.interactivePopGestureRecognizer?.delegate = nil
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.backgroundColor = UIColor.primaryColor
    navigationController?.navigationBar.barTintColor = UIColor.primaryColor
    view.backgroundColor = UIColor.white
    
    navigationController?.navigationBar.titleTextAttributes = [
      NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 20, weight: .heavy),
      NSAttributedString.Key.foregroundColor: UIColor.primaryColor as Any
    ]
  }
  
  private func setTransparentNavigationTheme() {
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.barTintColor = .clear
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.isTranslucent = true
  }
  
  private func setLargeNavigationTitle() {
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.barTintColor = .clear
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func setNavigationBar(type: NavigationBarType) {
    setDefaultNavigationTheme()
    
    switch type {
    case .backTransparent:
      navigationItem.leftBarButtonItem = createBackButton()
      setTransparentNavigationTheme()
    case .largeTitle(let title):
      navigationItem.title = title
      setLargeNavigationTitle()
    }
  }
}

extension UIViewController: NavigationBarButtonHandler {
  @objc func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
    
  }
  
  @objc func rightNavigationBarButtonTapped(sender: UIBarButtonItem?) {
    
  }
}

extension UIViewController {
  private func createBackButton() -> UIBarButtonItem {
    let backButton = UIBarButtonItem(image: .icBack, style: .plain, target: self, action: #selector(self.leftNavigationBarButtonTapped(sender:)))
    backButton.tintColor = UIColor.black
    backButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
    return backButton
  }
      
}

extension UIViewController {
  
  var window : UIWindow {
    return UIApplication.shared.windows.first!
  }
  
  func addTapGestureToHideKeyboard() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc public func hideKeyboard() {
    view.endEditing(true)
  }
}

extension UIViewController {
  func hideLoading(){
    SVProgressHUD.dismiss()
  }
  
  func showLoading(){
    SVProgressHUD.show()
  }
}
