# Space Slider

<p align="center">
  <img src="https://github.com/alimohammadi05/Android_Game_Space-Slider/blob/main/Game_icon.jpg" alt="Space Slider Game Icon" width="200"/>
</p>

A 2D space arcade game built with the Godot Engine.

## License

This project is licensed under the **GNU Affero General Public License v3.0 (AGPL-3.0)** - see the [LICENSE](LICENSE) file for details.

## Notice of Modifications

In accordance with Section 5 of the GNU AGPL v3, notice is hereby given that this work is a modified version of the original program. 

* **Original Project:** [SlideShooter by stevkazt](https://github.com/stevkazt/SlideShooter/tree/master)
* **Modified by:** Ali Mohammadi
* **Date of Modification:** September 2026
* **Summary of Changes:**
  * **Code & Gameplay:**
    * Modified core game scripts to shorten power-up spawn intervals so they appear much more frequently.
    * Integrated a brand-new extra life mechanism.
    * Updated code logic to properly trigger and display text messages upon a Game Over.
    * Increased the player's total initial lives from 3 to 5 for a smoother experience and better gameplay balance.
    * Optimized and bug-fixed the boss fight to make defeating the boss easier and ensure accurate score tracking.
    * Added an on-screen text guide ("Double Tap!") to instruct players on how to activate special powers.
    * Optimized enemy AI and refined their movement patterns to provide a more engaging challenge.
  * **Visual Assets & Overhaul:**
    * Redesigned and updated the start button icon.
    * Replaced and modernized the player's ship asset.
    * Updated all three types of enemy ship sprites for a fresh look.
    * Replaced the traditional ship-based health display with clear heart icons for player lives.
  * **Audio & Atmosphere:**
    * Added background music to enhance the immersion during gameplay.
    * Implemented custom sound effects for the Game Over sequence.
  * **UI & User Experience:**
    * Added a dedicated custom visual and screen effect for the Game Over state.
    * Added a dedicated **About/Info dialog** window to display game version, author details, and credits.
    * Implemented dynamic positioning for user interface buttons (Settings and Info buttons) to ensure proper layout scaling across various mobile and desktop screen resolutions.
    * Configured text autowrap and custom minimum size properties for UI labels to resolve layout warnings and prevent sizing loops.
    * Integrated custom audio mute toggling with persistent game settings state.

## How to Play

You can download the ready-to-play Android APK directly without needing the game engine or building from source:

1. Head over to the [Releases](../../releases) page of this repository.
2. Download the latest `.apk` file for Android.
3. Install the APK on your Android device and launch the game to play!

## Skills & Technologies Used

* **Game Engine:** Godot Engine (GDScript) for game loop architecture, scene management, and node-based UI design.
* **UI/UX & Layout Management:** Configuring Control nodes, Anchor presets, and dynamic script-based positioning (`get_viewport_rect().size`) to support responsive layouts across different screen sizes.
* **Open-Source Compliance:** Implementing proper legal notice requirements, copyright preservation, and UI attribution under the GNU AGPLv3 license framework.
<<<<<<< HEAD
* **Version Control:** Git and GitHub for source code management, tracking modifications, and publishing derivative works.
=======
* **Version Control:** Git and GitHub for source code management, tracking modifications, and publishing derivative works.
>>>>>>> 64e88e1aba16fde332e7cba75f8e7ec213b85699
