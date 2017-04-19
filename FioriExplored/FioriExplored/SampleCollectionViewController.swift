//
//  SampleCollectionViewController.swift
//  FioriExplored
//
//  Created by Zhang, Kenny on 4/13/17.
//  Copyright © 2017 Kenny. All rights reserved.
//

import UIKit
import SAPFiori


struct Product {
    var name = ""
    var imageUrl = ""
    var price = ""
    
}

class SampleCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    // prepare the products to be shown
    let products = [
        Product(name: "Basic 15", imageUrl: "HT-1000.jpg" , price: "956.00"),
        Product(name: "Basic 17", imageUrl: "HT-1001.jpg" , price: "1249.00"),
        Product(name: "Professional 15", imageUrl: "HT-1011.jpg" , price: "1999.00")
        
    ]
    
    private let collectionTypeArray = ["FUIObjectCollectionViewCell","FUISimpleCollectionViewCell","FUISimplePropertyCollectionViewCell"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.register(FUIObjectCollectionViewCell.self, forCellWithReuseIdentifier: FUIObjectCollectionViewCell.reuseIdentifier)
        //        //        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        //        //        layout.itemSize = CGSize(width: 300, height: 150)
        //        //        self.collectionView!.setCollectionViewLayout(layout, animated: false)
        //        // For Simple Collection View Cell
        //        self.collectionView!.register(FUISimpleCollectionViewCell.self, forCellWithReuseIdentifier: FUISimpleCollectionViewCell.reuseIdentifier)
        self.collectionView!.register(FUICollectionSectionHeaderFooterView.self,
                                      forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                      withReuseIdentifier: "Header")
        
        for cellType in self.collectionTypeArray {
            self.collectionView!.register(NSClassFromString("SAPFiori.\(cellType)").self, forCellWithReuseIdentifier: (NSClassFromString("SAPFiori.\(cellType)")?.reuseIdentifier)!)
        }
        setFioriCollectionViewLayout()
        
    }
    
    func setFioriCollectionViewLayout () {
        // Set item layout in the collection view
        let layout = FUICollectionViewLayout.horizontalFlow
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.headerReferenceSize = CGSize(width: 100, height: 44)
        layout.minimumScaledItemSize = CGSize(width: 100, height: 44)
        //        layout.itemSize = CGSize(width: 300, height: 150)
        self.collectionView!.setCollectionViewLayout(layout, animated: true)
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
        
        return self.collectionTypeArray.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        switch self.collectionTypeArray[indexPath.section] {
        case "FUIObjectCollectionViewCell":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FUIObjectCollectionViewCell.reuseIdentifier, for: indexPath) as! FUIObjectCollectionViewCell
            
            cell.headlineText = "Head Line Text"
            cell.subheadlineText = "SubHead Line"
            cell.footnoteText = "Foot Note"
            cell.statusText = "Status"
            cell.substatusImage = UIImage.init(named: "cloud.png")
            cell.substatusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative)
            cell.detailImage = UIImage.init(named: "avatar.png")
            
            return cell
        case "FUISimpleCollectionViewCell":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FUISimpleCollectionViewCell.reuseIdentifier,
                                                          for: indexPath)
            guard let fioriCVCell = cell as? FUISimpleCollectionViewCell else {
                return cell
            }
            
            fioriCVCell.contentImage = UIImage(named: products[indexPath.item].imageUrl)
            fioriCVCell.titleText = products[indexPath.item].name
            return fioriCVCell
        case "FUISimplePropertyCollectionViewCell":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FUISimplePropertyCollectionViewCell.reuseIdentifier, for: indexPath)
            guard let fioriCVCell = cell as? FUISimplePropertyCollectionViewCell else {
                return cell
            }
            fioriCVCell.keyName = "Key \(indexPath.row)"
            fioriCVCell.value = "Value \(indexPath.row)"
            return fioriCVCell
        default:
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FUIObjectCollectionViewCell.reuseIdentifier, for: indexPath) as! FUIObjectCollectionViewCell
            
            cell.headlineText = "Head Line Text"
            cell.subheadlineText = "SubHead Line"
            cell.footnoteText = "Foot Note"
            cell.statusText = "Status"
            cell.substatusImage = UIImage.init(named: "cloud.png")
            cell.substatusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative)
            cell.detailImage = UIImage.init(named: "avatar.png")
            
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                   withReuseIdentifier: "Header", for: indexPath)
        
        if let view = view as? FUICollectionSectionHeaderFooterView {
            view.style = .attribute
            view.titleLabel.text = self.collectionTypeArray[indexPath.section]
            view.attributeLabel.text = "See All"
            view.didSelectHandler = {
                print("Section Header tapped")
            }
            
            
            view.isDisclosureAccessoryHidden = true
            
        }
        return view
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        switch self.collectionTypeArray[indexPath.section] {
        case "FUIObjectCollectionViewCell":
            return CGSize.init(width: 200, height: 100)
        case "FUISimpleCollectionViewCell":
            return CGSize.init(width: 120, height: 100)
        case "FUISimplePropertyCollectionViewCell":
            return CGSize.init(width: 200, height: 50)
        default:
            return CGSize.init(width: 200, height: 100)
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
