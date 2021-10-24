//
//  ViewController.swift
//  ReversWordTest
//
//  Created by Andrey Boyko on 25.09.2021.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var textField: CustomTextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var userText: ClassOfString?
    let app = UIApplication.shared
    //var reversClearSwitch = true
    
    override func setNeedsStatusBarAppearanceUpdate() {
        
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.borderStyle = .none
        resultButton.layer.cornerRadius = 14
        titleLabel.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        resultButton.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
    }
    
    @IBAction func tapResultButton(_ sender: Any) {
        guard let _ = sender as? UIButton,
              let text = textField.text
        else { return }
        
        if textField.hasText != true {
            resultButton.titleLabel?.text = "Clear"
        } else {
            
            if let textButton = resultButton.titleLabel?.text {
                switch textButton {
                case "Reverse":
                    userText = ClassOfString.init(userString: text + " ", reverseString: text + " ")
                    guard let result = userText?.reverseString else  { return }
                    textView.text += result + "\n"
                    
                    textField.underlined(text: textButton)
                    resultButton.setTitle("Clear", for: .normal)
                    
                    
                case "Clear":
                    textField.text = ""
                    textView.text = ""
                    textField.underlined(text: textButton)
                    resultButton.setTitle("Reverse", for: .normal)
                    
                default:
                    return
                }
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let customTextField = textField as? CustomTextField {
            customTextField.underlined(text: "")
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let customTextField = textField as? CustomTextField {
                    customTextField.underlined(text: "Clear")
                }

    }
}

extension UIApplication {
    
    var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    var statusBarUIView: UIView? {
        
        if #available(iOS 13.0, *) {
            let tag = 3848245
            
            let keyWindow: UIWindow? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            
            if let statusBar = keyWindow?.viewWithTag(tag) {
                
                return statusBar
            } else {
                
                let height = keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
                let statusBarView = UIView(frame: height)
                statusBarView.tag = tag
                statusBarView.layer.zPosition = 999999
                
                keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
            
        } else {
            
            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
        }
        return nil
    }
}

class CustomTextField: UITextField {
    lazy var border: CALayer = {
        let border = CALayer()
        let width = CGFloat(1.0)

        border.borderColor = UIColor.blue.cgColor
        border.frame = CGRect(x: 16, y: self.frame.size.height - width, width:  self.frame.size.width - 32, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        return border
    }()
    
    public func underlined(text: String){
        print(text)
        UIView.animate(withDuration: 1) {
            self.border.opacity = text == "Clear" ? 0 : 1
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }

}
