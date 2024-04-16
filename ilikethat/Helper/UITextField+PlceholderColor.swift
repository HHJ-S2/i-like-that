//
//  UITextField+PlceholderColor.swift
//  ilikethat
//
//  Created by any on 4/16/24.
//

import UIKit

public extension UITextField {
  func placeholderColor(_ placeholderColor: UIColor) {
    attributedPlaceholder = NSAttributedString(
      string: placeholder ?? "",
      attributes: [
        .foregroundColor: placeholderColor,
        .font: font
      ].compactMapValues { $0 }
    )
  }
  
}
