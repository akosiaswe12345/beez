//
//  UIViewExtension.swift
//  MVP
//
//  Created by Taison Digital on 09/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import Foundation
import UIKit

// color hex

public func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

// border radius

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

// hide and show password

class UIShowHideTextField: UITextField {

    let rightButton  = UIButton(type: .custom)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        let image = UIImage(named: "showpass")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        rightButton.setImage(tintedImage , for: .normal)
        rightButton.tintColor = hexStringToUIColor(hex: Constant.Color.PRIMARY_COLOR)
        rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
        rightButton.frame = CGRect(x:0, y:0, width:30, height:30)

        rightViewMode = .always
        rightView = rightButton
        isSecureTextEntry = true
    }

    @objc
    func toggleShowHide(button: UIButton) {
        toggle()
    }

    func toggle() {
        isSecureTextEntry = !isSecureTextEntry
        if isSecureTextEntry {
            let image = UIImage(named: "showpass")
            let tintedImage = image?.withRenderingMode(.alwaysTemplate)
            rightButton.setImage(tintedImage , for: .normal)
            rightButton.tintColor = hexStringToUIColor(hex: Constant.Color.PRIMARY_COLOR)
        } else {
            let image = UIImage(named: "hidepass")
            let tintedImage = image?.withRenderingMode(.alwaysTemplate)
            rightButton.setImage(tintedImage , for: .normal)
            rightButton.tintColor = hexStringToUIColor(hex: Constant.Color.PRIMARY_COLOR)
           
        }
    }

}

enum ValueType: Int {
    case none
    case onlyLetters
    case onlyNumbers
    case phoneNumber   // Allowed "+0123456789"
    case alphaNumeric
    case fullName       // Allowed letters and space
}

class SDCTextField: UITextField {
    
    @IBInspectable var maxLength: Int = 0 // Max character length
    var valueType: ValueType = ValueType.none // Allowed characters

    /************* Added new feature ***********************/
    // Accept only given character in string, this is case sensitive
    @IBInspectable var allowedCharInString: String = ""

    func verifyFields(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch valueType {
        case .none:
            break // Do nothing
            
        case .onlyLetters:
            let characterSet = CharacterSet.letters
            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            }
            
        case .onlyNumbers:
            let numberSet = CharacterSet.decimalDigits
            if string.rangeOfCharacter(from: numberSet.inverted) != nil {
                return false
            }
            
        case .phoneNumber:
            let phoneNumberSet = CharacterSet(charactersIn: "+0123456789")
            if string.rangeOfCharacter(from: phoneNumberSet.inverted) != nil {
                return false
            }
            
        case .alphaNumeric:
            let alphaNumericSet = CharacterSet.alphanumerics
            if string.rangeOfCharacter(from: alphaNumericSet.inverted) != nil {
                return false
            }
            
        case .fullName:
            var characterSet = CharacterSet.letters
            print(characterSet)
            characterSet = characterSet.union(CharacterSet(charactersIn: " "))
            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            }
        }
        
        if let text = self.text, let textRange = Range(range, in: text) {
            let finalText = text.replacingCharacters(in: textRange, with: string)
            if maxLength > 0, maxLength < finalText.utf8.count {
                return false
            }
        }

        // Check supported custom characters
        if !self.allowedCharInString.isEmpty {
            let customSet = CharacterSet(charactersIn: self.allowedCharInString)
            if string.rangeOfCharacter(from: customSet.inverted) != nil {
                return false
            }
        }
        
        return true
    }
}

extension UIViewController {

func presentAlert(withTitle title: String, message : String) {
  let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
  let OKAction = UIAlertAction(title: "OK", style: .default) { action in
      print("You've pressed OK Button")
  }
  alertController.addAction(OKAction)
  self.present(alertController, animated: true, completion: nil)
}
}
