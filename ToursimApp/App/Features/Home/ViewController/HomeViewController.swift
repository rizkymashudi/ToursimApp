//
//  HomeViewController.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import UIKit
import RxSwift
import RxCocoa
import SVProgressHUD
import SDWebImage

class HomeViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var tourismTableView: UITableView!
  
  private lazy var badConnectionState: UIView = {
    let newSubview = UIView()
    newSubview.setDimensions(width: 250, height: 250)
    
    return newSubview
  }()
  
  private lazy var imgConnection: UIImageView = {
    let newSubview = UIImageView()
    newSubview.image = UIImage.imgConnection
    newSubview.setDimensions(width: 100, height: 100)
    newSubview.contentMode = .scaleAspectFit
    newSubview.tintColor = .gray
    return newSubview
  }()
  
  private lazy var lblConnection: UILabel = {
    let newSubview = UILabel()
    newSubview.font = UIFont.font(type: .robotoRegular, size: 16)
    newSubview.setDimensions(width: 250)
    newSubview.textColor = .gray
    newSubview.textAlignment = .center
    newSubview.numberOfLines = 0
    newSubview.text = "Your internet is unreachable! please try again."
    
    return newSubview
  }()
  
  // MARK: - Variables
  let refreshControl = UIRefreshControl()
  private var tourismList = [Place]()
  
  private let navigator: HomeNavigator
  private let viewModel: HomeViewModel
  private let disposBag = DisposeBag()
  
  init(navigator: HomeNavigator, viewModel: HomeViewModel) {
    self.navigator = navigator
    self.viewModel = viewModel
    super.init(nibName: "HomeViewController", bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - lifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
    observeValues()
    reloadHomeData()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  // MARK: - Setup views
  private func configureViews(){
    
    if NetworkMonitor.shared.isConnected {
      view.addSubview(tourismTableView)
      tourismTableView.anchor(left: view.leftAnchor, paddingLeft: 0)
      tourismTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
      tourismTableView.anchor(right: view.rightAnchor, paddingRight: 0)
      tourismTableView.anchor(bottom: view.bottomAnchor, paddingBottom: 0)
      
      tourismTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
      tourismTableView.delegate = self
      tourismTableView.dataSource = self
      tourismTableView.separatorColor = .clear
      
      if #available(iOS 10.0, *) {
        tourismTableView.refreshControl = refreshControl
      } else {
        tourismTableView.addSubview(refreshControl)
      }
      refreshControl.addTarget(self, action: #selector(onPullToRefresh(_:)), for: .valueChanged)
    } else {
      
      view.addSubview(badConnectionState)
      badConnectionState.anchor(left: view.leftAnchor, paddingLeft: 0)
      badConnectionState.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
      badConnectionState.anchor(right: view.rightAnchor, paddingRight: 0)
      badConnectionState.anchor(bottom: view.bottomAnchor, paddingBottom: 0)
      
      badConnectionState.addSubview(imgConnection)
      imgConnection.centerX(inView: badConnectionState)
      imgConnection.anchor(top: badConnectionState.topAnchor, paddingTop: 130)
      
      badConnectionState.addSubview(lblConnection)
      lblConnection.centerX(inView: badConnectionState)
      lblConnection.anchor(top: imgConnection.bottomAnchor, paddingTop: 20)
    }
    
  }
  
  
  // MARK: - Functions
  private func observeValues(){
    viewModel.tourism.subscribe(onNext: { [weak self] result in
      self?.tourismList = result
      self?.didFinish()
    }).disposed(by: disposBag)
  }
  
  private func didFinish(){
    tourismTableView.reloadData()
    refreshControl.endRefreshing()
  }
  
  private func reloadHomeData(){
    viewModel.getTourismList()
  }
  
  // MARK: - Outlets & objc functions
  @objc func onPullToRefresh(_ sender: Any) {
    reloadHomeData()
  }
    
}

// MARK: - Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tourismList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
    
    if let tourismImage = tourismList[indexPath.row].image {
      let imgUrl = URL(string: tourismImage)
      cell.imgCell.sd_setImage(with: imgUrl)
    }
    
    if let likesCounter = tourismList[indexPath.row].like {
      cell.likeCounter.text = "\(likesCounter) likes"
    }

    cell.lblName.text = tourismList[indexPath.row].name
    cell.lblAddress.text = tourismList[indexPath.row].address
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    navigator.navigateToDetail(from: self, data: tourismList[indexPath.row])
  }
  
  
}
