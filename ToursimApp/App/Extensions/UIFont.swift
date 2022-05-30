//
//  UIFont.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import Foundation
import UIKit

enum FontType {
  case robotoRegular
  case robotoMedium
  case robotoBold
}

extension UIFont {
  class func font(type: FontType, size: CGFloat) -> UIFont {
    switch type {
    case .robotoRegular:
      return UIFont(name: "Roboto-Regular", size: size) ?? .systemFont(ofSize: size)
    case .robotoMedium:
      return UIFont(name: "Roboto-Medium", size: size) ?? .systemFont(ofSize: size)
    case .robotoBold:
      return UIFont(name: "Roboto-Bold", size: size) ?? .systemFont(ofSize: size)
    }
  }
}
