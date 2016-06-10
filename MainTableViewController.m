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


//@property NSMutableArray *vehicleArray;

@end

@implementation MainTableViewController


- (void)viewDidLoad {
    
    
  //  Vehicle *car1 = [[Vehicle alloc]initVehicleWithNickname:@"Red Car" make:@"Ford" model:@"Mustang" mileage:10000 ];
   // vehicleArray = @[car1].mutableCopy;
    vehicleArray = [Vehicle allObjects];
    
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

-(void)insertDataIntoDataBaseWithName:(NSString *)name make:(NSString *)make model:(NSString *)model mileage:(int)miles date:(NSDate *)date{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    Vehicle *information = [[Vehicle alloc] init];
    information.nickname = name;
    information.make = make;
    information.model = model;
    information.mileage = miles;
    information.lastServiceMileage = miles;
    information.lastServiceDate = date;
    [realm addObject:information];
    [realm commitWriteTransaction];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return vehicleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    

    cell.textLabel.text= [[vehicleArray objectAtIndex:indexPath.row] nickname];
    // refactor to include Make and Modle concatenated
  // cell.detailTextLabel.text = [[vehicleArray objectAtIndex:indexPath.row] make];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ / %@", [[vehicleArray objectAtIndex:indexPath.row] make], [[vehicleArray objectAtIndex:indexPath.row] model]];
    
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
      
        // This removes object from Array
        [[RLMRealm defaultRealm] beginWriteTransaction];
        [[RLMRealm defaultRealm]deleteObject:[vehicleArray objectAtIndex:indexPath.row]];
        [[RLMRealm defaultRealm] commitWriteTransaction];
        vehicleArray = [Vehicle allObjects];
        [tableView reloadData];
        // This would add animations
//        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [tableView setEditing:NO animated:YES];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
         //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
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
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"toAddVC"]){  // Add Vehicle Page
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    

    }else if([[segue identifier] isEqualToString:@"updateSegueIdentifier"]) { // Update page
        UpdateViewController *vc = [segue destinationViewController];
        NSLog(@"segue for update view");
        
        vc.updatedVehicle = [[Vehicle alloc]init];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        vc.updatedVehicle = [vehicleArray objectAtIndex:indexPath.row];
    }else if ([[segue identifier] isEqualToString:@"detailToRecordsSegue"]){ // Records Page
        // Gets the info from the cell that was clicked
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

        AddViewController *vc = [segue destinationViewController];
        vc.vehicle = [[Vehicle alloc]init];
        vc.vehicle = [vehicleArray objectAtIndex:indexPath.row];
        
        NSLog(@"Segue from Acc for cell %@", [[vehicleArray objectAtIndex:indexPath.row]nickname]);
    }
    
}

-(IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue{
    if([[unwindSegue identifier] isEqualToString:@"unwindAddVC"]){
    AddViewController *addVC = [unwindSegue sourceViewController];
    
    NSDate *now =  [NSDate date];
    addVC.initialDate = now;
    
    addVC.vehicle = [[Vehicle alloc]init];
    addVC.vehicle.nickname = addVC.nicknameInput.text;
    addVC.vehicle.make = addVC.makeInput.text;
    addVC.vehicle.model = addVC.modelInput.text;
    addVC.vehicle.mileage = [addVC.mileageInput.text intValue];
    addVC.vehicle.lastServiceMileage = [addVC.mileageInput.text intValue];
    addVC.vehicle.lastServiceDate = addVC.initialDate;
  
    _addedVehicle = [[Vehicle alloc]init];
    _addedVehicle = addVC.vehicle;
    NSLog(@"%@", _addedVehicle.nickname);
       
    // add new vehicle to realm database
    [self insertDataIntoDataBaseWithName:_addedVehicle.nickname make:_addedVehicle.make model:_addedVehicle.model mileage:_addedVehicle.mileage date:_addedVehicle.lastServiceDate];
        
    //[self.vehicleArray addObject:_addedVehicle];
   //NSLog(@"New vehicle list: %@", vehicleArray.description);
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:vehicleArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    else if([[unwindSegue identifier] isEqualToString:@"unwindUpdateVC"]) {
        UpdateViewController *vc = [unwindSegue sourceViewController];
        NSLog(@"segue for update view");
    }

        
}


@end
