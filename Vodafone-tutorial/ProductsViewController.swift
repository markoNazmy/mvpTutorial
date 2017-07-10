    //
//  ProductsViewController.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import SafariServices

    
    
class ProductsViewController :  BaseViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableViewUI: UITableView!
    var products : [Product]?
    var userData : UserData?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewUI!.delegate = self
        tableViewUI!.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (products?.count)!
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        

        let imageView : UIImageView = cell.viewWithTag(1) as! UIImageView
        //  imageView.image = image
        imageView.sd_setImage(with: URL(string:(products?[indexPath.row].icon)!))
        
        // this retrive the image from database warning !!!!!!!!!
        //
        //        imageView.image=UIImage(data: movies[indexPath.row].uiImage as! Data)
        let titleLabel : UILabel = cell.viewWithTag(2) as! UILabel
        titleLabel.text = products?[indexPath.row].label
        
        if let u = userData?.userType {
            if u == "postpaid"{
                let subtitleLabel : UILabel = cell.viewWithTag(3) as! UILabel
                if let x = products?[indexPath.row].subtitle{
                    subtitleLabel.text = String(describing: x)
                }
            }
            else{
                let subtitleLabel : UILabel = cell.viewWithTag(3) as! UILabel
                subtitleLabel.isHidden = true
            }
        }
        
        
        
        return cell
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let movieView : MovieController = segue.destination as! MovieController
    //        movieView.setMovie(movie: movies[selected])
    //    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        UIApplication.shared.openURL(NSURL(string: products![indexPath.row].url) as! URL)
        let svc = SFSafariViewController(url: NSURL(string: products![indexPath.row].url) as! URL)
        present(svc, animated: true, completion: nil)

    }
    
    func setProducts(products : [Product] , userData : UserData)  {
        self.products = products
        self.userData = userData
    }
    
}
