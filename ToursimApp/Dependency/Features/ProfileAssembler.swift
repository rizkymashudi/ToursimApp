// 
//  ProfileAssembler.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import Foundation

protocol ProfileAssembler {
//  func resolve() -> ProfileNavigator
  func resolve() -> ProfileViewController
}

extension ProfileAssembler where Self: Assembler {
//  func resolve() -> ProfileNavigator {
//    return DefaultProfileNavigator(assembler: self)
//  }

  func resolve() -> ProfileViewController {
    return ProfileViewController()
  }
}
