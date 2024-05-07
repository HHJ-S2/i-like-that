//
//  AddItemView.swift
//  ilikethat
//
//  Created by any on 4/15/24.
//

import UIKit

class AddItemView: UIView {
  
  private lazy var container = {
    let view = UIView()
    view.backgroundColor = .white
    view.addSubview(stackView)
    view.addSubview(addIcon)
    return view
  }()
  
  lazy var itemImage = {
    let imageView = UIButton()
    imageView.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
    return imageView
  }()
  
  private lazy var addIcon = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "photo.badge.plus")
    imageView.tintColor = UIColor.FlatColor.Gray.Iron
    return imageView
  }()
  
  var nameTextField = {
    let textFiled = UITextField()
    textFiled.autocapitalizationType = .none
    textFiled.autocorrectionType = .no
    textFiled.spellCheckingType = .no
    textFiled.clearsOnBeginEditing = false
    textFiled.font = UIFont.systemFont(ofSize: 18)
    textFiled.borderStyle = .none
    textFiled.layer.backgroundColor = UIColor.white.cgColor
    textFiled.layer.borderColor = UIColor.FlatColor.Gray.Iron.cgColor
    textFiled.layer.borderWidth = 1
    textFiled.layer.cornerRadius = 4
    textFiled.setLeftPaddingPoints(8)
    textFiled.setRightPaddingPoints(8)
    textFiled.placeholder = "Name"
    textFiled.placeholderColor(UIColor.lightGray)
    return textFiled
  }()
  
  var categoryTextField = {
    let textFiled = UITextField()
    textFiled.autocapitalizationType = .none
    textFiled.autocorrectionType = .no
    textFiled.spellCheckingType = .no
    textFiled.clearsOnBeginEditing = false
    textFiled.font = UIFont.systemFont(ofSize: 18)
    textFiled.borderStyle = .none
    textFiled.layer.backgroundColor = UIColor.white.cgColor
    textFiled.layer.borderColor = UIColor.FlatColor.Gray.Iron.cgColor
    textFiled.layer.borderWidth = 1
    textFiled.layer.cornerRadius = 4
    textFiled.setLeftPaddingPoints(8)
    textFiled.setRightPaddingPoints(8)
    textFiled.placeholder = "Category"
    textFiled.placeholderColor(UIColor.lightGray)
    return textFiled
  }()
  
  var descriptionTextView = {
    let textView = UITextView()
    textView.autocapitalizationType = .none
    textView.autocorrectionType = .no
    textView.spellCheckingType = .no
    textView.font = UIFont.systemFont(ofSize: 18)
    textView.layer.backgroundColor = UIColor.white.cgColor
    textView.layer.borderColor = UIColor.FlatColor.Gray.Iron.cgColor
    textView.layer.borderWidth = 1
    textView.layer.cornerRadius = 4
    textView.textContainerInset = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    textView.text = "Description"
    textView.textColor = UIColor.lightGray
    textView.textContainer.maximumNumberOfLines = 3
    return textView
  }()
  
  private lazy var inputStackView = {
    let stackView = UIStackView(arrangedSubviews: [nameTextField, categoryTextField, descriptionTextView])
    stackView.spacing = 12
    stackView.axis = .vertical
    stackView.alignment = .fill
    return stackView
  }()
  
  private lazy var stackView = {
    let stackView = UIStackView(arrangedSubviews: [itemImage, inputStackView])
    stackView.spacing = 24
    stackView.axis = .vertical
    stackView.alignment = .fill
    return stackView
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
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 20),
      stackView.leadingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      stackView.trailingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    ])
    
    itemImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      itemImage.heightAnchor.constraint(equalToConstant: 300)
    ])
    
    inputStackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      //      inputStackView.widthAnchor.constraint(equalToConstant: 240)
    ])
    
    nameTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameTextField.heightAnchor.constraint(equalToConstant: 48)
    ])
    
    categoryTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      categoryTextField.heightAnchor.constraint(equalToConstant: 48)
    ])
    
    descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      descriptionTextView.heightAnchor.constraint(equalToConstant: 48 * 2)
    ])
    
    addIcon.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      addIcon.widthAnchor.constraint(equalToConstant: 40),
      addIcon.heightAnchor.constraint(equalToConstant: 40),
      addIcon.centerXAnchor.constraint(equalTo: itemImage.centerXAnchor),
      addIcon.centerYAnchor.constraint(equalTo: itemImage.centerYAnchor)
    ])
  }
  
}
