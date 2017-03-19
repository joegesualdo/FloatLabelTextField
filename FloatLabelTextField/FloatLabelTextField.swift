//
//  JGInput.swift
//  FloatLabelTextField
//
//  Created by Joe Gesualdo on 3/9/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import UIKit

protocol FloatLabelTextFieldDelegate: UITextFieldDelegate {
}

public class FloatLabelTextField: UIView , UITextFieldDelegate {
  var delegate: FloatLabelTextFieldDelegate?
  private var customInputContainer: UIView
  private var customInputView: UITextField
  private var inputPlaceholder: UILabel
  private var inputLabelView: UILabel
  private var inputErrorView: UILabel
  private var label: String
  private var inputLabelViewColor: UIColor
  private var placeholder: String
  private var hasError: Bool
  private var inputTag: Int
  private var errorInputViewText: String
  var labelColor: UIColor {
    get {
      return inputLabelViewColor;
    }
    set(newLabelColor) {
      inputLabelViewColor = newLabelColor
      inputLabelView.textColor = inputLabelViewColor
    }
  }
  var errorText: String {
    get {
      return errorInputViewText;
    }
    set(newErrorText) {
      errorInputViewText = newErrorText
      inputErrorView.text = errorInputViewText
    }
  }
  var isValid: Bool {
    get {
      return !hasError
    }
    set(newError) {
      hasError = newError
//      inputLabelView.textColor = error ? UIColor.red : UIColor.black
    }
  }
  override public var tag: Int {
    get {
      return inputTag
    }
    set(newTag) {
      inputTag = newTag
      customInputView.tag = newTag
    }
  }
  var text: String {
    get {
      if let text = customInputView.text {
        return text
      }
      return ""
    }
    set(newText) {
      customInputView.text = newText
    }
  }
  
  public init(label: String, placeholder: String) {
    self.customInputContainer = UIView(frame: CGRect.zero)
    self.customInputView = UITextField(frame: CGRect.zero)
    self.inputPlaceholder = UILabel(frame: CGRect.zero)
    self.inputLabelView = UILabel(frame: CGRect.zero)
    self.inputErrorView = UILabel(frame: CGRect.zero)
    
    self.label = label
    self.hasError = false
    self.inputTag = customInputView.tag
    self.inputLabelViewColor = UIColor.gray
    self.errorInputViewText = ""
    self.placeholder = placeholder
    
    super.init(frame: CGRect.zero)
    
    setupViews()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    customInputContainer.backgroundColor = UIColor.clear
    
    customInputView.delegate = self
    customInputView.backgroundColor = UIColor.clear
    customInputView.font = UIFont(name: "Roboto-Regular", size: 12)
    
    inputLabelView.alpha = 0.0
    inputLabelView.text = self.label
    inputLabelView.backgroundColor = UIColor.clear
    inputLabelView.font = UIFont(name: "Roboto-Regular", size: 8)
    inputLabelView.textColor = labelColor
    
    inputErrorView.textColor = UIColor.red
    inputErrorView.font = UIFont(name: "Roboto-Regular", size: 8)
    
    inputPlaceholder.text = self.placeholder
    inputPlaceholder.font = UIFont(name: "Roboto-Regular", size: 12)
    inputPlaceholder.textColor = UIColor.init(colorLiteralRed: 0.757, green: 0.757, blue: 0.757, alpha: 1.00)
    inputPlaceholder.backgroundColor = UIColor.clear
    
    self.addSubview(customInputContainer)
    self.addSubview(customInputView)
    self.addSubview(inputLabelView)
    self.addSubview(inputErrorView)
    self.addSubview(inputPlaceholder)
    
    customInputContainer.translatesAutoresizingMaskIntoConstraints = false;
    customInputContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    customInputContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    customInputContainer.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    customInputContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    customInputView.translatesAutoresizingMaskIntoConstraints = false;
    customInputView.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 10).isActive = true
    customInputView.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 5).isActive = true
    customInputView.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
    customInputView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    inputLabelView.translatesAutoresizingMaskIntoConstraints = false;
    inputLabelView.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 2).isActive = true
    inputLabelView.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 5).isActive = true
    inputLabelView.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
    inputLabelView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    
    setupInputViewConstraints()
    
    inputPlaceholder.translatesAutoresizingMaskIntoConstraints = false;
    inputPlaceholder.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 0).isActive = true
    inputPlaceholder.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 5).isActive = true
    inputPlaceholder.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
    inputPlaceholder.heightAnchor.constraint(equalTo: customInputContainer.heightAnchor, constant: 0).isActive = true
  }
  
  func setupInputViewConstraints() {
    inputErrorView.translatesAutoresizingMaskIntoConstraints = false;
    inputErrorView.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 2).isActive = true
    inputErrorView.rightAnchor.constraint(equalTo: customInputContainer.rightAnchor, constant: -5).isActive = true
    inputErrorView.heightAnchor.constraint(equalToConstant: 10).isActive = true
  }
  
  public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    if let delegate = self.delegate {
      if delegate.responds(to: #selector(UITextFieldDelegate.textFieldShouldBeginEditing(_:))) {
        return delegate.textFieldShouldBeginEditing!(textField)
      }
    }
    return true;
  }
  public func textFieldDidBeginEditing(_ textField: UITextField) {
    fadeOut(viewToFadeOut: self.inputPlaceholder)
    fadeIn(viewToFadeIn: inputLabelView)
    self.delegate?.textFieldDidBeginEditing!(textField)
  }
  
  public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    if let delegate = self.delegate {
      if delegate.responds(to: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:))) {
        return delegate.textFieldShouldEndEditing!(textField)
      }
    }
    return true;
  }
  
  public func textFieldDidEndEditing(_ textField: UITextField) {
    if ((textField.text?.characters.count)! < 1) {
      fadeIn(viewToFadeIn: inputPlaceholder)
      fadeOut(viewToFadeOut: inputLabelView)
    }
    self.delegate?.textFieldDidEndEditing!(textField)
  }
  
  public func textFieldShouldClear(_ textField: UITextField) -> Bool {
    if let delegate = self.delegate {
      if delegate.responds(to: #selector(UITextFieldDelegate.textFieldShouldClear(_:))) {
        return delegate.textFieldShouldClear!(textField)
      }
    }
    return true
  }
  
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let delegate = self.delegate {
      if delegate.responds(to: #selector(UITextFieldDelegate.textFieldShouldReturn(_:))) {
        return delegate.textFieldShouldReturn!(textField)
      }
    }
    return true
  }
  
  public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if let delegate = self.delegate {
      if delegate.responds(to: #selector(UITextFieldDelegate.textField(_:shouldChangeCharactersIn:replacementString:))) {
        return delegate.textField!(textField, shouldChangeCharactersIn: range, replacementString: string)
      }
      // We don't check for the selector here because textFieldIsValid is required
    }
    return true;
    
//    text = (text as NSString).replacingCharacters(in: range, with: string)
//    
    
    // TODO: This needs to call the delegate methdo
  }
  
  func fadeOut(viewToFadeOut: UIView){
    // Move our fade out code from earlier
    UIView.animate(
      withDuration: 0.5,
      delay: 0.0,
      options: .transitionCurlUp,
      animations: {
       viewToFadeOut.alpha = 0.0
      },
      completion: { finished in
        if finished {
        }
      }
    )
  
  }
  
  func fadeIn(viewToFadeIn: UIView) {
    UIView.animate(
      withDuration: 0.5,
      delay: 0.0,
      options: .transitionCurlDown,
      animations: {
        viewToFadeIn.alpha = 1.0
      },
      completion: { finished in
        if finished {
        }
      }
    )
  }
}
