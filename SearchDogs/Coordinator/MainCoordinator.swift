//
//  MainCoordinator.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import Foundation
import UIKit

protocol Coordinator:class {
    var navigationController: UINavigationController { get set }
    func start()
    func goToPetDetails(petDetails: (breadName: String,
                                     height: String,
                                     weight: String,
                                     lifeSpan: String,
                                     temperament: String))
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PetsViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = PetsViewModel(delegate: vc)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToPetDetails(petDetails: (breadName: String, height: String, weight: String, lifeSpan: String, temperament: String)) {
        let vc = PetDetailsViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = PetDetailsViewModel(petDetails: petDetails)
        navigationController.pushViewController(vc, animated: false)
    }
}
