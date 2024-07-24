
# CPS Soft Application

## Overview
CPS Soft is a Flutter-based application designed to manage users. This application implements various features such as fetching user data from an API, adding new users, and filtering users. The architecture follows the principles of Clean Architecture and uses the Bloc pattern for state management.

## Features
- **User Management**: Fetch and display user data from an API.
- **Add User**: Add new users with form validation.
- **Filter Users**: Filter users by name and city.
- **Sort Users**: Sort users alphabetically.

## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK

### Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-repository/cps_soft.git
   cd cps_soft
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   ```bash
   flutter run
   ```

## Usage

### Fetch Users
The application fetches user data from an API and displays it in a list format. The user data is fetched using the `fetchUsers` method in the `UserService` class and managed by the `UserBloc`.

### Add User
Users can be added through the `AddUserScreen` where a form is provided for user details. The `AddUserBloc` manages the state for adding a user, ensuring form validation and handling API responses.

### Filter and Sort Users
Users can be filtered by name and city using the search functionality and sorted alphabetically. The filtering and sorting are managed by the `UserBloc`.

## Architecture
This application follows Clean Architecture principles:
- **Data Layer**: Contains data models and repositories.
- **Domain Layer**: Contains entities and use cases.
- **Presentation Layer**: Contains UI and BLoCs for state management.

## Dependencies
```yaml
name: cps_soft
description: A new Flutter project.
publish_to: 'none'
version: 0.1.0

environment:
  sdk: '>=3.1.5 <4.0.0'

dependencies:
  equatable: ^2.0.5
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  flutter_dotenv: ^5.1.0
  get: ^4.6.6
  get_it: ^7.7.0
  google_fonts: ^6.2.1
  http: ^1.2.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
  assets:
    - .env
```

## Contributing
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature-name`).
5. Open a Pull Request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
