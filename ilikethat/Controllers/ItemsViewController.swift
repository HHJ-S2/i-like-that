//
//  ViewController.swift
//  ilikethat
//
//  Created by any on 4/10/24.
//

import UIKit

class ItemsViewController: UIViewController {
  
  // MARK: - Property
  let palette: [UIColor] = [.red, .orange, .yellow, .green, .blue]
  
  private let mainView = ItemsView()
  
  override func loadView() {
    view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarButtonItemTapped))
    
    rightBarButtonItem.tintColor = .black
    navigationItem.rightBarButtonItem = rightBarButtonItem
    
    setupTableView()
  }
  
  func setupTableView() {
    let collectionView = mainView.itemList
    
    collectionView.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: "ItemsCell")
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  @objc func rightBarButtonItemTapped() {
    let nextVC = AddItemViewController()
    
    nextVC.hidesBottomBarWhenPushed = true
    show(nextVC, sender: nil)
  }
}


extension ItemsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return palette.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCell", for: indexPath)
    cell.backgroundColor = palette[indexPath.item]
    return cell
  }
}


extension ItemsViewController: UICollectionViewDelegate {
  // MARK: selected
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      print("\(indexPath.item)번 Cell 클릭")
  }
}


extension ItemsViewController: UICollectionViewDelegateFlowLayout {
  // MARK: cellSize
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collectionViewWidth = collectionView.bounds.width
    let cellItemForRow: CGFloat = 2
    let minimumSpacing: CGFloat = 2
    
    let width = (collectionViewWidth - (cellItemForRow - 1) * minimumSpacing) / cellItemForRow
    
    return CGSize(width: width, height: width)
  }
  
  // MARK: minimumSpacing
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 2
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 2
  }
}
