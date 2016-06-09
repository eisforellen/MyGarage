//
//  MainTableViewController.m
//  MyGarage
//
//  Created by Ellen Mey on 6/8/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "MainTableViewController.h"
#import "Vehicle.h"
#import "UpdateViewController.h"

@interface MainTableViewController ()

@property NSMutableArray *vehicleArray;

@end

@implementation MainTableViewController


- (void)viewDidLoad {
    
    
    Vehicle *car1 = [[Vehicle alloc]initVehicleWithNickname:@"Red Car" make:@"Ford" model:@"Mustang" mileage:10000];
    _vehicleArray = @[car1].mutableCopy;

    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _vehicleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    

    cell.textLabel.text= [[_vehicleArray objectAtIndex:indexPath.row] nickname];
    // refactor to include Make and Modle concatenated
   cell.detailTextLabel.text = [[_vehicleArray objectAtIndex:indexPath.row] make];
    
    return cell;
}



 //Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // This deletes the cell, issue with cell count causes crash
        //[tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_vehicleArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        // This removes object from Array
        [_vehicleArray removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    } //else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   // }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"toAddVC"]){
        
        AddViewController *vc = [segue destinationViewController];
        NSLog(@"prepare for segue action");
    }
    else if([[segue identifier] isEqualToString:@"updateSegueIdentifier"]) {
        UpdateViewController *vc = [segue destinationViewController];
        NSLog(@"segue for update view");
        
        vc.updatedVehicle = [[Vehicle alloc]init];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        vc.updatedVehicle = [self.vehicleArray objectAtIndex:indexPath.row];
    }
    
}

-(IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue{
    if([[unwindSegue identifier] isEqualToString:@"unwindAddVC"]){
    AddViewController *addVC = [unwindSegue sourceViewController];
    
    
    addVC.vehicle = [[Vehicle alloc]init];
    addVC.vehicle.nickname = addVC.nicknameInput.text;
    addVC.vehicle.make = addVC.makeInput.text;
    addVC.vehicle.model = addVC.modelInput.text;
    addVC.vehicle.mileage = [addVC.mileageInput.text intValue];
    addVC.vehicle.lastServiceMileage = [addVC.mileageInput.text intValue];
  
    _addedVehicle = [[Vehicle alloc]init];
    _addedVehicle = addVC.vehicle;
    NSLog(@"%@", _addedVehicle.nickname);
    [self.vehicleArray addObject:_addedVehicle];
    NSLog(@"New vehicle list: %@", _vehicleArray.description);
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.vehicleArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    else if([[unwindSegue identifier] isEqualToString:@"unwindUpdateVC"]) {
        UpdateViewController *vc = [unwindSegue sourceViewController];
        NSLog(@"segue for update view");
    }

        
}


@end
