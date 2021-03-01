//
//  FixerUpperDetailsViewController.swift
//  iOSDebugFundamentals_Storyboard
//

import UIKit
import MapKit

class FixerUpperDetailsViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var fixerUpperImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var fixerUpper: FixerUpper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        
        // Set initial UI State
        fixerUpperImageView.image = fixerUpper.image
        nameLabel.text = fixerUpper.name
        priceLabel.text = fixerUpper.askingPrice
        locationLabel.text = "\(fixerUpper.city), \(fixerUpper.state)"
        setFavoriteState()
        
        // Make image round
        fixerUpperImageView.layer.borderWidth = 4
        fixerUpperImageView.layer.masksToBounds = false
        fixerUpperImageView.layer.borderColor = UIColor.white.cgColor
        fixerUpperImageView.layer.cornerRadius = fixerUpperImageView.frame.height/2
        fixerUpperImageView.clipsToBounds = true
        
        // Set Map View
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: fixerUpper.locationCoordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func setFavoriteState() {
        let buttonImage = fixerUpper.isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        let tintColor = fixerUpper.isFavorite ? UIColor.init(red: 248.0/255.0, green: 204.0/255.0, blue: 70.0/255.0, alpha: 1.0) : UIColor.gray
        
        favoriteButton.setImage(buttonImage, for: .normal)
        favoriteButton.tintColor = tintColor
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        fixerUpper.isFavorite.toggle()
        setFavoriteState()
    }
    
    // MARK: - Propagate Data Changes
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let fixerUpperListVC = viewController as? FixerUpperListViewController {
            let fixerUpperIndex: Int = fixerUpperListVC.fixerUppers.firstIndex(where: { $0.id == fixerUpper.id })!
            
            fixerUpperListVC.fixerUppers.remove(at: fixerUpperIndex)
            fixerUpperListVC.fixerUppers.append(self.fixerUpper)
            fixerUpperListVC.fixerUppers.sort(by: { $0.name < $1.name })
            fixerUpperListVC.tableView.reloadData()
        }
    }
}
