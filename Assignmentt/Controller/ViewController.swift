//
//  ViewController.swift
//  Assignmentt
//
//  Created by Jue Maria on 22/12/20.
//  Copyright © 2020 test. All rights reserved.
//
//
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //IBOutlets
    @IBOutlet weak var hotelData_Tableview:UITableView!
    @IBOutlet weak var groupName_Label: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    lazy var delegate: HotelViewmodel = {
        return HotelViewmodel()
    }()
    private var dataSource = [HotelResponse]()
    private var MessageString = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelData_Tableview.isHidden = true
        groupName_Label.isHidden = true
        let searchBarTextAttributes: [NSAttributedString.Key : AnyObject] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white, NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont.systemFont(ofSize: 14.0)]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = searchBarTextAttributes
        // Do any additional setup after loading the view, typically from a nib.
    }
    //View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar(animated: true)
    }
    //Click on Search Button Action
    @IBAction func onClickSearchButton(_ sender: Any) {
        if (searchBar.text?.isEmpty == false)
        {
            if CheckInternet.Connection()
            {
            delegate.callFuncToGethotelData(searchPlace:searchBar.text!)
         self.view.activityStartAnimating(Title: "Loading...", activityColor: UIColor.white, backgroundColor: ActivityBg)
        delegate.bindHotelViewModelToController =
            {
               if self.delegate.hotelobject != nil
                {
if self.delegate.hotelobject[0].entities!.count > 0
                    {
                    self.dataSource = self.delegate.hotelobject
                    self.hotelData_Tableview.dataSource = self
                    self.hotelData_Tableview.delegate = self
                    self.hotelData_Tableview.isHidden = false
                    self.groupName_Label.isHidden = false
                    self.hotelData_Tableview.tableFooterView = UIView()
                    self.view.activityStopAnimating()
                        self.hotelData_Tableview.reloadData()
                }
                else
                    {
                        self.view.activityStopAnimating()
                        self.MessageString = " No Hotels are Available"
                        showAlert(Message: " No Hotels are Available", controller: self)
                    }
               }
                else{
                     self.view.activityStopAnimating()
                    self.MessageString = self.delegate.Message
                  showAlert(Message: "\(self.MessageString)", controller: self)
          }
            }
        }
            else
            {
                 self.view.activityStopAnimating()
                showInternet(Message: "Your device is not connected to the internet")
            }
}
        else
        {
             self.view.activityStopAnimating()
            showAlert(Message:"Please Enter the Place Name", controller: self)
        }
        }
    //TableView Will Display
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(
            withDuration: 0.7,
            delay: 0.07 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    //TableView  Row Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    //no of Row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[0].entities!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let Cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
      Cell.Holder_View.layer.cornerRadius = 10
       Cell.hotelName_Label.text = dataSource[0].entities![indexPath.row].name
        return Cell
    }
    //delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if CheckInternet.Connection()
        {
            self.view.activityStartAnimating(Title: "Loading....", activityColor: UIColor.white, backgroundColor: UIColor.lightGray)
    let storyBoards: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let newViewController = storyBoards.instantiateViewController(withIdentifier: "ReviewVC") as! Review_ViewController
                if #available(iOS 13.0, *) {
                    newViewController.modalPresentationStyle = .fullScreen
                } else {
                    // Fallback on earlier versions
                }
            newViewController.hotelId = dataSource[0].entities![indexPath.row].destinationId
    self.navigationController!.pushViewController(newViewController, animated: true)
            self.view.activityStopAnimating()
            }
        else {
            self.view.activityStopAnimating()
            showAlert(Message: "Your device is not connected to the internet", controller: self)
        }
    }
}


