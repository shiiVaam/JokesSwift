# JokesSwift

# JokesHub - MVP with Realm Database

JokesHub is a simple iOS app built using the Minimum Viable Product (MVP) architecture and integrated with the Realm Database. The app's main purpose is to display a list of jokes to users, providing a light-hearted and entertaining experience.

Since the app does not use Storyboard, the user interface is entirely programmatic, allowing for greater control and customization over the UI elements.

## Features

- Display a list of jokes fetched from a data source.
- Store favorite jokes using Realm Database for persistent storage.

## Technologies Used

- Minimum Viable Product (MVP) architecture
- Realm Database
- Swift programming language
- Xcode IDE

## Getting Started

Follow these steps to set up the project on your local machine:

### Prerequisites

- Xcode installed
- Cocoapods installed (`sudo gem install cocoapods`)

### Installation

1. Clone the repository: `git clone [repository URL]](https://github.com/shiiVaam/JokesSwift)`
4. Open the project in Xcode: `open JokesHub.xcodeproj`

### Usage

1. Build and run the app in Xcode.
2. The app will display a list of jokes on the main screen.
3. Tap on a joke to view its details.
4. Swipe left on a joke to mark it as a favorite.
5. Access the favorites list by tapping on the "Favorites" tab in the bottom navigation.

## MVP Architecture

JokesHub follows the MVP architecture:

- **Model**: Manages data and business logic. In this app, the models handle joke data and interaction with the Realm Database.
- **View**: Represents the UI components and their layout. The views are created programmatically in code.
- **Presenter**: Acts as an intermediary between the Model and View. It retrieves data from the Model and updates the View accordingly.

## Realm Database Integration

Realm Database is used to store favorite jokes persistently. The Realm framework provides an easy-to-use solution for managing the local database and efficiently storing and querying data.


## Acknowledgments

- The joke data used in this app is fetched from the [JokeAPI]([https://jokeapi.dev](https://geek-jokes.sameerkumar.website/api)/).
- The MVP architecture implementation is inspired by [MVP Architecture in Swift](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52).
- Realm Database integration is based on the official [Realm Documentation](https://realm.io/docs/swift/latest/).
