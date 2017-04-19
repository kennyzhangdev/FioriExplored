//
//  SampleViewController.swift
//  FioriExplored
//
//  Created by Zhang, Kenny on 4/12/17.
//  Copyright © 2017 Kenny. All rights reserved.
//

import UIKit
import SAPFiori

class SampleViewController: UIViewController {
    
    private var controlType :String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.controlType
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Code", style: .done, target: self, action: #selector(showCode))
        
        // Do any additional setup after loading the view.
        switch self.controlType {
        case "FUIWelcomeScreen":
            let vc = FUIWelcomeScreen.createInstanceFromStoryboard()
            vc.state = .isConfigured  // shows version2 of the launch screen
            vc.welcomeLabel.text = "Welcome Label"
            vc.welcomeDetailLabel.text = "Welcome Detail: Thank you for downloading SAP Project Companion for Managers."
            vc.instructionTextView.text = "This is instructionTextView text, don't worry, you can comment this code to see the default text"
            vc.signInButton.setTitle("Login", for: UIControlState.normal)
            vc.signInButton.addTarget(self, action: #selector(navBack), for: UIControlEvents.touchUpInside)
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "FUIObjectHeader":
            let objectHeader = FUIObjectHeader()
            self.view.addSubview(objectHeader)
            var tempFrame = objectHeader.frame
            tempFrame.size.width = self.view.frame.width
            objectHeader.frame = tempFrame
            objectHeader.headlineLabel.text = "Inspect Electric Pump Motor Long Job Title Example Will Wrap Max# of Lines in the HeadlineLabel"
            objectHeader.subheadlineLabel.text = "Job 819701."
            objectHeader.tags = [FUITag(title: "Started"), FUITag(title: "PM01"), FUITag(title: "103-Repair")]
            objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK."
            objectHeader.footnoteLabel.text = "Due on 12/31/16."
            objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days Urgent and needs attentions.  Temperature sensor predicts overheating failure in 4 days Urgent and needs attentions."
            objectHeader.statusLabel.text = "High"
            objectHeader.detailImage = UIImage.init(named: "HT-1000.jpg")
            objectHeader.statusImage = UIImage.init(named: "cloud.png")
            
        case "FUIObjectTableViewCell":
            self.performSegue(withIdentifier: "toSampleTableView", sender: self)
            
        case "CollectionView":
            self.performSegue(withIdentifier: "toSampleCollectionView", sender: self)
        case "FUIContactCell":
            self.performSegue(withIdentifier: "toSampleTableView", sender: self)
            
        case "FUITimelineCell":
            self.performSegue(withIdentifier: "toSampleTableView", sender: self)
        case "FUITimelineMarkerCell":
            self.performSegue(withIdentifier: "toSampleTableView", sender: self)
        case "FUIKPIView":
            
            
            let kpiView = FUIKPIView(frame: CGRect())
            self.view.addSubview(kpiView)
            
            
            let unit = FUIKPIUnitItem(string: "$")
            let metric = FUIKPIMetricItem(string: "294")
            let unit2 = FUIKPIUnitItem(string: "USD")
            kpiView.items = [unit, metric, unit2]
            kpiView.captionlabel.text = "KPI View: Documents Example of Two Line Wrap"
            
            self.view.addConstraint(NSLayoutConstraint(item: kpiView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 100))
            self.view.addConstraint(NSLayoutConstraint(item: kpiView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 50))
            
            
            let icon = FUIKPIIconItem(icon: UIImage.init(named: "cloud.png")!)
            let metric2 = FUIKPIMetricItem(string: "2")
            
            
            let kpiIconView = FUIKPIView(frame: CGRect())
            
            kpiIconView.items = [icon, metric2, unit2]
            kpiIconView.captionlabel.text = "KPI icon View: Documents Example of Two Line Wrap"
            
            self.view.addSubview(kpiIconView)
            
            self.view.addConstraint(NSLayoutConstraint(item: kpiIconView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: kpiView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 50))
            self.view.addConstraint(NSLayoutConstraint(item: kpiIconView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: kpiView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
            
        case "FUIFormTableViewController":
            
            self.performSegue(withIdentifier: "toSampleFormTableView", sender: self)
            
        case "FeedbackIndicators":
            
            //FUIToastMessage begin
            let toastButton = FUIButton()
            toastButton.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            toastButton.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            toastButton.setTitle("FUIToastMessage", for: .normal)
            toastButton.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            
            self.view.addSubview(toastButton)
            toastButton.frame = CGRect.init(x: 10, y: 10, width: 150, height: 50)
            toastButton.addTarget(self, action:#selector(toastPressed(sender:)), for: UIControlEvents.touchUpInside)
            //FUIToastMessage end
            
            //FUIBannerMessageView begin
            let bannerButton = FUIButton()
            bannerButton.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            bannerButton.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            bannerButton.setTitle("FUIBannerMessageView", for: .normal)
            bannerButton.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(bannerButton)
            bannerButton.frame = CGRect.init(x: 10, y: 70, width: 250, height: 50)
            bannerButton.addTarget(self, action:#selector(bannerPressed(sender:)), for: UIControlEvents.touchUpInside)
            //FUIBannerMessageView end
            
            //FUILoadingIndicatorView begin
            let loadingIndicatorButton = FUIButton()
            loadingIndicatorButton.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            loadingIndicatorButton.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            loadingIndicatorButton.setTitle("FUILoadingIndicatorView", for: .normal)
            loadingIndicatorButton.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(loadingIndicatorButton)
            loadingIndicatorButton.frame = CGRect.init(x: 10, y: 130, width: 250, height: 50)
            loadingIndicatorButton.addTarget(self, action:#selector(loadingIndicatorPressed), for: UIControlEvents.touchUpInside)
            //FUILoadingIndicatorView end
            
            //FUIModalLoadingIndicatorView begin
            let modalLoadingIndicatorBtn = FUIButton()
            modalLoadingIndicatorBtn.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            modalLoadingIndicatorBtn.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            modalLoadingIndicatorBtn.setTitle("FUIModalLoadingIndicatorView", for: .normal)
            modalLoadingIndicatorBtn.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(modalLoadingIndicatorBtn)
            modalLoadingIndicatorBtn.frame = CGRect.init(x: 10, y: 190, width: 250, height: 50)
            modalLoadingIndicatorBtn.addTarget(self, action:#selector(modalLoadingIndicatorPressed), for: UIControlEvents.touchUpInside)
            //FUIModalLoadingIndicatorView end
            
            //FUIProcessingIndicatorView begin
            let processingIndicatorBtn = FUIButton()
            processingIndicatorBtn.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            processingIndicatorBtn.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            processingIndicatorBtn.setTitle("FUIProcessingIndicatorView", for: .normal)
            processingIndicatorBtn.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(processingIndicatorBtn)
            processingIndicatorBtn.frame = CGRect.init(x: 10, y: 250, width: 250, height: 50)
            processingIndicatorBtn.addTarget(self, action:#selector(processingIndicatorPressed), for: UIControlEvents.touchUpInside)
            //FUIProcessingIndicatorView end
            
            //FUIModalProcessingIndicator begin
            let modalProcessingIndicatorBtn = FUIButton()
            modalProcessingIndicatorBtn.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            modalProcessingIndicatorBtn.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            modalProcessingIndicatorBtn.setTitle("FUIModalProcessingIndicator", for: .normal)
            modalProcessingIndicatorBtn.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(modalProcessingIndicatorBtn)
            modalProcessingIndicatorBtn.frame = CGRect.init(x: 10, y: 310, width: 250, height: 50)
            modalProcessingIndicatorBtn.addTarget(self, action:#selector(modalProcessingIndicatorPressed), for: UIControlEvents.touchUpInside)
            //FUIModalProcessingIndicator end
            
            //FUICheckoutIndicatorView begin
            let checkoutIndicatorBtn = FUIButton()
            checkoutIndicatorBtn.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            checkoutIndicatorBtn.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            checkoutIndicatorBtn.setTitle("FUICheckoutIndicatorView", for: .normal)
            checkoutIndicatorBtn.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(checkoutIndicatorBtn)
            checkoutIndicatorBtn.frame = CGRect.init(x: 10, y: 370, width: 250, height: 50)
            checkoutIndicatorBtn.addTarget(self, action:#selector(checkoutIndicatorPressed(sender:)), for: UIControlEvents.touchUpInside)
            //FUICheckoutIndicatorView end
            
            //FUIModalCheckoutViewController begin
            let checkoutVCBtn = FUIButton()
            checkoutVCBtn.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            checkoutVCBtn.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            checkoutVCBtn.setTitle("FUIModalCheckoutViewController", for: .normal)
            checkoutVCBtn.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(checkoutVCBtn)
            checkoutVCBtn.frame = CGRect.init(x: 10, y: 430, width: 250, height: 50)
            checkoutVCBtn.addTarget(self, action:#selector(checkoutVCPressed), for: UIControlEvents.touchUpInside)
            //FUIModalCheckoutViewController end
            
            //FUIFeedbackScreen begin
            let feedbackScreenBtn = FUIButton()
            feedbackScreenBtn.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            feedbackScreenBtn.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            feedbackScreenBtn.setTitle("FUIFeedbackScreen", for: .normal)
            feedbackScreenBtn.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(feedbackScreenBtn)
            feedbackScreenBtn.frame = CGRect.init(x: 10, y: 490, width: 250, height: 50)
            feedbackScreenBtn.addTarget(self, action:#selector(feedbackScreenPressed), for: UIControlEvents.touchUpInside)
            //FUIFeedbackScreen end
            
        case "SupportingTypes":
            //FUILabel
            let label = FUILabel.init(frame: CGRect())
            label.text = "FUILabel"
            self.view.addSubview(label)
            label.frame = CGRect.init(x: 10, y: 10, width: 150, height: 50)
            label.onChangeHandler = { newValue in
                print("Label Changed to \(String(describing: newValue))")
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute: {
                label.text = "FUILabel Changed"
            })
            
            //FUIImageView
            let imageView = FUIImageView(image: UIImage(named: "avatar.png"))
            imageView.isCircular = true
            self.view.addSubview(imageView)
            imageView.frame = CGRect.init(x: 10, y: 70, width: 50, height: 50)
            
            let imageLabel = FUILabel.init(frame: CGRect())
            imageLabel.text = "<- FUIImageView"
            self.view.addSubview(imageLabel)
            imageLabel.frame = CGRect.init(x: 70, y: 70, width: 150, height: 50)
            
            //FUITextField
            let textField = FUITextField.init(frame: CGRect())
            textField.text = "FUITextField"
            self.view.addSubview(textField)
            textField.frame = CGRect.init(x: 10, y: 130, width: 250, height: 50)
            textField.onChangeHandler = { newValue in
                print("FUITextField Changed to \(String(describing: newValue))")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute: {
                textField.text = "FUITextField Changed"
            })
            
            //FUIButton
            let button = FUIButton.init(frame: CGRect())
            button.titleLabel?.text = "FUIButton" //Subclass of UIButton, which fixes the issue in UIButton where setting the titleLabel.text property does not update the label text value.
            button.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientBottom)
            button.tintColor = UIColor.preferredFioriColor(forStyle: .primary6)
            button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(button)
            button.frame = CGRect.init(x: 10, y: 190, width: 250, height: 50)
            
            //FUITag
            let tag = FUITag(title: "FUITag")
            self.view.addSubview(tag)
            tag.frame = CGRect.init(x: 10, y: 250, width: 100, height: 50)
            tag.colorScheme = .lightBackground
            
            
            
            
            
        default:
            print("Control Type not identified")
        }
        
        
    }
    
    func toastPressed(sender:Any) -> Void {
        FUIToastMessage.show(message: "This is a toast message")
        //FUIToastMessage.show(message: "This is a message", withDuration: 3)
    }
    
    func bannerPressed(sender:Any) -> Void {
        //Replace UINavigationBar to FUINavigationBar first
        //This is not standard practice, you need to set up FUINavigationBar before this event
        let customNavBar =  FUINavigationBar.init(frame: (self.navigationController?.navigationBar.frame)!)
        self.navigationController?.setValue(customNavBar, forKey: "navigationBar")
        
        customNavBar.bannerView?.show(message: "This is a test banner", withDuration: 1, animated: true)
        
    }
    
    func loadingIndicatorPressed() -> Void{
        let loadingIndicatorView = FUILoadingIndicatorView(frame: CGRect.init(x: 100, y: 300, width: 250, height: 100))
        self.view.addSubview(loadingIndicatorView)
        loadingIndicatorView.show()
        //loadingIndicatorView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute: {
            loadingIndicatorView.dismiss()
            //loadingIndicatorView.stopAnimating() //Use this code to pause the animation
        })
        
    }
    
    func modalLoadingIndicatorPressed() -> Void {
        let modalLoadingIndicatorView = FUIModalLoadingIndicatorView()
        modalLoadingIndicatorView.show(inView: self.view, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute: {
            modalLoadingIndicatorView.dismiss()
        })
    }
    
    func processingIndicatorPressed() -> Void {
        let processingIndicatorView = FUIProcessingIndicatorView(frame: CGRect.init(x: 100, y: 300, width: 250, height: 100))
        self.view.addSubview(processingIndicatorView)
        processingIndicatorView.show()
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute: {
            processingIndicatorView.dismiss()
            
        })
        
        /* Pause Animation
         processingIndicatorView.startAnimating()
         // do something
         processingIndicatorView.stopAnimating()
         */
    }
    
    func modalProcessingIndicatorPressed() -> Void {
        let modalProcessingView = FUIModalProcessingIndicator.show(inView: self.view, animated: true, backgroundMode: .blurred)
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute: {
            modalProcessingView.dismiss()
        })
    }
    
    func checkoutIndicatorPressed(sender:Any) -> Void {
        let sender = sender as! FUIButton
        let checkoutIndicatorView = FUICheckoutIndicatorView(frame: sender.frame)
        self.view.addSubview(checkoutIndicatorView)
        checkoutIndicatorView.frame.origin.x += sender.frame.size.width
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute: {
            checkoutIndicatorView.isHidden = true
        })
        
    }
    
    func checkoutVCPressed() -> Void {
        let viewController = FUIModalCheckoutViewController.instantiateViewController()
        viewController.title = "My Modal Checkout Title"
        viewController.text = "Processing"
        self.present(viewController, animated: false)
    }
    
    func feedbackScreenPressed() -> Void {
        let vc = FUIFeedbackScreen.createInstanceFromStoryboard()
        vc.didTapActionButton = {
            //self.showAppMainView(vc)
            self.dismiss(animated: true, completion: {})
        }
        vc.navigationItem.title = "Error"
        //layout 1 that sets the 2 labels' text and the button
        //vc.messageNameLabel.text = "Task does not exist"
        //vc.messageDetailLabel.text = "Unable to save changes as the task does not exists."
        //vc.messageActionButton.titleLabel?.text = "Continue"
        
        //layout 2 that sets all 4 labels' text and the button
        vc.messageNameLabel.text = "Sign In Failed"
        vc.messageDetailLabel.text = "You can try entering your passcode again in"
        vc.messageEmphasisLabel.text = "5 minutes"
        vc.messageFootnoteLabel.text = "Or reset your passcode by entering your credentials."
        vc.messageActionButton.titleLabel?.text = "Reset Passcode"
        
        self.present(vc, animated: true, completion: {})
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func configureWithControlType(controlType :String) -> Void{
        self.controlType = controlType
    }
    
    public func navBack() -> Void{
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSampleTableView" {
            let destinationVC = segue.destination as! SampleTableViewController
            destinationVC.controlType = self.controlType
        }else if segue.identifier == "showCode" {
            let destinationVC = segue.destination as! CodeViewController
            destinationVC.controlType = self.controlType
        }
        
    }
    
    func  showCode() -> Void {
        self.performSegue(withIdentifier: "showCode", sender: self)
    }
    
    
}
