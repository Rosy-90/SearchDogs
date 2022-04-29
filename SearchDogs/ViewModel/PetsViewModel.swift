//
//  PetsViewModel.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import Foundation

protocol PetsViewModelProtocol {
    var itemCount: Int {get}
    func searchPetInfo(for keyword: String)
    func getBreedNameAndImageId(for row: Int) -> (imageName: String, breadName: String)
    func getPetDetails(for row: Int) -> (breadName: String,
                                         height: String,
                                         weight: String,
                                         lifeSpan: String,
                                         temperament: String)
}

class PetsViewModel {
    weak private var delegate:PetsViewControllerProtocol!
    let service: Servicable!
    private var petsInfo: [PetInfo]?
    
    var itemCount: Int {
        return petsInfo?.count ?? 0
    }
    /* Injecting Dependencies of delegate and service class ,
     Service class is default params */
    init(delegate: PetsViewControllerProtocol, service: Servicable =  Service()) {
        self.delegate = delegate
        self.service = service
    }
}

extension PetsViewModel: PetsViewModelProtocol {
    /*
     this method connect calls rest API to get data
     */
    func searchPetInfo(for keyword: String) {
        if keyword.count > 0 {
            let networkCient = NetworkClient(baseURL: EndPoints.baseUrl.rawValue, path: Path.breedsSearch.rawValue, params: "q=\(keyword)", method: "get")
            service.fetchData(networkClient: networkCient, type: PetInfo.self) { [weak self] (result) in
                switch result {
                case .success(let result):
                    self?.petsInfo = result
                    DispatchQueue.main.async {
                        self?.delegate?.updateUI()
                    }
                case .failure(_):
                    self?.petsInfo = nil
                    DispatchQueue.main.async {
                        self?.delegate?.showError()
                    }
                }
            }
        } else {
            petsInfo = nil
            delegate?.updateUI()
        }
    }
    
    func getBreedNameAndImageId(for row: Int) -> (imageName: String, breadName: String) {
        guard itemCount > row, row >= 0,  let petInfo = petsInfo?[row] else {
            return ("", "")
        }
        let imageRefId = petInfo.referenceImageID ?? ""
        return ("\(EndPoints.imageBaseurl.rawValue)\(imageRefId).jpg", petInfo.name)
    }
    
    func getPetDetails(for row: Int) -> (breadName: String, height: String, weight: String, lifeSpan: String, temperament: String) {
        guard  itemCount > row , row >= 0 , let petInfo = petsInfo?[row] else {
            return ("", "", "", "", "")
        }
        return (petInfo.name, "\(petInfo.height.imperial) - \(petInfo.height.metric)", "\(petInfo.weight.imperial) - \(petInfo.weight.metric)", petInfo.lifeSpan, petInfo.temperament ?? "" )
    }
}
