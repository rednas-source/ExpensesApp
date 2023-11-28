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
```
