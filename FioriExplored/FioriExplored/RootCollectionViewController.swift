//
//  RootCollectionViewController.swift
//  FioriExplored
//
//  Created by Zhang, Kenny on 4/12/17.
//  Copyright © 2017 Kenny. All rights reserved.
//

import UIKit
import SAPFiori

private let reuseIdentifier = "CollectionCell"

class RootCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let controlArray = [["FUIWelcomeScreen","FUIObjectHeader"],["FUIObjectTableViewCell","CollectionView"],["FUIContactCell"],["FUITimelineCell","FUITimelineMarkerCell"],["FUIKPIView"],["FUIFormTableViewController"],["FeedbackIndicators"],["SupportingTypes"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(FUISimpleCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 190, height: 190)
        self.collectionView!.setCollectionViewLayout(layout, animated: false)
        
        
        
        
        // Do any additional setup after loading the view.
        self.collectionView?.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundBase)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.preferredFioriColor(forStyle: .backgroundGradientTop)
        
        self.navigationController?.navigationBar.tintColor = UIColor.preferredFioriColor(forStyle: .tintColorLight)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.preferredFioriColor(forStyle: .primary6)]
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return self.controlArray.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.controlArray[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let title = controlArray[indexPath.section][indexPath.row]
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FUISimpleCollectionViewCell
        
        cell.contentImage = UIImage.init(named: "SAPLogo.png")
        cell.titleText = title
        cell.titleLabel.font = UIFont.systemFont(ofSize: 14)
        cell.titleLabel.adjustsFontSizeToFitWidth = true
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.sizeToFit()
        // Configure the cell
        
        
        
        return cell
    }
    
    
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    //        return CGSize(width: 150, height: 150)
    //    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> Void{
        self.performSegue(withIdentifier: "toSample", sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) -> Void{
        if let sender = sender as? IndexPath{
            let controlType = self.controlArray[sender.section][sender.row]
            
            let sampleVC = segue.destination as! SampleViewController
            sampleVC.configureWithControlType(controlType: controlType)
        }
    }
    
    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
