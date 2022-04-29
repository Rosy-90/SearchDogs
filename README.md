# SearchDogsBreed

- Use XCode 12.2 or above version. 
- Used Swift 5.x
- Used KingFisher through cocoapods
# approaches

- Using MVVM-C (Model View View Model Coordinator Architecture)
- UI is added in View Folder. 
- View Models are added in ViewModel Folder
- Networking realted code is added in Service Folder. 
-  Use storyboard extension on UIViewController , this will reduce redudant code to create controller object from storyboard, example used in MainCoordinator. 
-  Followed protocal oriented programming approach. 
-  Curent coverage is 46% , viewModels has 100% coverage. 
- Protocal delegate pattern is used to communicate b/w viewModel and View. 


# List current limitations

-   Network availabilty check not implemented
-   Defualt image is not added. 
-   No UI testing. 
-   External link to Wikipedia , Energy level not part of search API , might need to look other API call for this. 
-   Combine or RxSwift is not used. 


# State known issues with proposed solutions if you have time to improve in the future

- have integrated SwiftReachability to check netowork availabilty 
- Have used XCTest to write UI test
- Have Used Combine. 
