//
//  Review_ViewController.swift
//  Assignmentt
//
//  Created by Jue Maria on 12/23/20.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

class Review_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //@IBOutlets
    @IBOutlet weak var reviewCount_Label: UILabel!
    @IBOutlet weak var Review_TableView: UITableView!
    lazy var reviewDelegate: HotelReviewViewmodel = {
          return HotelReviewViewmodel()
      }()
    private var reviewDataSource = [Reviews]()
    private var MessageString = String()
    var hotelId:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewCount_Label.isHidden = true
        reviewDelegate.callFuncToGethotelData(HotelID:hotelId!)
        self.view.activityStartAnimating(Title: "Loading...", activityColor: UIColor.white, backgroundColor: ActivityBg)
                reviewDelegate.bindHotelReviewViewModelToController =
                           {
                            if self.reviewDelegate.hotelReviewobject != nil
                            {
                            if self.reviewDelegate.hotelReviewobject.count > 0
                                {
                                    self.reviewCount_Label.isHidden = false
                            self.reviewDataSource = self.reviewDelegate.hotelReviewobject
                            self.Review_TableView.delegate = self
                            self.Review_TableView.dataSource = self
                            self.Review_TableView.reloadData()
                            self.Review_TableView.tableFooterView = UIView()
                            self.Review_TableView.estimatedRowHeight = 200
                            self.Review_TableView.rowHeight = UITableView.automaticDimension
                                self.view.activityStopAnimating()
                            }
                                else
                            {
                                 self.view.activityStopAnimating()
                                 self.MessageString = "No Reviews are available"
                                showAlert(Message: "No Reviews are available", controller: self)
                                
                                }
                            }
                            else{
                                 self.view.activityStopAnimating()
                                self.MessageString = self.reviewDelegate.Message
                              showAlert(Message: "\(self.MessageString)", controller: self)
                            }
                       }
           }
    override func viewWillAppear(_ animated: Bool) {
           hideNavigationBar(animated: true)
       }
    //no of Row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if (self.reviewDataSource.count == 0) {
                   self.Review_TableView.setEmptyMessage("No Reviews Available")
               } else {
                   self.Review_TableView.restore()
               }
        return reviewDataSource.count
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(
            withDuration: 0.7,
            delay: 0.07 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let Cell = Bundle.main.loadNibNamed("Review_TableViewCell", owner: self, options: nil)?.first as! Review_TableViewCell
        switch reviewDataSource[indexPath.row].qualitativeBadgeText
        {
        case "Fair":
            Cell.qualityTag.textColor = UIColor.orange
        case "Poor":
            Cell.qualityTag.textColor = UIColor.red
        case "Very Good":
            Cell.qualityTag.textColor = UIColor.green
        case "Good":
            Cell.qualityTag.textColor = UIColor.blue
            
        case "Exceptional":
            Cell.qualityTag.textColor = UIColor.lightGray
        default:
            print("default")
        }
        let img = Cell.rating_Imageview.image
        Cell.qualityTag.text = reviewDataSource[indexPath.row].qualitativeBadgeText
        Cell.reviwerName_Label.text = reviewDataSource[indexPath.row].recommendedBy
        Cell.review_Badge.text = "\(reviewDataSource[indexPath.row].formattedRating!)"
        Cell.reviews_Label.text = reviewDataSource[indexPath.row].summary
        return Cell
    }
    //Back Action
    @IBAction func onClickNackAction(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
        
    }
}
//Extension of tableView
extension UITableView
{
  func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel;
    }
    func restore() {
        self.backgroundView = nil
    }
}
