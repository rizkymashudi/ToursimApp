//
//  ProfileViewController.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import UIKit
import RxSwift
import RxCocoa
import SVProgressHUD

class ProfileViewController: UIViewController {
  
  // MARK: - Subview Properties
  private lazy var imageView: UIImageView = {
    let newSubview = UIImageView()
    newSubview.setDimensions(width: 200, height: 200)
    newSubview.clipsToBounds = true
    newSubview.layer.cornerRadius = 100
    newSubview.image = .imgProfile
    newSubview.contentMode = .scaleAspectFill
    
    return newSubview
  }()
  
  private lazy var lblName: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoMedium, size: 25)
    newSubview.text = "Rizky mashudi"
    
    return newSubview
  }()
  
  private lazy var lblDesc: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoRegular, size: 16)
    newSubview.text = "iOS Engineer soon"
    
    return newSubview
  }()
  

  init() {
    super.init(nibName: "ProfileViewController", bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()

  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBar(type: .largeTitle(title: "Profile"))
  }

  // MARK: - Setup views
  private func configureViews() {
    view.addSubview(imageView)
    imageView.centerX(inView: view)
    imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
    
    view.addSubview(lblName)
    lblName.anchor(top: imageView.bottomAnchor, paddingTop: 30)
    lblName.centerX(inView: view)
    
    view.addSubview(lblDesc)
    lblDesc.anchor(top: lblName.bottomAnchor, paddingTop: 20)
    lblDesc.centerX(inView: view)
  }

  
}
