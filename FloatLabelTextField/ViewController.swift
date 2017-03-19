//
//  ViewController.swift
//  FloatLabelTextField
//
//  Created by Joe Gesualdo on 3/9/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FloatLabelTextFieldDelegate {

  let formContainer = UIView(frame: CGRect())
  var customInputContainer = UIView(frame: CGRect())
  let jginput = FloatLabelTextField(label: "First name", placeholder: "First name")
  var customInputContainer2 = UIView(frame: CGRect())
  let jginput2 = FloatLabelTextField(label: "Last name", placeholder: "Last name")
  
  override func viewDidLoad() {
    jginput.delegate = self
    jginput.tag = 0
    jginput2.delegate = self
    jginput2.tag = 1
    let formMargin = 10.0
    let borderWidth = 0.5
    let formWidth = view.frame.size.width - CGFloat(formMargin * 2)
    let inputWidth = formWidth - CGFloat(borderWidth * 2)
    
    super.viewDidLoad()
    view.backgroundColor = UIColor.init(colorLiteralRed: 0.965, green: 0.965, blue: 0.965, alpha: 1.00)
    
    formContainer.layer.borderColor = UIColor.init(colorLiteralRed: 0.627, green: 0.627, blue: 0.627, alpha: 1.00).cgColor
    formContainer.layer.borderWidth = CGFloat(borderWidth)
    formContainer.layer.cornerRadius = 2
    formContainer.backgroundColor = UIColor.white
    
    view.addSubview(formContainer)
//    view.addSubview(customInputContainer2)
    view.addSubview(jginput)
    view.addSubview(jginput2)
    
    formContainer.translatesAutoresizingMaskIntoConstraints = false;
    formContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    formContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(formMargin)).isActive = true
//    formContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
    formContainer.widthAnchor.constraint(equalToConstant: formWidth).isActive = true
    formContainer.heightAnchor.constraint(equalToConstant: 60 + CGFloat(borderWidth * 2)).isActive = true
    
//    print(customInputContainer.topAnchor)
    jginput.translatesAutoresizingMaskIntoConstraints = false;
    jginput.topAnchor.constraint(equalTo: formContainer.topAnchor, constant: CGFloat(borderWidth)).isActive = true
    jginput.leftAnchor.constraint(equalTo: formContainer.leftAnchor, constant: CGFloat(borderWidth)).isActive = true
    jginput.widthAnchor.constraint(equalToConstant: inputWidth).isActive = true
    jginput.heightAnchor.constraint(equalToConstant: 30).isActive = true
//    
    jginput2.translatesAutoresizingMaskIntoConstraints = false;
    jginput2.topAnchor.constraint(equalTo: jginput.bottomAnchor, constant: 0).isActive = true
    jginput2.leftAnchor.constraint(equalTo: formContainer.leftAnchor, constant: CGFloat(borderWidth)).isActive = true
    jginput2.widthAnchor.constraint(equalToConstant: inputWidth).isActive = true
    jginput2.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    var isValid: Bool = true;
    var errorMessage: String = ""
    let lengthOfNewString: Int = string == "" ? (textField.text?.characters.count)! - 1 : (textField.text?.characters.count)! + 1
    
    switch textField.tag {
    case jginput.tag:
      (jginput.text as NSString).replacingCharacters(in: range, with: string)
      isValid = lengthOfNewString <= 3
      if (isValid) {
        jginput.isValid = true
        jginput.errorText = ""
      } else {
        jginput.isValid = false
        errorMessage = "Email is not valid"
        jginput.errorText = errorMessage;
      }
      return true
    case jginput2.tag:
      (jginput2.text as NSString).replacingCharacters(in: range, with: string)
      isValid = lengthOfNewString <= 3
      if (isValid) {
        jginput2.isValid = true
        jginput2.errorText = ""
      }else{
        jginput2.isValid = false
        errorMessage = "Email is not valid"
        jginput2.errorText = errorMessage;
      }
      return true
    default:
      return true
    }
  }
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    return true
  }
  public func textFieldDidBeginEditing(_ textField: UITextField) {
    switch textField.tag {
    case jginput.tag:
      jginput.labelColor = UIColor.init(colorLiteralRed: 0.086, green: 0.451, blue: 0.902, alpha: 1.00)
    case jginput2.tag:
      jginput2.labelColor = UIColor.init(colorLiteralRed: 0.086, green: 0.451, blue: 0.902, alpha: 1.00)
    default: break
    }
    
  }
  
  public func textFieldDidEndEditing(_ textField: UITextField) {
    switch textField.tag {
    case jginput.tag:
      jginput.labelColor = UIColor.gray
    case jginput2.tag:
      jginput2.labelColor = UIColor.gray
    default: break
    }
  }
}

