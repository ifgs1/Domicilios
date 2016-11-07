//
//  PCHAskedQuestions.h
//  Banca Movil
//
//  Created by Arturo Gamarra on 7/7/15.
//  Copyright (c) 2015 YellowPepper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property (nonatomic) BOOL showAnswer;
@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSString *answer;

- (void)copyFromJSON:(NSDictionary *)json;

@end
