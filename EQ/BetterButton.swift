//
//  BetterButton.swift
//  EQ
//
//  Created by Alexander Warren on 3/17/18.
//  Copyright © 2018 Alexander Warren. All rights reserved.
//

import UIKit

class BetterButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tintColor = #colorLiteral(red: 1, green: 0, blue: 0.1158826245, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
