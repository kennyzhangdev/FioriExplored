//
//  SampleFormTableViewController.swift
//  FioriExplored
//
//  Created by Zhang, Kenny on 4/14/17.
//  Copyright © 2017 Kenny. All rights reserved.
//

import UIKit
import SAPFiori

import Photos //For attachment cell


class SampleFormTableViewController: FUIFormTableViewController {
    private let formCellTypeArray = ["FUITitleFormCell","FUISimplePropertyFormCell","FUINoteFormCell","FUISwitchFormCell","FUISegmentedControlFormCell","FUIFilterFormCell","FUIDatePickerFormCell","FUIDurationPickerFormCell","FUIListPickerFormCell","FUIAttachmentsFormCell","FUIButtonFormCell"]
    
    //Attachment cell begin
    var attachmentURLs = [URL]()
    var attachmentThumbnails = [String: UIImage]()
    //Attachment cell end
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
        
        //        self.tableView.register(FUITitleFormCell.self, forCellReuseIdentifier: FUITitleFormCell.reuseIdentifier)
        //        self.tableView.register(FUISimplePropertyFormCell.self, forCellReuseIdentifier: FUISimplePropertyFormCell.reuseIdentifier)
        for cellType in self.formCellTypeArray {
            self.tableView.register(NSClassFromString("SAPFiori.\(cellType)").self, forCellReuseIdentifier: (NSClassFromString("SAPFiori.\(cellType)")?.reuseIdentifier)!)
        }
        self.tableView.tableFooterView = UIView.init() //Hide bottom seperator line
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return how many section in the table
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.formCellTypeArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.formCellTypeArray[indexPath.row] {
        case "FUITitleFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUITitleFormCell.reuseIdentifier, for: indexPath) as! FUITitleFormCell
            cell.value = "FUITitleFormCell: Text"
            
            cell.isEditable = true
            // MARK:  implement onChangeHandler
            cell.onChangeHandler = { newValue in
                print(newValue) //implement the new value logic here
            }
            return cell
        case "FUISimplePropertyFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUISimplePropertyFormCell.reuseIdentifier, for: indexPath) as! FUISimplePropertyFormCell
            
            cell.keyName = "FUISimplePropertyFormCell: Key"
            cell.value = "Value Label text"
            
            // MARK:  implement onChangeHandler
            cell.onChangeHandler = { newValue in
                print(newValue)//implement the new value logic here
            }
            return cell
        case "FUINoteFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUINoteFormCell.reuseIdentifier, for: indexPath) as! FUINoteFormCell
            
            // If a value already exists, set it to the `value` property
            cell.value = "FUINoteFormCell note value"
            
            // Specify an optional placeholder text
            cell.placeholderText = "Placeholder text only shown when empty"
            
            // MARK:  implement onChangeHandler
            cell.onChangeHandler = { newValue in
                print(newValue)//implement the new value logic here
            }
            
            return cell
        case "FUISwitchFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUISwitchFormCell.reuseIdentifier, for: indexPath) as! FUISwitchFormCell
            cell.keyName = "FUISwitchFormCell:key"
            cell.value = true
            
            // MARK:  implement onChangeHandler
            cell.onChangeHandler = { newValue in
                print(newValue)//implement the new value logic here
            }
            
            return cell
        case "FUISegmentedControlFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUISegmentedControlFormCell.reuseIdentifier, for: indexPath) as! FUISegmentedControlFormCell
            // Optionally, create an array of value option to localized string mappings
            let buttonTitles: [[String: String]] = [["LO": "Low"], ["MED": "Medium"], ["HI": "High"]]
            cell.valueOptions = buttonTitles.flatMap { $0.map { $0.value } }
            cell.keyName = "FUISegmentedControlFormCell: key"
            cell.value = 0  // String value in the valid options set: [LO, MED, HI]
            
            
            
            // MARK:  implement onChangeHandler
            cell.onChangeHandler = { newValue in
                print(buttonTitles[newValue].first!.key)  // lookup valid String value, from the buttonTitles array
            }
            return cell
        case "FUIFilterFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUIFilterFormCell.reuseIdentifier, for: indexPath) as! FUIFilterFormCell
            // optionally, create an array of value option to localized string mappings
            let buttonTitles: [[String: String]] = [["radius": "Distance"], ["price": "Price"], ["rating": "Ratings"], ["avail": "Availability"]]
            
            cell.valueOptions = buttonTitles.flatMap { $0.map { $0.value }}
            cell.keyName = "FUIFilterFormCell:Sort By"
            cell.value = [1]
            cell.allowsMultipleSelection = true
            cell.allowsEmptySelection = false
            
            // MARK:  implement onChangeHandler
            cell.onChangeHandler = { newValue in
                print(newValue)//implement filter logic here
            }
            
            return cell
        case "FUIDatePickerFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUIDatePickerFormCell.reuseIdentifier, for: indexPath) as! FUIDatePickerFormCell
            cell.keyName = "FUIDatePickerFormCell: key"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            cell.dateFormatter = dateFormatter
            cell.datePickerMode = .date
            cell.value = Date()   //Current Date
            // MARK:  implement onChangeHandler
            cell.onChangeHandler = { newValue in
                print(newValue)
            }
            
            return cell
        case "FUIDurationPickerFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUIDurationPickerFormCell.reuseIdentifier, for: indexPath) as! FUIDurationPickerFormCell
            cell.keyName = "FUIDurationPickerFormCell: Key"
            cell.value = 10000  // in seconds
            
            // MARK:  implement an onChangeHandler
            cell.onChangeHandler = { newValue in
                print(newValue)
            }
            
            return cell
        case "FUIListPickerFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUIListPickerFormCell.reuseIdentifier, for: indexPath)
            guard let listPickerCell = cell as? FUIListPickerFormCell else {
                return cell
            }
            
            let selectedValues = [0, 2]
            let valueOptions = ["optionRepair", "optionConstruction", "optionEngineering", "optionVendor"]
            
            listPickerCell.keyName = "FUIListPickerFormCell: key"
            listPickerCell.value = selectedValues
            listPickerCell.isEditable = true
            listPickerCell.allowsMultipleSelection = true
            listPickerCell.allowsEmptySelection = true
            listPickerCell.valueTextField.text = descriptionForSelectedStrings(valueOptions, at: selectedValues)
            listPickerCell.isUndoEnabled = true
            listPickerCell.valueOptions = valueOptions
            listPickerCell.onChangeHandler = {newValues in
                print(newValues)
            }
            
            listPickerCell.listPicker.prompt = "Prompt Text"
            listPickerCell.listPicker.isSearchEnabled = true
            
            listPickerCell.listPicker.isBarcodeScannerEnabled = true
            listPickerCell.listPicker.barcodeScanMode = .all
            listPickerCell.listPicker.barcodeScanResultTransformer = { (scanResultString) -> String in
                // if necessary the scan result string can be adjusted here
                return scanResultString
            }
            
            return listPickerCell
        case "FUIAttachmentsFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUIAttachmentsFormCell.reuseIdentifier, for: indexPath)
            guard let attachmentCell = cell as? FUIAttachmentsFormCell else {
                return cell
            }
            attachmentCell.attachmentsController.delegate = self
            attachmentCell.attachmentsController.dataSource = self
            attachmentCell.attachmentsController.reloadData()
            
            let addPhotoAction = FUIAddPhotoAttachmentAction()
            addPhotoAction.delegate = self
            attachmentCell.attachmentsController.addAttachmentAction(addPhotoAction)
            
            let takePhotoAction = FUITakePhotoAttachmentAction()
            takePhotoAction.delegate = self
            attachmentCell.attachmentsController.addAttachmentAction(takePhotoAction)
            
            return attachmentCell
        case "FUIButtonFormCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: FUIButtonFormCell.reuseIdentifier, for: indexPath)
            guard let buttonFormCell = cell as? FUIButtonFormCell else {
                return cell
            }
            buttonFormCell.alignment = .center
            buttonFormCell.button.setTitle("FUIButtonFormCell", for: .normal)
            
            return buttonFormCell
        default:
            // Return the cell to be used at the IndexPath specified
            let cell = tableView.dequeueReusableCell(withIdentifier: FUITitleFormCell.reuseIdentifier, for: indexPath) as! FUITitleFormCell
            cell.value = "FUITitleFormCell: Work Request"
            
            cell.isEditable = true
            // MARK:  implement onChangeHandler
            cell.onChangeHandler = { newValue in
                print(newValue)//implement the new value logic here
            }
            return cell
        }
        
    }
    
    func descriptionForSelectedStrings(_ options: [String], at indexes: [Int]) -> String {
        return options.enumerated().filter({ (index, element) -> Bool in
            return indexes.contains(index)
        }).reduce ("") { string, element in
            return string.isEmpty ? element.1 : "\(string), \(element.1)"
        }
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


extension SampleFormTableViewController: FUIAddPhotoAttachmentActionDelegate {
    
    // This function is invoked when a photo is selected from a photo picker.
    func addPhotoAttachmentAction(_ action: FUIAddPhotoAttachmentAction, didSelectPhotoAt url: URL) {
        attachmentURLs.append(url)
        setupThumbnails(url)
    }
    
    func setupThumbnails(_ url: URL) {
        let assets = PHAsset.fetchAssets(withALAssetURLs: [url], options: nil)
        let asset = assets.firstObject!
        let imageManager = PHImageManager.default()
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 80, height: 80), contentMode: .default, options: nil, resultHandler: { image, array in
            self.attachmentThumbnails[url.absoluteString] = image
            self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .middle, animated: true)
        })
    }
}

extension SampleFormTableViewController: FUIAttachmentsViewControllerDataSource {
    
    // Gets the number of attachments to display in the FUIAttachmentsViewController's collection
    func numberOfAttachments(in attachmentsViewController: FUIAttachmentsViewController) -> Int {
        return attachmentURLs.count
    }
    
    // Gets the thumbnail image for the attachment at the specified index.
    func attachmentsViewController(_ attachmentsViewController: FUIAttachmentsViewController, iconForAttachmentAtIndex index: Int) -> (image: UIImage, contentMode: UIViewContentMode)? {
        let urlString = attachmentURLs[index].absoluteString
        guard let image = attachmentThumbnails[urlString] else {
            return nil // Returning `nil` will fall-back to the default icon.
        }
        return (image, .scaleAspectFill)
    }
    
    // Gets the file URL of the attachment resource.
    func attachmentsViewController(_ attachmentsViewController: FUIAttachmentsViewController, urlForAttachmentAtIndex index: Int) -> URL? {
        return attachmentURLs[index]
    }
}

extension SampleFormTableViewController: FUIAttachmentsViewControllerDelegate {
    
    // To notify when user tapped delete to an attachment.
    func attachmentsViewController(_ attachmentsViewController: FUIAttachmentsViewController, didPressDeleteAtIndex index: Int) {
        attachmentURLs.remove(at: index)
        tableView.reloadData()
    }
    
    // This function is invoked, if the controller failed to obtain a valid file URL for an attachment which should be presented.
    func attachmentsViewController(_ attachmentsViewController: FUIAttachmentsViewController, couldNotPresentAttachmentAtIndex index: Int) -> Void {
        print("handle attachments which cannot be presented")
    }
}

extension SampleFormTableViewController: FUITakePhotoAttachmentActionDelegate {
    
    // This function is invoked when a photo is taken from camera.
    func takePhotoAttachmentAction(_ action: FUITakePhotoAttachmentAction, didTakePhotoAt: URL) {
        print("This function is invoked when a photo is taken from camera...")
    }
}
