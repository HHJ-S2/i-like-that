//
//  ItemsCollectionViewCell.swift
//  ilikethat
//
//  Created by any on 4/10/24.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
  weak var imageView: UIImageView?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let imageView = UIImageView()
    self.imageView = imageView
    
    imageView.contentMode = .scaleToFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    self.contentView.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalTo: self.widthAnchor),
      imageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      imageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
