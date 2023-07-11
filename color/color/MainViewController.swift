//
//  MainViewController.swift
//  color
//
//  Created by imac-2437 on 2023/7/5.0
//

import UIKit

class MainViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var palatte: UIImageView!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var blueValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redValue.delegate=self
        greenValue.delegate=self
        blueValue.delegate=self
        
    }
    
    
    func textField(_ textField : UITextField,shouldChangeCharactersIn range :NSRange,replacementString string : String) ->Bool{
        let length = string.lengthOfBytes(using: String.Encoding.utf8)
        for loopIndex in 0..<length{
            let char = ( string as NSString).character(at: loopIndex)
            if char < 48{
                textField.text="0"
                return false
            }
            if char > 57{
                textField.text="0"
                return false
            }
        }
        return true
    }
    
    
    @IBAction func SliderSum(_ sender: UISlider){
        palatte.backgroundColor = UIColor(
            red: CGFloat(redSlider.value / 255),
            green: CGFloat(greenSlider.value / 255),
            blue: CGFloat(blueSlider.value / 255),
            alpha: 1
        )
        
        //        palatte.backgroundColor = UIColor(
        //            red: CGFloat((redSlider.value)/255),
        //            green: CGFloat((greenSlider.value)/255),
        //            blue: CGFloat((blueSlider.value)/255),
        //            alpha: 1
        //
        //        )
    }
    
    @IBAction func SliderToText(_ sender: UISlider){
        redValue.text = "\(Int(redSlider.value))"
        greenValue.text = "\(Int(greenSlider.value))"
        blueValue.text = "\(Int(blueSlider.value))"
    }
    
    @IBAction func textsum(_sender: Any){
        if let redv  = Double( redValue.text ?? ""),
           let greenv  = Double(greenValue.text ?? ""),
           let bluev  = Double(blueValue.text ?? ""){
            let intRed = Int(redv)
            let intBlue = Int(bluev)
            let intGreen = Int(greenv)

            redValue.text="\(String(intRed % Int(256.0)))"
            greenValue.text="\(String(intGreen % Int(256.0)))"
            blueValue.text="\(String(intBlue % Int(256.0)))"
            palatte.backgroundColor=UIColor(
                red: CGFloat( (redv)/255),green : CGFloat( (greenv)/255),blue: CGFloat ((bluev)/255),alpha: 1)
        }
        
    }
    
    @IBAction func TextToSlider(_ sender: Any){
        
        
        if let RedStringValue = redValue.text{
            if let RedIntValue = Int(RedStringValue){
                if RedIntValue > 255 {
                    redValue.text="\(255)"
                }
                if RedIntValue < 0{
                    redValue.text="\(0)"
                }
                redSlider.setValue(Float(RedIntValue), animated: true)
            }
        }
        if let GreenStringValue = greenValue.text{
            if let GreenIntValue = Int(GreenStringValue){
                if GreenIntValue > 255 {
                    greenValue.text="\(255)"
                }
                if GreenIntValue < 0{
                    greenValue.text="\(0)"
                }
                greenSlider.setValue(Float(GreenIntValue), animated: true)
            }
        }
        if let BlueStringValue = blueValue.text{
            if let BlueIntValue = Int(BlueStringValue){
                if BlueIntValue > 255 {
                    blueValue.text="\(255)"
                }
                if BlueIntValue < 0{
                    blueValue.text="\(0)"
                }
                blueSlider.setValue(Float(BlueIntValue), animated: true)
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
