//
//  LocalAccessbility - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currencyLabel: UILabel!
    
    let locale = Locale.current
    let testLocale = Locale(identifier: "fr_FR")
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private func addBottomLabel() {
        // Do any additional setup after loading the view.
        
        let bottomLabel = UILabel()
        bottomLabel.frame = CGRect(x: 20, y: view.bounds.size.height - 150, width: view.bounds.size.width - 40, height: 50)
        
        bottomLabel.text = "Touch the button below!".localized
        
        bottomLabel.font = UIFont.systemFont(ofSize: 20)
        
        bottomLabel.textColor = .red
        
        bottomLabel.textAlignment = .center
        
        view.addSubview(bottomLabel)
    }
    private func addButton() {
        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: view.bounds.size.height - 80, width: view.bounds.size.width - 40, height: 50)
        
        button.setTitle("Touch Me!".localized, for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        button.setTitleColor(.blue, for: .normal)
        
        view.addSubview(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomLabel()
        addButton()
        
        currency()
        numbers()
        date()
        
        view.semanticContentAttribute = .forceRightToLeft
    }
    
    func currency() {
        let price = 3000.33 as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = locale.currencyCode
        formatter.locale = locale
        formatter.string(from: price)
        currencyLabel.text = formatter.string(from: price)
    }
    
    func numbers() {
        let quantity = NumberFormatter.localizedString(from: 5000, number: .decimal)
        numberLabel.text = String.localizedStringWithFormat(quantity)
    }
    
    func date() {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        dateLabel.text = date
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
