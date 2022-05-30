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
  private let disposeBag = DisposeBag()

  init() {
    super.init(nibName: "ProfileViewController", bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    configureViews()
    observeValues()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  private func configureViews() {
  }

  private func observeValues() {

  }
}
