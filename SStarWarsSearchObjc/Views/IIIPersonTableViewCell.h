//
//  IIIPersonTableViewCell.h
//  SStarWarsSearchObjc
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class IIIPerson;
@interface IIIPersonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *eyeColorLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@property (strong, nonatomic) IIIPerson *person;

@end

NS_ASSUME_NONNULL_END
