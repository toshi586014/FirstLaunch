//
//  ViewController.swift
//  FirstLaunch
//
//  Created by Toshiaki Nakamura on 2016/03/23.
//  Copyright © 2016年 Toshiaki Nakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ud = NSUserDefaults.standardUserDefaults()
    let key = "isFirstLaunch"
    
    @IBOutlet weak var tutorialView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tutorialView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 初回起動の場合はregisterDefaultsでtrueを設定しているのでチュートリアル画面を表示する
        let isFirstLaunch = self.ud.boolForKey(self.key)
        if isFirstLaunch {
            self.tutorialView.hidden = false
        }
    }
    
    @IBAction func pushCloseButton(sender: AnyObject) {
        // チュートリアルが終わったら初回起動フラグをfalseにする
        self.ud.setBool(false, forKey: self.key)
        self.ud.synchronize()
        
        self.tutorialView.hidden = true
    }
    
    @IBAction func pushAgainButton(sender: AnyObject) {
        self.ud.removeObjectForKey(self.key)
        self.ud.synchronize()
    }
}

