//
//  HomeTableViewCell.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 31/05/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
  
  static let identifier = "HomeTableViewCell"
  
  lazy var containerView: UIView = {
    let newSubview = UIView()
    newSubview.backgroundColor = .white
    newSubview.layer.cornerRadius = 8
    newSubview.layer.shadowColor = UIColor.shadowColor.cgColor
    newSubview.layer.shadowOpacity = 5
    newSubview.layer.shadowOffset = CGSize(width: 0, height: 5)
    newSubview.layer.shadowRadius = 5
    
    return newSubview
  }()
  
  lazy var imgCell: UIImageView = {
    let newSubview = UIImageView()
    newSubview.setDimensions(width: 358, height: 215)
    newSubview.clipsToBounds = true
    newSubview.layer.cornerRadius = 8
    newSubview.contentMode = .scaleAspectFill
    
    return newSubview
  }()
  
  lazy var iconLike: UIImageView = {
    let newSubview = UIImageView()
    newSubview.setDimensions(width: 25, height: 22)
    newSubview.image = .icLike
    newSubview.tintColor = UIColor.systemRed
    
    return newSubview
  }()
  
  lazy var likeCounter: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoRegular, size: 15)
    
    return newSubview
  }()
  
  lazy var lblName: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoBold, size: 20)
    
    return newSubview
  }()
  
  lazy var lblAddress: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoRegular, size: 18)
    newSubview.numberOfLines = 0
    
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
    contentView.addSubview(containerView)
    containerView.anchor(left: contentView.leftAnchor, paddingLeft: 16)
    containerView.anchor(top: contentView.topAnchor, paddingTop: 10)
    containerView.anchor(right: contentView.rightAnchor, paddingRight: 16)
    containerView.anchor(bottom: contentView.bottomAnchor, paddingBottom: 10)
    
    containerView.addSubview(imgCell)
    imgCell.anchor(left: containerView.leftAnchor, paddingLeft: 0)
    imgCell.anchor(top: containerView.topAnchor, paddingTop: 0)
    imgCell.anchor(right: containerView.rightAnchor, paddingRight: 0)
    
    containerView.addSubview(iconLike)
    iconLike.anchor(left: containerView.leftAnchor, paddingLeft: 10)
    iconLike.anchor(top: imgCell.bottomAnchor, paddingTop: 15)
    
    containerView.addSubview(likeCounter)
    likeCounter.anchor(left: iconLike.rightAnchor, paddingLeft: 9)
    likeCounter.anchor(top: imgCell.bottomAnchor, paddingTop: 17)
    
    containerView.addSubview(lblName)
    lblName.anchor(left: containerView.leftAnchor, paddingLeft: 10)
    lblName.anchor(top: likeCounter.bottomAnchor, paddingTop: 9)
    
    containerView.addSubview(lblAddress)
    lblAddress.anchor(left: containerView.leftAnchor, paddingLeft: 10)
    lblAddress.anchor(top: lblName.bottomAnchor, paddingTop: 6)
    lblAddress.anchor(right: containerView.rightAnchor, paddingRight: 30)
    lblAddress.anchor(bottom: containerView.bottomAnchor, paddingBottom: 30)
  }
}
