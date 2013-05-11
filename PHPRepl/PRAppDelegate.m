//
//  PRAppDelegate.m
//  PHPRepl
//
//  Created by Lucas Jenß on 5/10/13.
//  Copyright (c) 2013 Lucas Jenß. All rights reserved.
//

#import "PRAppDelegate.h"

@implementation PRAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString* cmd;
    if([self isItermInstalled]) {
        cmd = [self iTermScript];
    } else {
        cmd = [self terminalScript];
    }

    [self runAppleScript:cmd];

    // Nothing left to do after we launch the terminal. Bye.
    [NSApp terminate:self];
}


/**
 * Returns the AppleScript necessary to launch a new Boris REPL session in iTerm
 */
- (NSString*)iTermScript {
    NSString* string = [self stringWithContentsOfResource:@"iTerm2" ofType:@"txt"];
    return [NSString stringWithFormat:string, [self borisCommand]];
}

/**
 * Returns the AppleScript necessary to launch a new Boris REPL session in Terminal.app
 */
- (NSString*)terminalScript {
    NSString* string = [self stringWithContentsOfResource:@"Terminal" ofType:@"txt"];
    return [NSString stringWithFormat:string, [self borisCommand]];
}

/**
 * Run the given AppleScript (ignoring any errors, for now).
 * TODO: Error handling
 */
- (void)runAppleScript:(NSString*)script {
    NSAppleScript *as = [[NSAppleScript alloc] initWithSource: script];
    [as executeAndReturnError:nil];
}

/**
 * Generates the command that starts the Boris REPL inside a terminal.
 */
-(NSString*)borisCommand {
    NSString* string = [self stringWithContentsOfResource:@"BorisCommand" ofType:@"txt"];
    NSString* path = [[NSBundle mainBundle] bundlePath];
    return [NSString stringWithFormat:string, path, path];
}

/**
 * Loads the given resource into a string. Assumes UTF8 encoding.
 */
-(NSString*)stringWithContentsOfResource:(NSString*)resource ofType:(NSString*)type {
    NSString *aPath = [[NSBundle mainBundle] pathForResource:resource ofType:type];
    NSData* data = [NSData dataWithContentsOfFile:aPath];

    NSString* string = [[NSString alloc] initWithBytes:[data bytes]
                                                length:[data length]
                                              encoding:NSUTF8StringEncoding];

    return string;
}

/**
 * Need to check whether iTerm is installed, so that I can either run the AppleScript to start
 * iTerm or Terminal.
 */
-(Boolean)isItermInstalled {
    NSURL *theURL = [NSURL fileURLWithPath:@"/Applications/iTerm.app" isDirectory:YES];
    return [theURL checkResourceIsReachableAndReturnError:nil];
}

@end
