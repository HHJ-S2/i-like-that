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
    
    // NotificationCenter에 키보드 이벤트 관찰자 등록
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)),name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  deinit {
    // NotificationCenter에서 관찰자 제거
    NotificationCenter.default.removeObserver(self)
  }
  
  @objc func keyboardWillShow(_ notification: Notification) {
    // 키보드가 보일때 화면을 위로 100만큼 올린다.
    mainView.frame = CGRect(x: 0, y: -100, width: mainView.frame.size.width, height: mainView.frame.size.height)
  }
  
  @objc func keyboardWillBeHidden(_ notification: NSNotification) {
    //키보드가 사라질때 화면을 다시 원복한다.
    mainView.frame = CGRect(x: 0, y: 0, width: mainView.frame.size.width, height: mainView.frame.size.height)
  }
  
}

extension AddItemViewController: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == UIColor.FlatColor.Gray.Iron {
      textView.text = nil
      textView.textColor = UIColor.black
    }
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = "Description"
      textView.textColor = UIColor.FlatColor.Gray.Iron
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    mainView.descriptionTextView.resignFirstResponder()
    mainView.nameTextField.resignFirstResponder()
    mainView.categoryTextField.resignFirstResponder()
  }
}

