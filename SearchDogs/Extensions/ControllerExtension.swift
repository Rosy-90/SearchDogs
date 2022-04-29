//
//  ControllerExtension.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert() {
        let alertViewController = UIAlertController(title: "eRROR", message: "Something went wrong, Please try again!", preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { alert in
            alertViewController.dismiss(animated: true, completion: nil)
        }
        alertViewController.addAction(alertAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
}
