//
//  IIIPerson.h
//  SStarWarsSearchObjc
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIPerson : NSObject


#pragma mark - Initializers

- (instancetype)initWithName:(NSString *)name
                   birthYear:(NSString *)birthYear
                    eyeColor:(NSString *)eyeColor
                      height:(NSString *)height;


// A helper for NSJSONSerialization
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


#pragma mark - Properties

// Primitives are just a value, no other "fluff"
// Numbers, BOOL, C String

// "" - C String
// @"" - NSString

// If it has a prefix, it's probably an object
// Except for NSInteger

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *birthYear;
@property (strong, nonatomic) NSString *eyeColor;
@property (strong, nonatomic) NSString *height;


@end

NS_ASSUME_NONNULL_END
