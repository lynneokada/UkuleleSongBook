//
//  Song.h
//  Song Book
//
//  Created by Todd Schultz on 8/19/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *dificulty;
@property (strong, nonatomic) NSString *videoName;
@property (strong, nonatomic) NSString *tab;
@property (strong, nonatomic) NSString *lyric;

-(id)initWithName:(NSString *)name andImageName:(NSString *)imageName andDifficulty:(NSString *)difficulty andVideoName:(NSString *)videoName andTablature:(NSString *)tab andLyric:(NSString *)lyric;

@end
