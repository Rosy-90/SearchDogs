//
//  ViewController.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import UIKit

protocol PetsViewControllerProtocol: AnyObject {
    func updateUI()
    func showError()
}

class PetsViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var viewModel: PetsViewModelProtocol! //ViewModel
    weak var coordinator: Coordinator? //Coordinator
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var columnCount: Int {
      switch UIDevice.current.userInterfaceIdiom {
      case .pad:
        return Constants.iPadColumnCount
      default:
        return Constants.iPhoneColumnCount
      }
    }
    
    private let minimumInteritemSpacing: CGFloat = 10.0
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
      let layout = UICollectionViewFlowLayout()
      layout.minimumInteritemSpacing = minimumInteritemSpacing
      return layout
    }()
    
    private func hideActivityIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    private func showActivityIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title =  Constants.petSearchScreenTitle
        hideActivityIndicator()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       self.collectionView.collectionViewLayout = flowLayout
    }
}

extension PetsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "petsViewCell", for: indexPath) as? PetsViewCell else {
            return UICollectionViewCell()
        }
        
        let petDetails = viewModel.getBreedNameAndImageId(for: indexPath.row)
        cell.setData(petDetails: petDetails)
        return cell
    }
}

extension PetsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let sideInsets = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right
      let spaceBetween = minimumInteritemSpacing * CGFloat(columnCount - 1)
      
      let cellWidth = (collectionView.bounds.width - (sideInsets + spaceBetween)) / CGFloat(columnCount)
      return CGSize(width: cellWidth, height: cellWidth)
    }
      
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let petDetails =  viewModel.getPetDetails(for:indexPath.row)
          coordinator?.goToPetDetails(petDetails: petDetails)
      }
}

extension PetsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchPetInfo(for: searchText)
    }
}

extension PetsViewController: PetsViewControllerProtocol {
    func updateUI() {
        collectionView.reloadData()
        hideActivityIndicator()
    }
    
    func showError() {
        collectionView.reloadData()
        hideActivityIndicator()
    }
}

