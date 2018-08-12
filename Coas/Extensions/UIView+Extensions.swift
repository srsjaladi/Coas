

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
     @IBInspectable var setLeftIcon: UIImage? {
        get
        {
            return UIImage(named: "DownArrow")
        }
        set
        {
            let leftImageView = UIImageView()
            leftImageView.contentMode = .scaleAspectFit
            let leftView = UIView()
            leftView.frame = CGRect(x: 0, y: 0, width: 25, height: 20)
            leftImageView.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
            leftImageView.image = setLeftIcon
            leftView.addSubview(leftImageView)
            self.rightViewMode = UITextFieldViewMode.always
            self.rightViewMode = .always
            self.rightView = leftView
        }
    }
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
}

extension String {
    func isEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$",
                                             options: [.caseInsensitive])
        return regex.firstMatch(in: self, options:[],
                                range: NSMakeRange(0, utf16.count)) != nil
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

