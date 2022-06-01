//
//  DetailViewController.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 01/06/22.
//

import UIKit

class DetailViewController: UIViewController {
  
  // MARK: - Subview Properties
  private var tableView = UITableView()
    
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
    
    view.addSubview(tableView)
    tableView.anchor(left: view.leftAnchor, paddingLeft: 0)
    tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
    tableView.anchor(right: view.rightAnchor, paddingRight: 0)
    tableView.anchor(bottom: view.bottomAnchor, paddingBottom: 0)
    
    tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorColor = .clear
  
  }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
    
    if let tourismDetail = tourismDetail {
      let imgUrl = URL(string: tourismDetail.image!)
      cell.imgDetail.sd_setImage(with: imgUrl)
      cell.lblName.text = tourismDetail.name
      cell.lblAddress.text = tourismDetail.address
      cell.lblDesc.text = tourismDetail.description
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
