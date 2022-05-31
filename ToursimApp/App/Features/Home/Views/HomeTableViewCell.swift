//
//  HomeTableViewCell.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 31/05/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
  
  static let identifier = "HomeTableViewCell"
  
  lazy var imgCell: UIImageView = {
    let newSubview = UIImageView()
    newSubview.setDimensions(width: 358, height: 215)
    newSubview.clipsToBounds = true
    newSubview.layer.cornerRadius = 8
    newSubview.contentMode = .scaleAspectFill
    
    return newSubview
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureViews(){
    
  }
}
