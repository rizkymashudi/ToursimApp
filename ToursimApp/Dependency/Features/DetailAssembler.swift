// 
//  DetailAssembler.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import Foundation

protocol DetailAssembler {
  func resolve() -> DetailViewController
}

extension DetailAssembler where Self: Assembler {

  func resolve() -> DetailViewController {
    return DetailViewController()
  }

}
