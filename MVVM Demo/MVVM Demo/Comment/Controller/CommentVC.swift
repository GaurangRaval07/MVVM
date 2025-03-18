//
//  ViewController.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 13/03/25.
//

import UIKit

class CommentVC: UIViewController {
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var tblComments: UITableView!
    
    // MARK: - VARIABLES
    var viewModel = PostViewModel()

    // MARK: - MAIN METHODS
    override func viewDidLoad() {
        ConfigureUI()
        getAPI()
    }
    
    // MARK: - WEB SERVICES
    func getAPI() {
        viewModel.fetchComments { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.tblComments.reloadData()
                case .failure(_):
                    print("Error")
                }
            }
        }
    }
    
    // MARK: - FUNCTION
    func ConfigureUI() {
        self.tblComments.register(UINib(nibName: "CommentsTVCell", bundle: nil), forCellReuseIdentifier: "CommentsTVCell")
    }
    
    // MARK: - IBACTIONS
    
}

// MARK: - TABLEVIEW DELEGATE AND DATASOURCE METHODS
extension CommentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblComments.dequeueReusableCell(withIdentifier: "CommentsTVCell") as? CommentsTVCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.bgVW.layer.cornerRadius = 8
        cell.bgVW.layer.borderWidth = 1
        cell.bgVW.layer.borderColor = UIColor.lightGray.cgColor
        let cmnts = viewModel.comments[indexPath.row]
        cell.lblPostID.text = "PostID:- \(cmnts.postId ?? 0)"
        cell.lblID.text = "ID:- \(cmnts.id ?? 0)"
        cell.lblName.text = "Name:- \(cmnts.name ?? "")"
        cell.lblEmail.text = "Email:- \(cmnts.email ?? "")"
        cell.lblBody.text = "Body:- \(cmnts.body ?? "")"
        return cell
    }
    
}
// MARK: - COLLECTIONVIEW DELEGATE AND DATASOURCE METHODS
