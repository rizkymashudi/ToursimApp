//
//  DetailTableViewCell.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 02/06/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

  static let identifier = "DetailTableViewCell"
  
  lazy var containerView: UIView = {
    let newSubview = UIView()
    return newSubview
  }()
  
  lazy var imgDetail: UIImageView = {
    let newSubview = UIImageView()
    newSubview.setDimensions(width: 358, height: 215)
    newSubview.clipsToBounds = true
    newSubview.layer.cornerRadius = 8
    newSubview.contentMode = .scaleAspectFill
    
    return newSubview
  }()
  
  lazy var lblName: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoMedium, size: 20)
    
    return newSubview
  }()
  
  lazy var lblAddress: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoRegular, size: 18)
    newSubview.numberOfLines = 0
    
    return newSubview
  }()
  
  lazy var lblDesc: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoRegular, size: 15)
    newSubview.numberOfLines = 0
    
    return newSubview
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureView(){
    contentView.addSubview(containerView)
    containerView.anchor(left: contentView.leftAnchor, paddingLeft: 0)
    containerView.anchor(top: contentView.topAnchor, paddingTop: 0)
    containerView.anchor(right: contentView.rightAnchor, paddingRight: 0)

    containerView.addSubview(imgDetail)
    imgDetail.anchor(left: containerView.leftAnchor, paddingLeft: 16)
    imgDetail.anchor(top: containerView.topAnchor, paddingTop: 25)
    imgDetail.anchor(right: containerView.rightAnchor, paddingRight: 16)
    
    containerView.addSubview(lblName)
    lblName.anchor(left: containerView.leftAnchor, paddingLeft: 16)
    lblName.anchor(top: imgDetail.bottomAnchor, paddingTop: 25)
    lblName.anchor(right: containerView.rightAnchor, paddingRight: 16)
    
    containerView.addSubview(lblAddress)
    lblAddress.anchor(left: containerView.leftAnchor, paddingLeft: 16)
    lblAddress.anchor(top: lblName.bottomAnchor, paddingTop: 6)
    lblAddress.anchor(right: containerView.rightAnchor, paddingRight: 16)
    
    containerView.addSubview(lblDesc)
    lblDesc.anchor(left: containerView.leftAnchor, paddingLeft: 16)
    lblDesc.anchor(top: lblAddress.bottomAnchor, paddingTop: 18)
    lblDesc.anchor(right: containerView.rightAnchor, paddingRight: 16)
  }
  
}
