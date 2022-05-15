//
//  ViewController.swift
//  Task
//
//  Created by Osama Walid on 14/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tabsCollectionView: UICollectionView!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var listSwitcher: UIButton!
    @IBOutlet weak var gridSwitcher: UIButton!
    @IBOutlet weak var serachTextField: UITextField!
    
    var photos:[Photo] = []
    var tabs : [String] = ["Images","My Favourite"]
    
    var layoutType:LayoutType = .grid
    var currentPage = 1
    var totalOfPages = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        getPhotos(page: currentPage)
        
    }
    @IBAction func searchTextFieldDidChange(_ sender: UITextField) {
        if sender.text!.count < 3 {
            return
        }
        searchForPhotos(page: currentPage, query: sender.text!)
    }
    
    
    @IBAction func switchLayout(_ sender: UIButton) {
        if sender == gridSwitcher {
            layoutType = .grid
        }else {
            layoutType = .list
        }
        photosCollectionView.reloadData()
    }
   
    
    func searchForPhotos(page:Int,query:String){
        ApiService.instance.searchPhotos(page: page, query: query) {[weak self] isSuccess, data, error in
            if isSuccess {
                self?.photos = data!.results!
                self?.totalOfPages = data!.totalPages ?? 1
                DispatchQueue.main.async {
                    self?.photosCollectionView.reloadData()
                }
            }else {
                print(error)
            }
        }
    }
    
    func getPhotos(page:Int){
        ApiService.instance.getPhotos(page: page) { [weak self] isSuccess, data, error in
            if isSuccess {
                self?.photos = data!
                DispatchQueue.main.async {
                    self?.photosCollectionView.reloadData()
                }
            }else {
                print(error)
            }
        }
    }
    
}

extension ViewController {
    func setUpViews(){
        setUpSearchTextField()
        setUpTabsCollectionView()
        setUpPhotosCollectionView()
    }
    
    func setUpSearchTextField(){
        serachTextField.layer.cornerRadius = 10
        serachTextField.addPadding(padding: .equalSpacing(8))
        serachTextField.currencyLeftVeiw(image: UIImage(named: "ic_serach")!)
        serachTextField.attributedPlaceholder = NSAttributedString(
            string: "Search your Image ...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
    func setUpPhotosCollectionView(){
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        photosCollectionView.register(cellClass: PhotosCollectionViewCell.self)

    }
    func setUpTabsCollectionView(){
        tabsCollectionView.dataSource = self
        tabsCollectionView.delegate = self
       
        tabsCollectionView.register(cellClass: CategoryCollectionViewCell.self)
        tabsCollectionView.selectItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, animated: false, scrollPosition: .centeredHorizontally)

    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == photosCollectionView {
            let width = collectionView.frame.width / CGFloat(layoutType.rawValue)
            return CGSize(width: width - 8, height: width * 2)
        }else {
            return CGSize(width: 120.0, height: collectionView.frame.height)
        }
        
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == photosCollectionView {
            return photos.count
        }else {
            return tabs.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == photosCollectionView {
            let cell = collectionView.dequeueReusableCell(withClass: PhotosCollectionViewCell.self, for: IndexPath(item: indexPath.row, section: 0))
            cell.setUpCellContent(photo: photos[indexPath.row])
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withClass: CategoryCollectionViewCell.self, for: IndexPath(item: indexPath.row, section: 0))
            cell.setUpCellContent(title: tabs[indexPath.row])
            return cell
        }
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == photosCollectionView {
            
        }else {
        }
    }
}
