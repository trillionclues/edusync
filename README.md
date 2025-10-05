# Micro Habits MVP

A Flutter package for tracking daily micro habits with offline-first architecture using BLoC, Drift (SQLite), and Hive.

## Features

- ✅ Fully offline habit tracking
- ✅ Auto-generated random habits
- ✅ Clean architecture with BLoC state management
- ✅ Drift (SQLite) as single source of truth
- ✅ Hive for user preferences
- ✅ Today's habits view with checkbox completion
- ✅ Material Design 3 UI

## How to Run

1. **Get dependencies:**
   ```bash
   flutter pub get
   ```

2. **Generate Drift database files:**
   ```bash
   dart run build_runner build
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

The app will work completely offline - no internet connection required!

## Opening Drift Database in DevTools

1. **Enable Flutter Inspector:**
    - Run `flutter run` with `--debug` flag
    - Open Flutter DevTools in browser

2. **Access Database:**
    - The SQLite database file is located at: `[Documents]/micro_habits.sqlite`
    - On Android: `/data/data/com.example.micro_habits/app_flutter/micro_habits.sqlite`
    - On iOS: `~/Documents/micro_habits.sqlite`

3. **View with SQLite Browser:**
    - Use DB Browser for SQLite or similar tools
    - Connect to the database file path shown above

### Next Slice Checklist - Cloud Sync (Proto + gRPC + Cloud Functions)

- [ ] **Protobuf Schema:**
    - [ ] Define `habit.proto` with Habit message
    - [ ] Define `habit_service.proto` with CRUD operations
    - [ ] Generate Dart code from proto files

- [ ] **gRPC Integration:**
    - [ ] Add `grpc` and `protobuf` dependencies
    - [ ] Implement gRPC client for habit service
    - [ ] Add network connectivity checks

- [ ] **Firebase Cloud Functions:**
    - [ ] Set up Firebase project
    - [ ] Deploy Cloud Function with gRPC server
    - [ ] Implement habit CRUD operations on server
    - [ ] Add Firebase Auth for user identification

- [ ] **Sync Logic:**
    - [ ] Implement offline-first sync strategy
    - [ ] Add conflict resolution for concurrent edits
    - [ ] Handle network failures gracefully
    - [ ] Add sync status indicators in UI

- [ ] **Testing:**
    - [ ] Unit tests for gRPC client
    - [ ] Integration tests for sync flow
    - [ ] End-to-end tests with mock server

## Notes

- Uses Drift as single source of truth for habits
- Hive stores user preferences (wake-up hour)
- All data operations are fully offline
- Clean architecture with clear separation of concerns
- Passes `very_good_analysis` with zero warnings