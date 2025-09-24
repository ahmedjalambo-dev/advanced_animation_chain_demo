# Sequential Dot Loader Animation in Flutter

This Flutter project is a demonstration of an advanced animation chain. It was created as a solution for a challenge to build a loading indicator with three dots that animate sequentially, changing in both scale and opacity to create a smooth, continuous, and wave-like effect.

## Demo

*(This animation demonstrates the continuous, looping animation of the three dots, which scale and fade in an overlapping sequence.)*

-----

## 📱 Animation Preview

This preview shows the final loading animation in action.

-----

## ✨ Challenge Requirements Met

This project successfully fulfills all the requirements of the advanced animation challenge.

  * ✅ **`AnimationController`**: Manages the overall animation timeline and is properly disposed of using the `dispose` method to prevent memory leaks.
  * ✅ **Sequential Animation**: Uses `Interval` to define overlapping animation periods for each dot, creating a smooth, sequential flow instead of a simultaneous one.
  * ✅ **Scale & Opacity**: Each dot has two separate `Tween` animations—one for scaling its size and one for fading its opacity—creating a more dynamic effect.
  * ✅ **Continuous Loop**: The animation runs in a continuous forward-and-reverse loop using `controller.repeat(reverse: true)`.
  * ✅ **Smooth Curves**: Employs `Curves.easeInOut` and `Curves.easeIn` to ensure the animations are visually appealing and not linear.

-----

## 🛠️ Implementation Highlights

The animation is built using a combination of Flutter's core animation classes to achieve the desired effect efficiently.

  * **`AnimationController`**: A single controller acts as the master driver for the entire animation. It's configured with a duration and managed by a `StatefulWidget`.
  * **`SingleTickerProviderStateMixin`**: This mixin provides the essential `Ticker` that allows the `AnimationController` to schedule frames and run smoothly.
  * **`Tween` with `Interval`**: This is the core of the sequential effect. Each dot's scale and opacity animations are driven by a `Tween` which is wrapped in a `CurvedAnimation` that specifies an `Interval`. The overlapping intervals (`0.0-0.5`, `0.2-0.7`, `0.4-0.9`) create the wave-like motion.
  * **`AnimatedBuilder`**: For performance, this widget listens to the `AnimationController` and rebuilds *only* the dots on each tick. This prevents the entire screen from rebuilding, ensuring the animation is fluid and efficient.

-----

## 📂 Project Structure

For this focused demonstration, the project structure is kept simple and clean.

```
lib/
├── sequential_dot_loader.dart # The main StatefulWidget containing all animation logic.
└── main.dart                  # The entry point of the application.
```

-----

## 🚀 Getting Started

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/ahmedjalambo-dev/advanced_animation_chain_demo
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd advanced_animation_chain_demo
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the app:**
    ```sh
    flutter run
    ```