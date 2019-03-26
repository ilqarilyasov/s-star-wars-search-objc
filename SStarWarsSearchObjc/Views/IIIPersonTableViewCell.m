//
//  IIIPersonTableViewCell.m
//  SStarWarsSearchObjc
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import "IIIPersonTableViewCell.h"
#import "../Model/IIIPerson.h"

@implementation IIIPersonTableViewCell

- (void)setPerson:(IIIPerson *)person
{
    _person = person;
    [self updateViews];
}

- (void)updateViews
{
    if (_person) {
        [[self nameLabel] setText:[_person name]];
        [[self birthYearLabel] setText: [NSString stringWithFormat:@"Born %@", [_person birthYear]]];
        [[self heightLabel] setText: [NSString stringWithFormat:@"%@ cm", [_person height]]];
        [[self eyeColorLabel] setText: [NSString stringWithFormat:@"%@ eyes", [[_person eyeColor] capitalizedString]]];
    }
}

@end
