

import UIKit

extension UIView {

    @IBInspectable var cornerRadius : CGFloat {get {
    
            return layer.cornerRadius
        }
        
        set {
        
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

extension UITextField {
    
    /// set icon of 20x20 with left padding of 8px
    func setLeftIcon(_ icon: UIImage, textField: UITextField) {
        
        let leftImageView = UIImageView()
        leftImageView.contentMode = .scaleAspectFit
        let leftView = UIView()
        leftView.frame = CGRect(x: 20, y: 0, width: 25, height: 20)
        leftImageView.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        leftImageView.image = icon
        leftView.addSubview(leftImageView)
        textField.rightViewMode = UITextFieldViewMode.always
        textField.rightViewMode = .always
        textField.rightView = leftView
    }
}


extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

