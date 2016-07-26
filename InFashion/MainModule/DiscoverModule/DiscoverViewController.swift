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
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "搜索用户和标签"
        searchBar.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 64)
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        createUI()
        
        // Do any additional setup after loading the view.
    }

    func createUI(){
        view.backgroundColor = UIColor.white()
        collectionView.backgroundColor = UIColor.red()
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
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverCollectionViewCell", for: indexPath)
        return cell
    }
}
