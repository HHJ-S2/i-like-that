//
//  AddItemViewController.swift
//  ilikethat
//
//  Created by any on 4/15/24.
//

import UIKit

class AddItemViewController: UIViewController {
  
  private let mainView = AddItemView()
  
  override func loadView() {
    view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mainView.descriptionTextView.delegate = self
  }
  
}

extension AddItemViewController: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == UIColor.lightGray {
      textView.text = nil
      textView.textColor = UIColor.black
    }
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = "Description"
      textView.textColor = UIColor.lightGray
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    mainView.descriptionTextView.resignFirstResponder()
    mainView.nameTextField.resignFirstResponder()
    mainView.categoryTextField.resignFirstResponder()
  }
}

