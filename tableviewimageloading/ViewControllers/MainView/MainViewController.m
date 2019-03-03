//
//  MainViewController.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 20/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "MainViewController.h"
#import "ImagesTableViewController.h"

@implementation MainViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"showImagesTableView"]) {

        NSArray *images = @[
                            @"388834-lcdledoledtvs-samsung-qn65q8c",
                            @"388834-lcdledoledtvs-samsung-qn65q8c",
                            @"388834-lcdledoledtvs-samsung-qn65q8c",
                            @"388834-lcdledoledtvs-samsung-qn65q8c",
                            @"388834-lcdledoledtvs-samsung-qn65q8c",
                            @"388697-lcdledoledtvs-samsung-qn65q7f",
                            @"395310-lcd-led-oled-tvs-samsung-qn55q8fn-60793",
                            @"396114-tvs-samsung-qn65q75fn-62412",
                            @"396112-tvs-samsung-qn65q75cn-63211",
                            @"396114-tvs-samsung-qn65q75fn-62412",
                            @"395315-lcd-led-oled-tvs-lg-55sk9000pua-60638",
                            @"396927-tvs-sony-xbr-65z9f-10000534",
                            @"395308-lcd-led-oled-tvs-lg-65sk9000pua-60347",
                            @"395142-lcd-led-oled-tvs-samsung-qn65q7fn-60064",
                            @"395309-lcd-led-oled-tvs-samsung-qn55q7fn-60684",
                            @"395144-lcd-led-oled-tvs-samsung-qn65q9fn-60009",
                            @"395324-lcd-led-oled-tvs-samsung-qn65q7cn-60528",
                            @"395687-lcd-led-oled-tvs-samsung-qn55q7cn-61189",
                            @"395308-lcd-led-oled-tvs-lg-65sk9000pua-60347",
                            @"395141-lcd-led-oled-tvs-lg-65sk9500-60270",
                            @"389301-lcdledoledtvs-lg-oled55e7p",
                            @"396927-tvs-sony-xbr-65z9f-10000534",
                            @"389578-lcdledoledtvs-lg-oled65e7p",
                            @"389208-lcdledoledtvs-sony-braviaxbr65a1e",
                            @"388828-lcdledoledtvs-lg-oled55c7p",
                            ];

        ImagesTableViewModel *viewModel = [[ImagesTableViewModel alloc] initWithImages:images];
        ((ImagesTableViewController *)segue.destinationViewController).viewModel = viewModel;
    }

}

@end
