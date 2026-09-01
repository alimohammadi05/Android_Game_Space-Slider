# Space Slider

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

You can download the ready-to-play version of the game directly without needing the game engine:

1. Head over to the [Releases](../../releases) page of this repository.
2. Download the latest compiled version for your platform (Android / Desktop).
3. Extract the archive (if necessary) and launch the game to enjoy!

## Skills & Technologies Used

* **Game Engine:** Godot Engine (GDScript) for game loop architecture, scene management, and node-based UI design.
* **UI/UX & Layout Management:** Configuring Control nodes, Anchor presets, and dynamic script-based positioning (`get_viewport_rect().size`) to support responsive layouts across different screen sizes.
* **Open-Source Compliance:** Implementing proper legal notice requirements, copyright preservation, and UI attribution under the GNU AGPLv3 license framework.
* **Version Control:** Git and GitHub for source code management, tracking modifications, and publishing derivative works.# Android_Game_Space-Slider
