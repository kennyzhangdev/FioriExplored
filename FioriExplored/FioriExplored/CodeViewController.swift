//
//  CodeViewController.swift
//  FioriExplored
//
//  Created by Zhang, Kenny on 4/18/17.
//  Copyright © 2017 Kenny. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController {
    public var controlType :String = ""
    
    @IBOutlet weak var codeWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Code"

        
        let url = Bundle.main.url(forResource: "\(self.controlType)", withExtension: "html", subdirectory: "Code")
        self.codeWebView.scalesPageToFit = true
        self.codeWebView.contentMode = .scaleAspectFit
        self.codeWebView.loadRequest(URLRequest(url: url!))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
