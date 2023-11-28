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


class StockPurchase
StockPurchase : +spid int
StockPurchase : +date DateTime
StockPurchase : +price double
StockPurchase : +quantity int

```
