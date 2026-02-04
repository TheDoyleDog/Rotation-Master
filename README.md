# Rotation Master - Automatic Rotation Addon for Turtle WoW

**Version:** 1.0.0  
**Compatible with:** Turtle WoW (WoW 1.12 Vanilla)

## Overview

Rotation Master is a comprehensive automatic rotation addon for Turtle WoW that performs optimal ability rotations for all 9 classes. The addon intelligently adapts to your character's level, available abilities, and combat situation to maximize DPS while managing resources efficiently.

## Features

✅ **All Classes Supported** - Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid  
✅ **Level-Based Optimization** - Only uses abilities available at your current level  
✅ **Smart Resource Management** - Manages mana, rage, energy, and combo points  
✅ **Configurable Settings** - Class-specific options for customization  
✅ **Easy Toggle** - Simple commands to enable/disable rotations  
✅ **Status Display** - On-screen indicator showing rotation state  

## Installation

1. Download or clone this addon
2. Copy the `RotationMaster` folder to your `TurtleWoW/Interface/AddOns/` directory
3. Restart World of Warcraft or reload UI with `/reload`
4. The addon will automatically load and display a welcome message

## Usage

### Basic Commands

- `/rm` or `/rm config` - Open configuration panel
- `/rm toggle` or `/rm t` - Toggle rotation on/off
- `/rm enable` or `/rm on` - Enable rotation
- `/rm disable` or `/rm off` - Disable rotation
- `/rm status` - Show current status

### Quick Start

1. Log in to your character
2. Type `/rm enable` to activate rotations
3. Enter combat - the addon will automatically execute your rotation
4. Type `/rm disable` to deactivate when needed

### Status Display

A small status window appears at the top of your screen showing:
- **Disabled** (Red) - Rotation is off
- **Ready** (Yellow) - Rotation is on, waiting for combat
- **Active** (Green) - Rotation is running in combat

You can drag this window to reposition it.

## Class-Specific Features

### Warrior
- Execute phase optimization (below 20% health)
- Mortal Strike / Bloodthirst support (talents)
- Battle Shout maintenance
- Rend DoT management
- Rage-based Heroic Strike

### Paladin
- Seal management (Righteousness, Command, Crusader)
- Blessing maintenance
- Judgement usage
- Hammer of Wrath execute

### Hunter
- Aspect maintenance
- Serpent Sting DoT
- Aimed Shot (talent)
- Multi-Shot and Arcane Shot

### Rogue
- Combo point building
- 5-point finisher optimization
- Slice and Dice maintenance
- Rupture DoT management
- Hemorrhage support (talent)

### Priest
- Shadow Word: Pain DoT
- Mind Flay channeling
- Mind Blast on cooldown
- Vampiric Embrace (talent)
- Shadowform support
- Wand usage when OOM

### Shaman
- Shock rotation (Flame, Earth, Frost)
- Stormstrike (talent)
- Lightning Bolt filler
- Configurable shock priority

### Mage
- School-specific rotations (Frost, Fire, Arcane)
- Scorch stacking (Fire)
- Wand usage when OOM
- Mana efficiency

### Warlock
- Multi-DoT management (Corruption, Agony, Immolate)
- Curse application
- Siphon Life (talent)
- Life Tap automation
- Shadow Bolt filler

### Druid
- Form-specific rotations (Cat, Bear, Balance)
- Combo point management (Cat)
- Rip and Rake DoTs
- Moonfire maintenance (Balance)
- Maul and Swipe (Bear)

## Configuration

The addon includes class-specific settings that can be customized:

- **Update Interval** - How often rotation checks (default: 100ms)
- **Auto Face Target** - Automatically face your target
- **Wait for Cast** - Don't queue abilities while casting
- **Class-Specific Options** - Each class has unique settings

Access configuration via `/rm config` or the configuration panel.

## Performance

The addon is optimized for minimal performance impact:
- Throttled updates (10 checks per second maximum)
- Efficient condition checking
- No rotation execution outside of combat
- Cached spell data

## Troubleshooting

**Addon not loading?**
- Ensure the folder is named exactly `RotationMaster`
- Check that the `.toc` file exists
- Verify you're in the correct AddOns directory

**Rotation not working?**
- Make sure rotation is enabled (`/rm enable`)
- Check that you're in combat
- Verify you have a valid target
- Ensure you have learned the required spells

**Performance issues?**
- Try increasing the update interval in settings
- Disable other addons to test for conflicts

## Known Limitations

- Talent detection is basic (checks spellbook)
- Some advanced rotation optimizations may not be included
- PvP-specific rotations not implemented
- Totem management for Shamans is manual

## Support

For issues, suggestions, or contributions, please contact the addon author.

## Version History

**1.0.0** - Initial Release
- All 9 classes supported
- Level-based ability tracking
- Configuration UI
- Status display
- Basic rotation optimization

## Credits

Created for the Turtle WoW community.

## License

Free to use and modify for personal use.
