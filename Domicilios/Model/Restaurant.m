//
//  PCHAskedQuestions.m
//  Banca Movil
//
//  Created by Arturo Gamarra on 7/7/15.
//  Copyright (c) 2015 YellowPepper. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

- (void)copyFromJSON:(NSDictionary *)json
{
    NSString *newString1 = [[json objectForKey:@"answer"] stringByReplacingOccurrencesOfString:@"\n\t\t" withString:@""];
    NSString *newString2 = [newString1 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    self.answer = newString2;
    self.question = [json objectForKey:@"question"];
    self.showAnswer = NO;
}

@end
