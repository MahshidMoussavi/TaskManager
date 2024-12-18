# Task Manager App

## Overview
The **Task Manager App** is a SwiftUI-based application designed to help users manage their daily tasks efficiently. With features like a to-do list, done list, and the ability to create custom tasks, this app ensures an intuitive and user-friendly task management experience.

## Features

### 1. **Home View**
- A full-month calendar to visualize task dates.
- A searchable to-do list that filters tasks based on user input.
- A "mark as done" feature to move tasks to the done list.
- A button to add new tasks via a modal view.

### 2. **Done View**
- Displays tasks marked as completed.
- Swipe-to-action functionality to move tasks back to the to-do list.

### 3. **Create Task View**
- Allows users to create new tasks by specifying:
  - Task name
  - Category
  - Due date
- Tasks are saved to the to-do list.

## Technical Details

### Technologies Used
- **SwiftUI**: To build a declarative and modern user interface.
- **Xcode**: Development environment for creating and testing the app.

### Architecture
The app follows a modular structure with the following components:

1. **Model**: `Task.swift` defines the `Task` structure, which includes:
   - `id`: A unique identifier for each task.
   - `date`: The task's due date.
   - `title`: The task name.
   - `category`: The task category.

2. **Views**:
   - `HomeView`: Displays the calendar, searchable to-do list, and task creation modal.
   - `DoneView`: Displays completed tasks with an option to move them back to the to-do list.
   - `CreateTaskView`: Form for adding new tasks.
   - `TaskView`: A reusable component for displaying individual tasks.

3. **Entry Point**: `ContentView` manages the `TabView` with Home and Done tabs.

### Customizations
- **Custom Fonts**: The app uses the `AvenirNext-DemiBold` font.
- **Custom Colors**: A unique color scheme is applied to buttons and labels using specific RGB values.

## How to Run

1. Clone this repository:
   ```bash
   git clone <repository-url>
   ```

2. Open the project in Xcode:
   ```bash
   cd TaskManagerApp
   open TaskManagerApp.xcodeproj
   ```

3. Build and run the app on the simulator or a connected device.

## Future Enhancements
- Add task notifications to remind users of upcoming deadlines.
- Include categories to filter tasks more effectively.
- Support for syncing tasks across devices via iCloud.

## Screenshots
_Include screenshots of the app's main views here once available._

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

---

**Author**: Mahshid

Happy task managing!
