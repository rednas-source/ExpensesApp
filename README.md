# expense_tracker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Class Diagram

```mermaid
classDiagram
class MyApp
MyApp : +createState() State<MyApp>
StatefulWidget <|-- MyApp

class _MyAppState
_MyAppState : -_pages$ List~Widget~
_MyAppState : +build() Widget
State <|-- _MyAppState

class Portfolio
Portfolio : +pid int
Portfolio : +user User
Portfolio o-- User
Portfolio : +stockPurchases Set~StockPurchase~

class PortfolioHistory
PortfolioHistory : +phid int
PortfolioHistory : +date DateTime
PortfolioHistory : +price double

class Stock
Stock : +id int
Stock : +symbol String
Stock : +name String
Stock : +currentPrice double
Stock : +openingPrice double
Stock : +percentChangeIntraday double
Stock : +toJson() Map<String, dynamic>

class StockHistory
StockHistory : +date DateTime
StockHistory : +open double
StockHistory : +close double
StockHistory : +high double
StockHistory : +low double
StockHistory : +volume int

class StockListModel
StockListModel : +lid int
StockListModel : +name String
StockListModel : +stocks List~Map~String, dynamic~~
StockListModel : +valid bool

class StockPurchase
StockPurchase : +spid int
StockPurchase : +date DateTime
StockPurchase : +price double
StockPurchase : +quantity int

class User
User : +email String
User : +password String
User : +uid int
User : +toJson() Map<String, dynamic>

class TokenManager
TokenManager : +storage$ FlutterSecureStorage
TokenManager o-- FlutterSecureStorage
TokenManager : +storeToken()$ void
TokenManager : +getToken()$ dynamic
TokenManager : +removeToken()$ void

class UserProvider
UserProvider : -_user User?
UserProvider o-- User
UserProvider : +user User?
UserProvider o-- User
UserProvider : +setUser() void
ChangeNotifier <|-- UserProvider

class CustomNavigationBar
CustomNavigationBar : +selectedIndex int
CustomNavigationBar : +onItemTapped dynamic Functionint
CustomNavigationBar o-- dynamic Functionint
CustomNavigationBar : +build() Widget
StatelessWidget <|-- CustomNavigationBar

class AddListPage
AddListPage : +createState() _AddListPageState
StatefulWidget <|-- AddListPage

class _AddListPageState
_AddListPageState : +nameController TextEditingController
_AddListPageState o-- TextEditingController
_AddListPageState : -_addListToServer() dynamic
_AddListPageState : -_createList() void
_AddListPageState : -_checkIfNameIsValid() bool
_AddListPageState : -_navMyListPage() void
_AddListPageState : +build() Widget
State <|-- _AddListPageState

class ExplorePage
ExplorePage : +createState() _ExplorePageState
StatefulWidget <|-- ExplorePage

class _ExplorePageState
_ExplorePageState : +stocks List~Stock~
_ExplorePageState : +filteredStocks List~Stock~
_ExplorePageState : +isLoading bool
_ExplorePageState : +initState() void
_ExplorePageState : -_fetchStocksDataFromServer() dynamic
_ExplorePageState : -_goToStockDetailPage() dynamic
_ExplorePageState : -_navToStockDetailPage() void
_ExplorePageState : -_filterStocks() void
_ExplorePageState : -_sortStocksByHighestPrice() void
_ExplorePageState : -_sortStocksByLowestPrice() void
_ExplorePageState : -_sortStocksByBiggestEarner() void
_ExplorePageState : -_sortStocksByBiggestLoser() void
_ExplorePageState : -_showSortOptions() void
_ExplorePageState : -_onRefresh() dynamic
_ExplorePageState : +build() Widget
State <|-- _ExplorePageState

class Inventory
Inventory : +createState() State<Inventory>
StatefulWidget <|-- Inventory

class _InventoryState
_InventoryState : +stocks List~Stock~
_InventoryState : +monetaryChange double?
_InventoryState : +percentageChange double?
_InventoryState : +portfolioHistory List~PortfolioHistory~
_InventoryState : +initState() void
_InventoryState : +didChangeDependencies() void
_InventoryState : -_goToStockDetailPage() void
_InventoryState : -_fetchStockDataFromServer() dynamic
_InventoryState : -_setPortfolioHistoriesWithDataFromServer() dynamic
_InventoryState : -_futureYourDevelopmentDataFromServer() dynamic
_InventoryState : -_setDevelopmentText() dynamic
_InventoryState : -_onRefresh() dynamic
_InventoryState : +build() Widget
State <|-- _InventoryState

class LoginPage
LoginPage : +createState() _LoginPageState
StatefulWidget <|-- LoginPage

class _LoginPageState
_LoginPageState : +emailController TextEditingController
_LoginPageState o-- TextEditingController
_LoginPageState : +passwordController TextEditingController
_LoginPageState o-- TextEditingController
_LoginPageState : +storage FlutterSecureStorage
_LoginPageState o-- FlutterSecureStorage
_LoginPageState : +isLoggedIn bool
_LoginPageState : +isLoading bool
_LoginPageState : +login() dynamic
_LoginPageState : +getLoginUser() dynamic
_LoginPageState : +storeToken() void
_LoginPageState : +getToken() dynamic
_LoginPageState : +removeToken() void
_LoginPageState : +navSignUpPage() void
_LoginPageState : +build() Widget
State <|-- _LoginPageState

class MainPage
MainPage : +selectedIndex int
MainPage : +createState() State<MainPage>
StatefulWidget <|-- MainPage

class _MainPageState
_MainPageState : -_pages$ List~Widget~
_MainPageState : -_onItemTapped() void
_MainPageState : +build() Widget
State <|-- _MainPageState

class MyListsPage
MyListsPage : +createState() _MyListsPageState
StatefulWidget <|-- MyListsPage

class _MyListsPageState
_MyListsPageState : +lists List~StockListModel~
_MyListsPageState : +isLoading bool
_MyListsPageState : +initState() void
_MyListsPageState : +didChangeDependencies() void
_MyListsPageState : -_fetchDataFromServer() dynamic
_MyListsPageState : -_navToAddListPage() void
_MyListsPageState : -_goTiListPageWithDataFromServer() dynamic
_MyListsPageState : -_navToListPage() void
_MyListsPageState : +build() Widget
State <|-- _MyListsPageState

class NewUserPage
NewUserPage : +build() Widget
StatelessWidget <|-- NewUserPage

class OnboardingPagePresenter
OnboardingPagePresenter : +pages List~NewUSerPageModel~
OnboardingPagePresenter : +onSkip void Function?
OnboardingPagePresenter o-- void Function
OnboardingPagePresenter : +onFinish void Function?
OnboardingPagePresenter o-- void Function
OnboardingPagePresenter : +createState() State<OnboardingPagePresenter>
StatefulWidget <|-- OnboardingPagePresenter

class _OnboardingPageState
_OnboardingPageState : -_currentPage int
_OnboardingPageState : -_pageController PageController
_OnboardingPageState o-- PageController
_OnboardingPageState : -_navigateToLoginPage() void
_OnboardingPageState : +build() Widget
State <|-- _OnboardingPageState

class NewUSerPageModel
NewUSerPageModel : +title String
NewUSerPageModel : +description String
NewUSerPageModel : +imageUrl String
NewUSerPageModel : +bgColor Color
NewUSerPageModel o-- Color
NewUSerPageModel : +textColor Color
NewUSerPageModel o-- Color

class SignUp
SignUp : +createState() _SignUpState
StatefulWidget <|-- SignUp
```
