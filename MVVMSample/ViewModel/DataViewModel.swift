//
//  DataViewModel.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import UIKit

class DataViewModel {
    
    var datas: [Data] = [Data]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    
    private var cellViewModels: [DataListCellViewModel] = [DataListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func getData(){
        showLoading?()
        ApiClient.getDataFromServer { (success, data) in
            self.hideLoading?()
            if success {
                self.createCell(datas: data!)
                self.reloadTableView?()
            } else {
                self.showError?()
            }
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> DataListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCell(datas: [Data]){
        self.datas = datas
        var vms = [DataListCellViewModel]()
        for data in datas {
            vms.append(DataListCellViewModel(titleText: data.title, subTitleText: data.subTitle))
        }
        cellViewModels = vms
    }
}

struct DataListCellViewModel {
    let titleText: String
    let subTitleText: String
}
