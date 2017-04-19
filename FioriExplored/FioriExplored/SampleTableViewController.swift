//
//  SampleTableViewController.swift
//  FioriExplored
//
//  Created by Zhang, Kenny on 4/13/17.
//  Copyright © 2017 Kenny. All rights reserved.
//

import UIKit
import SAPFiori

class SampleTableViewController: UITableViewController {
    public var controlType :String = ""
    //For search bar
    var searchController: FUISearchController?
    var isFiltered = false
    var searchString: String?
    var filteredList: [String] = [String]()
    
    // Example data
    let optionsList = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"];
    
    let reuseIdentifier = "TableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //Dynamic register tableview cell with Identifier
        self.tableView.register(NSClassFromString("SAPFiori.\(self.controlType)").self, forCellReuseIdentifier: reuseIdentifier)
        
        //Tableview's default `separatorStyle` is `.singleLine`.  Because of this default setting, there can be a 1.0 px divider line or a separator in-between each item on the timeline in the table.  This is not an issue in timeline.  To get rid of the separator, set `separatorStyle` to `none` in the TabelViewController class
        if self.controlType == "FUITimelineMarkerCell" || self.controlType == "FUITimelineCell" {
            self.tableView.separatorStyle = .none
        }
        
        //Define FUISearchController
        // Instantiate an FUISearchController and configure its properties
        searchController = FUISearchController(searchResultsController: nil)
        searchController!.searchResultsUpdater = self
        searchController!.hidesNavigationBarDuringPresentation = true
        searchController!.searchBar.placeholderText = "Search The List"
        
        // Adding barcode scanner to this search bar
        searchController!.searchBar.isBarcodeScannerEnabled = true
        searchController!.searchBar.barcodeScanner?.scanMode = FUIBarcodeScanMode.ean_upc
        searchController!.searchBar.barcodeScanner?.scanResultTransformer = { (scanString) -> String in
            return scanString.uppercased()
        }
        
        self.tableView.tableHeaderView = searchController!.searchBar
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isFiltered ? filteredList.count : optionsList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.controlType {
        case "FUIObjectTableViewCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
            cell.detailImage = UIImage.init(named: "HT-1000.jpg")
            cell.headlineText = isFiltered ? filteredList[indexPath.row] : optionsList[indexPath.row]
            cell.subheadlineText = "Sub HeadLine Text"
            cell.footnoteText = "Here is some footer text about Edward"
            cell.statusImageView.image = UIImage.init(named: "HT-1001.jpg")
            cell.substatusText = "Active"
            cell.descriptionText = "This text is only visible when the cell is in regular horizontal size class."
            cell.iconImages = [UIImage.init(named: "cloud.png")!, UIImage.init(named: "cloud.png")!, UIImage.init(named: "SAPLogo.png")!]
            cell.accessoryType = .disclosureIndicator
            cell.preserveIconStackSpacing = true
            return cell
        case "FUIContactCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FUIContactCell
            let activities: [FUIActivityItem] = [FUIActivityItem.phone, FUIActivityItem.message, FUIActivityItem.email]
            
            cell.detailImage = UIImage.init(named: "avatar.png")
            cell.headlineText = isFiltered ? filteredList[indexPath.row] : optionsList[indexPath.row]
            cell.subheadlineText = "ContactTitle"
            cell.descriptionText = "Contact Address, only shown when the cell is in regular horizontal size class."
            cell.activityControl.addActivities(activities)
            return cell
        case "FUITimelineCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FUITimelineCell
            cell.headlineText = isFiltered ? filteredList[indexPath.row] : optionsList[indexPath.row]
            cell.subheadlineText = "Work Package"
            cell.nodeImage = FUITimelineNode.open
            cell.eventText = "9:45\nAM"
            cell.eventImage = UIImage.init(named: "cloud.png")
            cell.statusImage = UIImage.init(named: "SAPLogo.png")
            cell.subStatusText = "Active"
            return cell
        case "FUITimelineMarkerCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FUITimelineMarkerCell
            cell.titleText = isFiltered ? filteredList[indexPath.row] : optionsList[indexPath.row]
            cell.nodeImage = FUITimelineNode.start
            cell.eventText = "12/6/15"
            cell.showLeadingTimeline = false
            cell.eventImage = UIImage.init(named: "cloud.png")
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
            return cell
        }
        
        
        
    }
    
    //Adjust the table row height for your own need
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension SampleTableViewController: UISearchResultsUpdating {
    
    // Called when the search bar's text or scope has changed or when the search bar becomes first responder.
    func updateSearchResults(for searchController: UISearchController) {
        searchString = searchController.searchBar.text!
        if searchString == nil {
            searchString = ""
        }
        isFiltered = !searchString!.isEmpty
        filteredList = optionsList.filter({
            return $0.localizedCaseInsensitiveContains(searchString!)
        })
        tableView.reloadData()
    }
    
    // Scan-Example: transform the scanString to "s"
    func tranformScanString(_ scanString: String) -> String {
        return "s"
    }
}
