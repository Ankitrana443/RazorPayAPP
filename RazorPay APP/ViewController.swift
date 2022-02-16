//
//  ViewController.swift
//  RazorPay APP
//
//  Created by Ankit Rana on 16/02/22.
//

import UIKit
import Razorpay



class ViewController: UIViewController ,RazorpayPaymentCompletionProtocol{

    
    var razorpay: RazorpayCheckout!
    private let testkey = "rzb_test_lAQjBGYqCzFRvu"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        razorpay = RazorpayCheckout.initWithKey(testkey, andDelegate: self)
    }

    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "RazorPayApp", message: str, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.view.window?.rootViewController?.present(alert,animated: true,completion: nil)
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        let alert = UIAlertController(title: "RazorPayApp", message: payment_id, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.view.window?.rootViewController?.present(alert,animated: true,completion: nil)
    }
    internal func showpaymentform()
    {
        let option:[String:Any] = ["ammount":"100","description":"test","image":"https://miro.medium.com/max/1400/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg","name":"ankitrana","prifill":[
            "contact":"9457636803","email":"abc@gmail.com"
        ],"theme":["color":"#c4c3c6"]
        ]
        razorpay.open(option)
        
    }
    
    @IBOutlet var btn: UIView!
    @IBAction func button(_ sender: Any) {
        self.showpaymentform()
    }
    
}

