# StreamFlix – tvOS Catalog

A tvOS streaming catalog application built using SwiftUI, Swift Concurrency, MVVM, and Clean Architecture.

## Overview

StreamFlix is a single-screen tvOS application that presents a media catalog organized into horizontal content carousels.

Users can navigate the catalog using the tvOS Remote, select a media item to view its details, and launch a simulated video player.

The application focuses on native tvOS interaction patterns, especially the Focus Engine and 10-foot UI experience.

## Features

- Horizontal media carousels organized by category
- Native tvOS focus navigation
- Visual focus feedback with card scaling and border/glow
- Focus restoration when returning from the detail screen
- Media detail screen
- Simulated video player
- Asynchronous catalog loading using Swift Concurrency
- Loading state
- Error state with a focusable Retry button
- Local JSON mock data
- Async image loading
- MVVM + Clean Architecture
- Repository pattern
- Dependency Injection
- DTO to Domain model mapping

## Tech Stack

- Swift
- SwiftUI
- tvOS
- Swift Concurrency (`async/await`)
- MVVM
- Clean Architecture
- Repository Pattern
- Dependency Injection
- Local JSON data source
- AsyncImage

## Architecture

The project follows a lightweight Clean Architecture approach combined with MVVM.

```
Presentation
     │
     ▼
ViewModel
     │
     ▼
Use Case
     │
     ▼
Repository Protocol
     │
     ▼
Repository Implementation
     │
     ▼
Data Service
     │
     ▼
JSON
```

## Project Structure

```
StreamFlix
│
├── App
│   └── StreamFlixApp.swift
│
├── Domain
│   ├── Models
│   │   └── CatalogModels.swift
│   │
│   ├── Repositories
│   │   └── CatalogRepository.swift
│   │
│   └── UseCases
│       └── FetchCatalogUseCase.swift
│
├── Data
│   ├── DTOs
│   │   └── CatalogDTO.swift
│   │
│   ├── Services
│   │   └── CatalogAPIService.swift
│   │
│   └── Repositories
│       └── CatalogRepositoryImpl.swift
│
└── Presentation
    ├── ViewModels
    │   └── CatalogViewModel.swift
    │
    ├── Views
    │   ├── CatalogView.swift
    │   ├── CategoryRow.swift
    │   ├── MediaCard.swift
    │   ├── DetailView.swift
    │   └── PlayerView.swift
    │
    └── Components
        ├── LoadingView.swift
        └── ErrorView.swift
```

## Data Flow

The catalog data flows through the application as follows:

```
catalog.json
     │
     ▼
CatalogAPIService
     │
     ▼
CatalogRepositoryImpl
     │
     ▼
FetchCatalogUseCase
     │
     ▼
CatalogViewModel
     │
     ▼
SwiftUI Views
```

The JSON response is decoded into DTOs and mapped into domain models before reaching the presentation layer.

This keeps the UI independent of the underlying data source.

## tvOS Focus Experience

The application is designed specifically for the tvOS 10-foot UI experience.

Media cards are implemented as focusable buttons and provide visual feedback when focused.

Focused cards:
- Scale up slightly
- Display a visible focus border
- Display a subtle glow/shadow
- Animate smoothly during focus changes

The horizontal shelves use LazyHStack inside horizontal ScrollViews.

The scroll views allow focused cards to extend beyond their normal bounds so the focus effect is not clipped.

## Navigation

The application follows this navigation flow:
```
Catalog
   │
   │ Select Media
   ▼
Detail
   │
   │ Play
   ▼
Simulated Player
```

Native tvOS navigation behavior is used to provide a familiar remote-driven experience.

## Loading & Error Handling
The catalog loading process is asynchronous and exposes three primary UI states:

```
Loading
   │
   ├── Success ──► Catalog
   │
   └── Failure ──► Error + Retry
```

The Retry action is implemented as a focusable tvOS button so it can be accessed using the remote.

## Mock Data
The application uses the mock catalog JSON.

The data source is abstracted behind a service protocol so it can easily be replaced with a real REST API in a production environment.

## Dependency Injection
Dependencies are created at the application composition level and injected into the ViewModel.

```
LocalCatalogAPIService
          │
          ▼
CatalogRepositoryImpl
          │
          ▼
FetchCatalogUseCaseImpl
          │
          ▼
CatalogViewModel
```

This keeps components loosely coupled and makes the ViewModel easier to test.

## Requirements
- Xcode
- Swift
- tvOS Simulator
- macOS

## Running the Project
- Clone the repository.
- Open the Xcode project:
- StreamFlix.xcodeproj
- Select a tvOS Simulator.
- Build and run the application.

No external backend setup is required because the project uses the provided local mock JSON data.

## Future Improvements
If this application were extended into a production streaming platform, the following could be added:

- Real REST API integration
- Image caching
- Video playback using AVPlayer
- Persistent Continue Watching state
- Search
- Authentication
- Content pagination
- Network reachability handling
- Unit and UI tests
- Accessibility improvements
- Analytics and crash monitoring


## Author
- Fayith Ahamed
- iOS Developer
