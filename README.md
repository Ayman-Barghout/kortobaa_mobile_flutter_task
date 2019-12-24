# kortobaa_mobile_flutter_task

An application for Kortobaa mobile flutter task

## Packages used

- Provider for state management.
- Shared Preferences for saving key value pairs locally (Locale, User info and posts).
- Image picker for picking images for posts and profile picture. 

## Project Structue

- Core folder containing models, services and providers.
- UI folder containing the UI separated into views and widgets folders and a folder for shared values like colors and text styles.

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
- He can navigate to account view by clicking on account tab.
- Both the navigation drawer and account view have buttons for the user to navigate to different screens.
- The user can edit his info by clicking on edit info button.
- The user can edit settins of the app (only locale for now) by clicking on settings button.
- The user can view favorited posts by clicking on favorites button.