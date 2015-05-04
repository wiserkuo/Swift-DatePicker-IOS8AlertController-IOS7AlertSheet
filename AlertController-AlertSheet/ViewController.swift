//
//  ViewController.swift
//  AlertController-AlertSheet
//
//  Created by wiserkuo on 2015/5/3.
//  Copyright (c) 2015年 wiserkuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIActionSheetDelegate{
    var datePicker : UIDatePicker!
    var selectedDate : String!
    var actionSheet : UIActionSheet!
    func createDatePickerViewWithAlertController()
    {
        var viewDatePicker: UIView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 200))
        viewDatePicker.backgroundColor = UIColor.clearColor()
        self.datePicker = UIDatePicker(frame: CGRectMake(0, 0, self.view.frame.size.width, 200))
        self.datePicker.datePickerMode = UIDatePickerMode.Date
        
        //self.datePicker.addTarget(self, action: "datePickerSelected", forControlEvents: UIControlEvents.ValueChanged)
        if let gotModernAlert: AnyClass = NSClassFromString("UIAlertController"){
      //  if(UIDevice.currentDevice().systemVersion >= "8.0") //ios8
     //   {
            println("UIAlertController")
            viewDatePicker.addSubview(self.datePicker)
            let alertController = UIAlertController(title: nil, message: "\n\n\n\n\n\n\n\n\n\n", preferredStyle: UIAlertControllerStyle.ActionSheet)
            alertController.view.addSubview(viewDatePicker)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel)
                { (action) in
                    // ...
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "Done", style: .Default)
                { (action) in
                    
                    self.dateSelected()
                    println("Done selectedDate=\(self.selectedDate)")
            }
            alertController.addAction(OKAction)
            
            /*
            let destroyAction = UIAlertAction(title: "Destroy", style: .Destructive)
            { (action) in
            println(action)
            }
            alertController.addAction(destroyAction)
            */
            self.presentViewController(alertController, animated: true)
                {
                    // ...
            }
        }
        else //ios7
        {
            println("UIAlertSheet")
            
            
        }
        
    }

    func dateformatterDateTime(date: NSDate) -> NSString
    {
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.stringFromDate(date)
    }
    @IBOutlet weak var dateLabel: UILabel!

    func dateSelected()
    {
        // var selectedDate: String = String()
        selectedDate = self.dateformatterDateTime(datePicker.date) as String
        self.title = selectedDate
        dateLabel.text=selectedDate
        println("dateSelected() selectedDate=\(selectedDate)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        createDatePickerViewWithAlertController()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

