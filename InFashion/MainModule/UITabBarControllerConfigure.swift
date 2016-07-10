//
//  UITabBarViewControllerConfigure.swift
//  InFashion
//
//  Created by 庄小强 on 16/7/10.
//  Copyright © 2016年 zxq. All rights reserved.
//

import UIKit

class UITabBarControllerConfigure: NSObject {

    class func getTabBarController() -> CYLTabBarController {
        
        let nav1 = UINavigationController.init(rootViewController: FollowTImeLineViewController())
        let nav2 = UINavigationController.init(rootViewController: DiscoverViewController())
        let nav3 = UINavigationController.init(rootViewController: InMeViewController())
        let nav4 = UINavigationController.init(rootViewController: UserCenterViewController())
        
        let viewControllers = [nav1, nav2, nav3, nav4];
        
        let dic1 = [CYLTabBarItemTitle as NSObject:"关注" as AnyObject, CYLTabBarItemImage:"grayfriend" as AnyObject , CYLTabBarItemSelectedImage:"redfriend" as AnyObject]
        let dic2 = [CYLTabBarItemTitle as NSObject:"发现" as AnyObject, CYLTabBarItemImage:"graydiscover" as AnyObject , CYLTabBarItemSelectedImage:"reddiscover" as AnyObject]
        let dic3 = [CYLTabBarItemTitle as NSObject:"in记" as AnyObject, CYLTabBarItemImage:"grayinji" as AnyObject , CYLTabBarItemSelectedImage:"redinji" as AnyObject]
        let dic4 = [CYLTabBarItemTitle as NSObject:"中心" as AnyObject, CYLTabBarItemImage:"graycenter" as AnyObject , CYLTabBarItemSelectedImage:"redcenter" as AnyObject]
        let itemsAttributes = [dic1, dic2, dic3, dic4];
        
        let tabBarVC = CYLTabBarController.init(viewControllers: viewControllers, tabBarItemsAttributes: itemsAttributes)
        
        let selectAttrs = [NSForegroundColorAttributeName:UIColor.red()]
        
        let tabBarItem = UITabBarItem.appearance()
        
        tabBarItem.setTitleTextAttributes(selectAttrs, for: .selected)
        
        let tabBar = UITabBar.appearance()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = UIColor.white()
        tabBar.shadowImage = UIImage.init(named: "tapbar_top_line")
        
        return tabBarVC!
    }
    
}
