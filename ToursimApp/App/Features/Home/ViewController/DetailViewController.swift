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
  
  private lazy var contentView: UIView = {
    let newSubview = UIView()
    return newSubview
  }()
  
  private lazy var stackView: UIStackView = {
    let newSubview = UIStackView()
    newSubview.axis = .vertical
    newSubview.alignment = .leading
    newSubview.spacing = 16
  
    return newSubview
  }()
  
  private lazy var imageView: UIImageView = {
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.tintColor = .tintColor
    navigationItem.title = "Detail"
  }
  
  private func configureView(){
    view.backgroundColor = .white
    
    
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(stackView)
    
    scrollView.anchor(left: view.leftAnchor, paddingLeft: 0)
    scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
    scrollView.anchor(right: view.rightAnchor, paddingRight: 0)
    scrollView.anchor(bottom: view.bottomAnchor, paddingBottom: 0)
    
    contentView.anchor(left: scrollView.leftAnchor, paddingLeft: 0)
    contentView.anchor(top: scrollView.topAnchor, paddingTop: 0)
    contentView.anchor(right: scrollView.rightAnchor, paddingRight: 0)
    contentView.anchor(bottom: scrollView.bottomAnchor, paddingBottom: 0)
    
    stackView.anchor(left: contentView.leftAnchor, paddingLeft: 0)
    stackView.anchor(top: contentView.topAnchor, paddingTop: 0)
    stackView.anchor(right: contentView.rightAnchor, paddingRight: 0)
    stackView.anchor(bottom: contentView.bottomAnchor, paddingBottom: 0)
    
    guard let tourismDetail = tourismDetail else { return }

    stackView.addArrangedSubview(imageView)
    guard let img = tourismDetail.image else { return }
    let imgUrl = URL(string: img)
    imageView.sd_setImage(with: imgUrl)
    
    stackView.addArrangedSubview(lblName)
    guard let name = tourismDetail.name else { return }
    lblName.text = name
    
    stackView.addArrangedSubview(lblAddress)
    guard let address = tourismDetail.address else { return }
    lblAddress.text = address
    
    stackView.addArrangedSubview(lblDesc)
    guard let desc = tourismDetail.description else { return }
    lblDesc.text = desc
  }

}
