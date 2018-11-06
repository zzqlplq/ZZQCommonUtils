//
//  NSDate+ZZQExtension.m
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import "NSDate+ZZQExtension.h"

static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

static const unsigned componentFlagsWithoutDetail = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);


@implementation NSDate (ZZQExtension)

+ (NSCalendar *)currentCalendar {
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) {
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
        [sharedCalendar setFirstWeekday:2];
    }
    return sharedCalendar;
}


+ (NSDate *)dateTomorrow {
    return [NSDate dateWithDaysFromNow:1];
}

+ (NSDate *)dateYesterday {
    return [NSDate dateWithDaysBeforeNow:1];
}

+ (NSDate *)dateWithDaysFromNow:(NSInteger)days {
    return [[NSDate date] dateByAddingDays:days];
}

+ (NSDate *)dateWithDaysBeforeNow:(NSInteger)days {
    return [[NSDate date] dateBySubtractingDays:days];
}

+ (NSDate *)dateWithHoursFromNow:(NSInteger)hours {
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + TIME_HOUR * hours;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return date;
}

+ (NSDate *)dateWithHoursBeforeNow:(NSInteger)hours {
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - TIME_HOUR * hours;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return date;
}

+ (NSDate *)dateWithMinutesFromNow:(NSInteger)minutes {
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + TIME_MINUTE * minutes;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return date;
}

+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger)minutes {
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - TIME_MINUTE * minutes;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return date;
}


- (NSString *)stringWithDateFormatter:(NSString *)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}


- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date {
    
    NSDateComponents *components1 = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:componentFlags fromDate:date];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL)isToday {
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)isTomorrow {
    return [self isEqualToDateIgnoringTime:[NSDate dateTomorrow]];

}

- (BOOL)isYesterday {
    return [self isEqualToDateIgnoringTime:[NSDate dateYesterday]];
}


- (BOOL)isSameWeekAsDate:(NSDate *)date {
    
    NSDate *monday = [date dateAtMondayOfThisWeek];
    NSDate *sunday = [date dateAtSundayOfThisWeek];
    BOOL isLaterMondy = [self isLaterOrSameDate:monday];
    BOOL isEarlierSunday = [self isEarlierOrSameDate:sunday];

    return isLaterMondy && isEarlierSunday;
}

- (BOOL)isThisWeek {
    return [self isSameWeekAsDate:[NSDate date]];
}

- (BOOL)isNextWeek {
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + TIME_WEEK;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return [self isSameWeekAsDate:date];
}

- (BOOL)isLastWeek {
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - TIME_WEEK;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return [self isSameWeekAsDate:date];
}


- (BOOL)isSameMonthAsDate:(NSDate *)date {
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date];
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL)isThisMonth {
    return [self isSameMonthAsDate:[NSDate date]];
}

- (BOOL)isNextMonth {
    return [self isSameMonthAsDate:[[NSDate date] dateByAddingMonths:1]];
}

- (BOOL)isLastMonth {
    return [self isSameMonthAsDate:[[NSDate date] dateBySubtractingMonths:1]];
}


- (BOOL)isSameYearAsDate:(NSDate *)date {
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:date];
    return (components1.year == components2.year);
}

- (BOOL)isThisYear {
    return [self isSameYearAsDate:[NSDate date]];
}

- (BOOL)isNextYear {
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    return (components1.year == (components2.year + 1));
}

- (BOOL)isLastYear {
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    return (components1.year == (components2.year - 1));
}


- (BOOL)isEarlierThanDate:(NSDate *)date {
    return ([self compare:date] == NSOrderedAscending);
}

- (BOOL)isEarlierOrSameDate:(NSDate *)date {
    NSComparisonResult result = [self compare:date];
    return (result == NSOrderedAscending || result == NSOrderedSame);
}

- (BOOL)isLaterThanDate:(NSDate *)date {
    return ([self compare:date] == NSOrderedDescending);
}

- (BOOL)isLaterOrSameDate:(NSDate *)date {
    NSComparisonResult result = [self compare:date];
    return (result == NSOrderedDescending || result == NSOrderedSame);
}


- (NSDate *)dateAtStartOfDay {
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateAtEndOfDay {
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    return [[NSDate currentCalendar] dateFromComponents:components];
}

- (NSDate *)dateAtMondayOfThisWeek {
    
    NSDateComponents *dateComponents = [[NSDate currentCalendar] components:componentFlagsWithoutDetail fromDate:self];
    NSInteger currentDay = [dateComponents day];
    NSInteger differ = [self getDateDiffWithWeekStart:YES];
    
    [dateComponents setDay:currentDay + differ];
    NSDate *monday = [[NSDate currentCalendar] dateFromComponents:dateComponents];
    return monday;
}


- (NSDate *)dateAtSundayOfThisWeek {
    
    NSDateComponents *dateComponents = [[NSDate currentCalendar] components:componentFlagsWithoutDetail fromDate:self];
    NSInteger currentDay = [dateComponents day];
    NSInteger differ = [self getDateDiffWithWeekStart:NO];
    
    [dateComponents setDay:currentDay + differ];
    // 获取到星期日的最后一秒  23：59：59
    NSDate *sunday = [[[NSDate currentCalendar] dateFromComponents:dateComponents] dateByAddingTimeInterval:(TIME_DAY - 1)];
    return sunday;
}


- (NSInteger)getDateDiffWithWeekStart:(BOOL)isStart {
    
    NSDateComponents *dateComponents = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    NSInteger weekDay = [dateComponents weekday];
    
    NSInteger startDiff;
    if (weekDay == 1) {
        startDiff = - 6;
    } else {
        startDiff = [[NSDate currentCalendar] firstWeekday] - weekDay;
    }
    return isStart ? startDiff : (startDiff + 6);
}



- (NSDate *)dateByAddingYears: (NSInteger)years {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:years];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)dateBySubtractingYears: (NSInteger)years {
    return [self dateByAddingYears:(years * -1)];
}

- (NSDate *)dateByAddingMonths: (NSInteger)months {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:months];
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return date;
}

- (NSDate *)dateBySubtractingMonths: (NSInteger)months {
    return [self dateByAddingMonths:(months * -1)];
}

- (NSDate *)dateByAddingDays: (NSInteger)days {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:days];
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return date;
}

- (NSDate *)dateBySubtractingDays: (NSInteger)days {
    return [self dateByAddingDays:(days * -1)];
}

- (NSDate *)dateByAddingHours: (NSInteger)hours {
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] + TIME_HOUR * hours;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return date;
}

- (NSDate *)dateBySubtractingHours: (NSInteger)hours {
    return [self dateByAddingHours:(hours * -1)];
}

- (NSDate *)dateByAddingMinutes: (NSInteger)minutes {
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] + TIME_MINUTE * minutes;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return date;
}


- (NSDate *)dateBySubtractingMinutes: (NSInteger)minutes {
    return [self dateByAddingMinutes:(minutes * -1)];
}


- (NSDate *)dateWithFormat:(NSString *)format {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = format;
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}



@end
