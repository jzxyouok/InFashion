//
//  DiscoverViewController.swift
//  InFashion
//
//  Created by 庄小强 on 16/7/23.
//  Copyright © 2016年 zxq. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "搜索用户和标签"
        searchBar.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 64)
        return searchBar
    }()
    
    private var hotData: [JSON]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main().urlForResource("discover_hot", withExtension: "json") {
            print(path)
            do {
                let data = try JSON.init(data: Data.init(contentsOf: path))
                hotData = data.dictionary?["items"]?.array
//                print(hotData)
            } catch  {
                
            }
        }
        
        createUI()
    }

    func createUI(){
        view.backgroundColor = UIColor.white()
        collectionView.backgroundColor = UIColor.white()
        collectionView.register(DiscoverCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(DiscoverCollectionViewCell.classForCoder()))
        flowLayout.sectionHeadersPinToVisibleBounds = true
        self.navigationItem.titleView = self.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension DiscoverViewController: UISearchBarDelegate{
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
}

extension DiscoverViewController: UICollectionViewDelegate{
    
}

extension DiscoverViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (hotData.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(DiscoverCollectionViewCell.classForCoder()), for: indexPath) as! DiscoverCollectionViewCell
        
        if let data = hotData[indexPath.row].dictionary?["photo_url"]?.string{
            cell.imageView.sd_setImage(with: URL(string: data)! as URL!) { (image, error, cacheType, url) in
            }
        }
        

        
        return cell
    }
}
