//
//  DetailViewController.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import UIKit

class DetailViewController: UIViewController {
  
  // MARK: - Subview Properties
  private lazy var scrollView: UIScrollView = {
    let newSubview = UIScrollView()
    return newSubview
  }()
  
  private lazy var containerView: UIView = {
    let newSubview = UIView()
    newSubview.setDimensions(height: 1100)
    return newSubview
  }()
  
  private lazy var imgDetail: UIImageView = {
    let newSubview = UIImageView()
    newSubview.setDimensions(width: 358, height: 215)
    newSubview.clipsToBounds = true
    newSubview.layer.cornerRadius = 8
    newSubview.contentMode = .scaleAspectFill
    
    return newSubview
  }()
  
  private lazy var lblName: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoMedium, size: 20)
    
    return newSubview
  }()
  
  private lazy var lblAddress: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoRegular, size: 18)
    newSubview.numberOfLines = 0
    
    return newSubview
  }()
  
  private lazy var lblDesc: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoRegular, size: 15)
    newSubview.numberOfLines = 0
    
    return newSubview
  }()
    
  // MARK: - Variables
  var tourismDetail: Place?
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - lifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.tintColor = .tintColor
    navigationItem.title = "Detail"
  }
  
  
  // MARK: - Setup views
  private func configureView(){
    view.backgroundColor = .white
    
    guard let tourismDetail = tourismDetail else { return }

    view.addSubview(scrollView)
    scrollView.anchor(left: view.leftAnchor, paddingLeft: 0)
    scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
    scrollView.anchor(right: view.rightAnchor, paddingRight: 0)
    scrollView.anchor(bottom: view.bottomAnchor, paddingBottom: 0)
    
    scrollView.addSubview(containerView)
    containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    containerView.anchor(left: scrollView.leftAnchor, paddingLeft: 0)
    containerView.anchor(top: scrollView.topAnchor, paddingTop: 0)
    containerView.anchor(right: scrollView.rightAnchor, paddingRight: 0)
    containerView.anchor(bottom: scrollView.bottomAnchor, paddingBottom: 0)
    
    scrollView.addSubview(imgDetail)
    guard let tourismImage = tourismDetail.image else { return }
    let imgUrl = URL(string: tourismImage)
    imgDetail.sd_setImage(with: imgUrl)
    imgDetail.anchor(left: scrollView.leftAnchor, paddingLeft: 16)
    imgDetail.anchor(top: scrollView.topAnchor, paddingTop: 25)
    imgDetail.anchor(right: scrollView.rightAnchor, paddingRight: 16)
    
    scrollView.addSubview(lblName)
    lblName.anchor(left: scrollView.leftAnchor, paddingLeft: 16)
    lblName.anchor(top: imgDetail.bottomAnchor, paddingTop: 22)
    lblName.anchor(right: scrollView.rightAnchor, paddingRight: 16)
    lblName.text = tourismDetail.name
    
    scrollView.addSubview(lblAddress)
    lblAddress.anchor(left: scrollView.leftAnchor, paddingLeft: 16)
    lblAddress.anchor(top: lblName.bottomAnchor, paddingTop: 6)
    lblAddress.anchor(right: scrollView.rightAnchor, paddingRight: 16)
    lblAddress.text = tourismDetail.address
      
    scrollView.addSubview(lblDesc)
    lblDesc.anchor(left: scrollView.leftAnchor, paddingLeft: 16)
    lblDesc.anchor(top: lblAddress.bottomAnchor, paddingTop: 20)
    lblDesc.anchor(right: scrollView.rightAnchor, paddingRight: 16)
    lblDesc.text = tourismDetail.description
  }

}

