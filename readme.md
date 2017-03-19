## FloatLabelTextField
> Fancy TextFields with floating labels and error messages.

## Install
```ruby
# Podfile
pod 'FloatLabelTextField', '~> 1.0.3'
```

## Example
#### Single Input
![FloatLabelTextField-demo](https://github.com/joegesualdo/FloatLabelTextField/raw/master/FloatLabelTextField_demo.gif)
#### Combine Multiple Inputs
![FloatLabelTextField-form-demo](https://github.com/joegesualdo/FloatLabelTextField/raw/master/FloatLabelTextField_form_demo.gif)

## Usage
```Swift
class ViewController: UIViewController, FloatLabelTextFieldDelegate {
  let firstNameTextField = FloatLabelTextField(
    label: "First name",
    placeholder: "First name"
  )
  override func viewDidLoad() {
    firstNameTextField.delegate = self
    firstNameTextField.tag = 0

    // Positioning and sizing
    firstNameTextField.translatesAutoresizingMaskIntoConstraints = false;
    firstNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    firstNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    firstNameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
    firstNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true

    view.addSubview(firstNameTextField)
  }
  ...
}

// FloatLabelTextViewDelegate Methods
public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
  var isValid: Bool = true;
  var errorMessage: String = ""
  let lengthOfNewString: Int = string == "" ? (textField.text?.characters.count)! - 1 : (textField.text?.characters.count)! + 1

  switch textField.tag {
  case firstNameTextField.tag:
    isValid = lengthOfNewString <= 3
    if (isValid) {
      firstNameTextField.isValid = true
      firstNameTextField.errorText = ""
    } else {
      firstNameTextField.isValid = false
      errorMessage = "Email is not valid"
      firstNameTextField.errorText = errorMessage;
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
  case firstNameTextField.tag:
    firstNameTextField.labelColor = UIColor.init(colorLiteralRed: 0.086, green: 0.451, blue: 0.902, alpha: 1.00)
  default: break
  }
  
}
public func textFieldDidEndEditing(_ textField: UITextField) {
  switch textField.tag {
  case firstNameTextField.tag:
    firstNameTextField.labelColor = UIColor.gray
  default: break
  }
}
```

# Setups Steps
### ViewController should conform to `FloatLabelTextFieldDelegate`
```swift
class ViewController: UIViewController, FloatLabelTextFieldDelegate {
  ...
}
```
### Define and declare the float text field
```swift
let firstNameTextField = FloatLabelTextField(
  label: "First name",
  placeholder: "First name"
)
```

### Specify the float text field's delegate
```swift
...
override func viewDidLoad() {
  firstNameTextField.delegate = self
  firstNameTextField.tag = 0
  ...
}
```

### Position the float text field
```swift
override func viewDidLoad() {
  ...
  firstNameTextField.translatesAutoresizingMaskIntoConstraints = false;
  firstNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
  firstNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
  firstNameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
  firstNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
  ...
}
```
### Add the float text field as a subview
```swift
override func viewDidLoad() {
  ...
  view.addSubview(firstNameTextField)
}
```

### Add the `FloatLabelTextFieldDelegate` methods
```swift
public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
  ...
}

func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
  return true
}
public func textFieldDidBeginEditing(_ textField: UITextField) {
  ...
}

public func textFieldDidEndEditing(_ textField: UITextField) {
  ...
}
```


## License
MIT © [Joe Gesualdo]()
