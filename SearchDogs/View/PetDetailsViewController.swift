//
//  PetDetailsViewController.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import Foundation
import UIKit

class PetDetailsViewController: UIViewController, Storyboarded {
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblLifeSpan: UILabel!
    @IBOutlet weak var lblTemperarment: UILabel!
    
    var viewModel: PetDetailsViewModelProtocal! //ViewModel
    weak var coordinator: Coordinator? //Coordinator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.navigationItem.title = viewModel.breadName
        lblHeight.text = viewModel.height
        lblWeight.text = viewModel.height
        lblLifeSpan.text = viewModel.lifeSpan
        lblTemperarment.text = viewModel.temperament
    }
}
