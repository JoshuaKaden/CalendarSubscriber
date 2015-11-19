//
//  TapButton.swift
//  ThreeOneOne
//
//  Created by Kaden, Joshua on 10/26/15.
//  Copyright © 2015 NYC DoITT. All rights reserved.
//

import UIKit

typealias TapAction = () -> Void

class TapButton: UIButton {
    
    var tapAction: TapAction?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: "performTapAction", forControlEvents: .TouchUpInside)
    }
    
    func performTapAction() {
        if let tapAction = self.tapAction {
            tapAction()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
