//
//  ItemsView.swift
//  ilikethat
//
//  Created by any on 4/10/24.
//

import UIKit

class ItemsView: UIView {
  private lazy var container = {
    let view = UIView()
    view.backgroundColor = .white
    view.addSubview(wrapper)
    return view
  }()
  
  private lazy var wrapper = {
    let view = UIView()
    view.backgroundColor = .white
    view.addSubview(itemList)
    return view
  }()
  
  lazy var itemList = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .vertical    
    let collectionView = UICollectionView(frame: .init(), collectionViewLayout: flowLayout)
    collectionView.backgroundColor = UIColor.white
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(container)
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setConstraints() {
    container.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      container.topAnchor.constraint(equalTo: self.topAnchor),
      container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    
    wrapper.translatesAutoresizingMaskIntoConstraints = false
    // 코드로 constant를 설정할 때, trailingAnchor / bottomAnchor에 한해서 storyboard와 달리 -(minus)를 붙여주어야 한다
    NSLayoutConstraint.activate([
      wrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      wrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
      wrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
      wrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
    ])
    
    itemList.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      itemList.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      itemList.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
      itemList.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
      itemList.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
    ])
  }
}
