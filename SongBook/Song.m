//
//  Song.m
//  Song Book
//
//  Created by Todd Schultz on 8/19/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import "Song.h"

@implementation Song

-(id)initWithName:(NSString *)name andImageName:(NSString *)imageName andDifficulty:(NSString *)difficulty andVideoName:(NSString *)videoName andTablature:(NSString *)tab andLyric:(NSString *)lyric
{
    if (self = [super init]) {
        _name = name;
        _imageName = imageName;
        _dificulty = difficulty;
        _videoName = videoName;
        _tab = tab;
        _lyric = lyric;
    }
    
    return self;
}
@end
