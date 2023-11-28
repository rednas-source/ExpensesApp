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
MyApp : +settingsController SettingsController
MyApp o-- SettingsController
MyApp : +build() Widget
ConsumerWidget <|-- MyApp

class EventDataSource
EventDataSource : +getStartTime() DateTime
EventDataSource : +getEndTime() DateTime
EventDataSource : +getSubject() String
EventDataSource : +isAllDay() bool
EventDataSource : +getColor() Color
CalendarDataSource <|-- EventDataSource

class Announcement
Announcement : +id String
Announcement : +courseID String
Announcement : +published DateTime
Announcement : +message String

class Assignment
Assignment : +date String
Assignment : +subject String
Assignment : +title String
Assignment : +description String
Assignment : +bgColor Color
Assignment o-- Color

class AssignmentType
<<enumeration>> AssignmentType
AssignmentType : +index int
AssignmentType : +values$ List~AssignmentType~
AssignmentType : +deliver$ AssignmentType
AssignmentType o-- AssignmentType
AssignmentType : +quiz$ AssignmentType
AssignmentType o-- AssignmentType
Enum <|.. AssignmentType

class Content
Content : +contentType ContentType
Content o-- ContentType
Content : +name String
Content : +description String

class ContentType
<<enumeration>> ContentType
ContentType : +index int
ContentType : +values$ List~ContentType~
ContentType : +folder$ ContentType
ContentType o-- ContentType
ContentType : +assignment$ ContentType
ContentType o-- ContentType
ContentType : +file$ ContentType
ContentType o-- ContentType
Enum <|.. ContentType

class Course
Course : +id String
Course : +name String
Course : +fullname String
Course : +semester Semester
Course o-- Semester

class Event
Event : +name String
Event : +start DateTime
Event : +end DateTime
Event : +color Color?
Event o-- Color
Event : +room String?
Event : +descripton String?
Event : +fromJson()$ Event

class GroupDetails
GroupDetails : +id String
GroupDetails : +name String

class Semester
Semester : +semesterPart SemesterPart
Semester o-- SemesterPart
Semester : +year int
Semester : -_currentSemesterPart$ SemesterPart
Semester o-- SemesterPart
Semester : +nextSemester() Semester
Semester : +previousSemester() Semester
Semester : +toString() String
Semester : +toEquals() dynamic

class SemesterPart
<<enumeration>> SemesterPart
SemesterPart : +index int
SemesterPart : +values$ List~SemesterPart~
SemesterPart : +spring$ SemesterPart
SemesterPart o-- SemesterPart
Enum <|.. SemesterPart

class TimeSlot
TimeSlot : +start DateTime
TimeSlot : +end DateTime
TimeSlot : +room String

class UserDetails
UserDetails : +id String
UserDetails : +name String
UserDetails : +groups_id int?

class AnnouncementRepository
AnnouncementRepository : -_client SupabaseClient
AnnouncementRepository o-- SupabaseClient
AnnouncementRepository : +ref Ref~Object?~
AnnouncementRepository o-- Ref~Object~
AnnouncementRepository : -_getAnnouncements() dynamic
StateNotifier <|-- AnnouncementRepository

class CourseRepository
CourseRepository : -_client SupabaseClient
CourseRepository o-- SupabaseClient
CourseRepository : +ref Ref~Object?~
CourseRepository o-- Ref~Object~
CourseRepository : +channel RealtimeChannel?
CourseRepository o-- RealtimeChannel
CourseRepository : -_getCourses() dynamic
CourseRepository : +updateCourses() dynamic
StateNotifier <|-- CourseRepository

class CurrentUserInformation
CurrentUserInformation : -_client SupabaseClient
CurrentUserInformation o-- SupabaseClient
CurrentUserInformation : +ref Ref~Object?~
CurrentUserInformation o-- Ref~Object~
CurrentUserInformation : -_fetchUserDetails() void
ValueNotifier <|-- CurrentUserInformation

class GroupRepository
GroupRepository : +supabase SupabaseClient
GroupRepository o-- SupabaseClient
GroupRepository : +fetchGroups() dynamic

class ScheduleRepository
ScheduleRepository : -_client SupabaseClient
ScheduleRepository o-- SupabaseClient
ScheduleRepository : +ref Ref~Object?~
ScheduleRepository o-- Ref~Object~
ScheduleRepository : +channels List~RealtimeChannel~
ScheduleRepository : -_getEvents() dynamic
ScheduleRepository : +updateEvents() dynamic
StateNotifier <|-- ScheduleRepository

class UserDetailsRepository
UserDetailsRepository : +ref Ref~Object?~
UserDetailsRepository o-- Ref~Object~
UserDetailsRepository : -_client SupabaseClient
UserDetailsRepository o-- SupabaseClient
UserDetailsRepository o-- HashMap~String, UserDetails~
UserDetailsRepository : +fetchUser() UserDetails?

class CourseScreen
CourseScreen : +routeName$ String
CourseScreen : +course Course
CourseScreen o-- Course
CourseScreen : +createState() State<CourseScreen>
StatefulWidget <|-- CourseScreen

class _CourseScreenState
_CourseScreenState : -_currentIndex int
_CourseScreenState : -_children List~Widget~
_CourseScreenState : +build() Widget
_CourseScreenState : +onTabTapped() void
State <|-- _CourseScreenState

class Assignments
Assignments : +build() Widget
StatelessWidget <|-- Assignments

class Announcements
Announcements : +fetchAnnouncements() dynamic
Announcements : +build() Widget
StatelessWidget <|-- Announcements

class Group
Group : +fetchGroups() dynamic
Group : +build() Widget
StatelessWidget <|-- Group

class LoginScreen
LoginScreen : +routeName$ String
LoginScreen : +createState() ConsumerState<LoginScreen>
ConsumerStatefulWidget <|-- LoginScreen

class _LoginState
_LoginState : -_formKey GlobalKey~FormState~
_LoginState o-- GlobalKey~FormState~
_LoginState : +emailController TextEditingController
_LoginState o-- TextEditingController
_LoginState : +passwordController TextEditingController
_LoginState o-- TextEditingController
_LoginState : +build() Widget
ConsumerState <|-- _LoginState

class MainScreen
MainScreen : +routeName$ String
MainScreen : +createState() State<MainScreen>
StatefulWidget <|-- MainScreen

class _MainScreenState
_MainScreenState : -_selectedIndex int
_MainScreenState : -_widgetOptions$ List~Widget~
_MainScreenState : -_onItemTapped() void
_MainScreenState : +build() Widget
State <|-- _MainScreenState

class SettingsController
SettingsController : -_settingsService SettingsService
SettingsController o-- SettingsService
SettingsController : -_themeMode ThemeMode
SettingsController o-- ThemeMode
SettingsController : +themeMode ThemeMode
SettingsController o-- ThemeMode
SettingsController : +loadSettings() dynamic
SettingsController : +updateThemeMode() dynamic
ChangeNotifier <|-- SettingsController

class SettingsService
SettingsService : +themeMode() dynamic
SettingsService : +updateThemeMode() dynamic

class SettingsView
SettingsView : +routeName$ String
SettingsView : +controller SettingsController
SettingsView o-- SettingsController
SettingsView : +build() Widget
StatelessWidget <|-- SettingsView

class CalendarWidget
CalendarWidget : +createState() ConsumerState<CalendarWidget>
ConsumerStatefulWidget <|-- CalendarWidget

class _CalendarWidgetState
_CalendarWidgetState : -_subjectText String
_CalendarWidgetState : -_dateText String
_CalendarWidgetState : -_startTimeText String
_CalendarWidgetState : -_endTimeText String
_CalendarWidgetState : -_timeDetails String
_CalendarWidgetState : +build() Widget
_CalendarWidgetState : +calendarTapped() void
ConsumerState <|-- _CalendarWidgetState

class HeaderWidget
HeaderWidget : +title Text
HeaderWidget o-- Text
HeaderWidget : +appBar AppBar
HeaderWidget o-- AppBar
HeaderWidget : +preferredSize Size
HeaderWidget o-- Size
HeaderWidget : +build() Widget
StatelessWidget <|-- HeaderWidget
PreferredSizeWidget <|.. HeaderWidget

class HomeWidget
HomeWidget : +routeName$ String
HomeWidget : +createState() ConsumerState<HomeWidget>
ConsumerStatefulWidget <|-- HomeWidget

class _HomeWidgetState
_HomeWidgetState : +currentSemester Semester
_HomeWidgetState o-- Semester
_HomeWidgetState : +build() Widget
ConsumerState <|-- _HomeWidgetState

class NotificationWidget
NotificationWidget : +createState() State<NotificationWidget>
StatefulWidget <|-- NotificationWidget

class _NotificationWidgetState
_NotificationWidgetState : +assignments List~Assignment~
_NotificationWidgetState : -_sortingOption String
_NotificationWidgetState : +build() Widget
_NotificationWidgetState : -_showAssignmentDetails() void
State <|-- _NotificationWidgetState

class ProfileWidget
ProfileWidget : -_handleOptionSelected() void
ProfileWidget : +build() Widget
ConsumerWidget <|-- ProfileWidget

```
