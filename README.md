# kortobaa_mobile_flutter_task

An application for Kortobaa mobile flutter task

Note: the project was created with flutter sdk on ``` BETA ```  channel.

## Packages used

- `Provider` for state management.
- `Shared Preferences` for saving key value pairs locally, creating a local backend for posts, user info and favorites.
- `Image picker` for picking images for posts and profile picture. 

## Project Structue

* `assets` folder for images and fonts.

* `i18n` folder for json files holding localization values.

* `lib` folder:
    - Core folder containing `models`, `services` and `providers`.
    - UI folder containing the UI separated into `views` and `widgets` folders and a folder for `shared` values like colors and text styles.


## Screens

- Homepage with two tabs to show posts feed and user's account info.
- A dialog (Screen) for user to add new posts.
- A bottom sheet modal for editing user info.
- A settings screen to pick locale (and other settings if available).
- A favorites Page where user can view his favorited posts.

## User Stories

- The user can view posts in homepage.
- He can post a new post using the floating action button.
- When he clicks the floating action button a dialog shows where he inserts post info.
- The user can favorite and unfavorite posts by clicking on the heart icon button.
- He can navigate to account view by clicking on account tab.
- Both the navigation drawer and account view have buttons for the user to navigate to different screens.
- The user can edit his info by clicking on edit info button.
- The user can edit settins of the app (only locale for now) by navigating to settings page.
- The user can view favorited posts by navigating to favorites page.