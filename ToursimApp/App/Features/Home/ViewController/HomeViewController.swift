//
//  HomeViewController.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var tourismTableView: UITableView!
  
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
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.largeTitleDisplayMode = .automatic
  }
  
  private func configureViews(){
    tourismTableView.anchor(left: view.leftAnchor, paddingLeft: 0)
    tourismTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
    tourismTableView.anchor(right: view.rightAnchor, paddingRight: 0)
    tourismTableView.anchor(bottom: view.bottomAnchor, paddingBottom: 0)
  }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    <#code#>
  }
  
  
}
