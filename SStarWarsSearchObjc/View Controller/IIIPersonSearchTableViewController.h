//
//  IIIPersonSearchTableViewController.h
//  SStarWarsSearchObjc
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class IIIPersonController;
@interface IIIPersonSearchTableViewController : UITableViewController<UISearchBarDelegate>

@property (strong, nonatomic) IIIPersonController *personController;
@property (strong, nonatomic) NSMutableArray *people;

@end

NS_ASSUME_NONNULL_END
