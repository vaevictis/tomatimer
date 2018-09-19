//
//  TimerInterfaceController.swift
//  watch Extension
//
//  Created by guillaume on 19/9/18.
//  Copyright © 2018 black rope studio. All rights reserved.
//

import WatchKit
import Foundation


class TimerInterfaceController: WKInterfaceController {
    @IBOutlet var timerLabel: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        timerLabel.setText("coucou")
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

}
