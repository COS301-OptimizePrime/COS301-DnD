class Race
{

  final String name;
  final String desc;
  final List<String> traits;
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  final String image;

  const Race({
    this.name,
    this.desc,
    this.traits,
    this.strength = 0,
    this.dexterity = 0,
    this.constitution = 0,
    this.intelligence = 0,
    this.wisdom = 0,
    this.charisma = 0,
    this.image,
  });

  getImage()
  {
    if(this.image==null)
      return name;
    else return image;
  }

  getTraits() {
    String out = "";

    if(traits.length>0)
      out += traits.elementAt(0);

    for(int i = 1; i < traits.length;i++)
      {
        out +=", "+ traits.elementAt(i);
      }

      return out;
  }

  static Race getRace(String raceName) {
    Race temp = races.firstWhere( (r) => r.name.compareTo(raceName)==0,orElse: (){return null;});

    if(temp==null)
      print('no race found for $raceName');

    return temp;
  }

//  void set(Race other) {
//    name = other.name;
//    desc = other.desc;
//    traits = other.traits;
//    strength = other.strength;
//    dexterity = other.dexterity;
//    constitution = other.constitution;
//    intelligence = other.intelligence;
//    wisdom = other.wisdom;
//    charisma = other.charisma;
//    image = other.image;
//  }
}

final List<Race> races = <Race>[
  const Race(
    name: "Aarakocra",
    desc: "Sequested in high mountains atop tall trees, the Aarakocra, sometimes called birdfolk, evoke fear and wonder.",
    dexterity: 2,
    wisdom: 1,
    traits: <String>["Flight", "Talons"]
  ),
  const Race(
    name: "Aasimar",
    desc: "Aasimar are placed in the world to serve as guardians of law and good. Their patrons expect them to strike at evil, lead by example, and further the cause of justice.",
    charisma: 2,
    traits: <String>["Darkvision","Celestial Resistance","Healing Hands","Light Bearer"]

  ),
  const Race(
    name: "Bugbear",
    desc: "Bugbears feauture on the nightmare tales of many races - great hairy beasts that creep through the shadows as quiet as cats.",
    strength: 2,
    dexterity: 1,
    traits: <String>["Darkvision","Long-Limbed","Powerful Build","Sneaky","Surprise Attack"]
  ),
  const Race(
    name: "Centaur",
    desc: "Roamers at heart, centaurs love open spaces and the freedom to travel.",
    strength: 2,
    wisdom: 1,
    traits: <String>["Charge","Hooves","Esquine Build","Survivor","Hybrid Nature"]
  ),
  const Race(
    name: "Dragonborn",
    desc: "Dragonborn look very much like dragons standing erect in humanoid form, though they lack wings or a tail.",
    strength: 2,
    charisma: 1,
    traits: <String>["Draconic Ancestry","Breath Weapon","Damage Resistance"]
  ),
  const Race(
    name: "Hill Dwarf",
    desc: "Bold and hardy, dwarves are known as skilled warriors, miners, and workers of stone and metal, As a hill dwarf, you have keen senses, deep intuition, and remarkable resilience.",
    constitution: 2,
    wisdom: 1,
    traits: <String>["Dwarven Toughness","Darkvision","Dwarven Resilience","Dwarven Combat Training","Stonecunning"],
    image: "Dwarf"
  ),
  const Race(
    name: "Mountain Dwarf",
    desc: "Bold and hardy, dwarves are known as skilled warriors, miners, and workers of stone and metal. As a mountain dwarf, you’re strong and hardy, accustomed to a difficult life in rugged terrain.",
    constitution: 2,
    wisdom: 1,
    strength: 2,
    traits: <String>["Dwarven Armor Training","Darkvision","Dwarven Resilience","Dwarven Combat Training","Stonecunning"],
    image: "Dwarf"
  ),

  ///Elves
  const Race(
    name: "High Elf",
    desc: "As a high elf, you have a keen mind and a mastery of at least the basics of magic. Elves are magical people of otherworldly grace, living in the world but not entirely part of it.",
    dexterity: 2,
    intelligence: 1,
    traits: <String>["Elf Weapon Training","Cantrip","Extra Language","Darkvision","Keen Senses","Fey Ancestry","Trance"],
    image: "Elf"
  ),
  const Race(
      name: "Wood Elf",
      desc: "As a wood elf, you have keen senses and intuition, and your fleet feet carry you quickly and stealthily through your native forests. Elves are magical people of otherworldly grace, living in the world but not entirely part of it.",
      dexterity: 2,
      wisdom: 1,
      traits: <String>["Elf Weapon Training","Fleet of Foot","Mask of the Wild","Darkvision","Keen Senses","Fey Ancestry","Trance"],
      image: "Elf"
  ),

  const Race(
    name: "Feral Tiefling",
    desc: "To be greeted with stares and whispers, to suffer violence and insult on the street, to see mistrust and fear in every eye: this is the lot of the tiefling.",
    dexterity: 2,
    intelligence: 1,
    traits: <String>["Darkvision","Hellish Resilience","Infernal Legacy"]
  ),
  const Race(
    name: "Firbolg",
    desc: "Firbolg tribes cluster in remote forest strongholds, preferring to spend their days in quiet harmony with the woods.",
    wisdom: 2,
    strength: 1,
    traits: <String>["Firbold Magic","Hidden Step","Powerful Build","Speech of Beast and Leef"]
  ),

  ///Gnomes
  const Race(
    name: "Rock Gnome",
    desc: "As a rock gnome, you have a natural inventiveness and hardiness beyond that of other gnomes. A gnome’s energy and enthusiasm for living shines through every inch of his or her tiny body.",
    intelligence: 2,
    constitution: 1,
    traits: <String>["Artificer's Lore","TInker","Darkvision","Gnome Cunning"],
    image: "Gnome"
  ),
  const Race(
      name: "Deep Gnome",
      desc: "A gnome’s energy and enthusiasm for living shines through every inch of his or her tiny body.",
      intelligence: 2,
      dexterity: 1,
      traits: <String>["Superior Darkvision","Stone Camouflage","Gnome Cunning"],
      image: "Gnome"
  ),
  const Race(
    name: "Goblin",
    desc: "Goblins occupy an uneasy place in a dangerous world, and they react by lashing out at any creatures they believe they can bully.",
    dexterity: 2,
    constitution: 1,
    traits: <String>["Darkvision","Fury of the Small","Nimble Escape"]
  ),
  const Race(
    name: "Goliath",
    desc: "Strong and reclusive, every day brings a new challenge to a goliath.",
    strength: 2,
    constitution: 1,
    traits: <String>["Natural Athlete","Stone's Endurance","Powerful Build","Mountain Born"]
  ),
  const Race(
    name: "Half-Elf",
    desc: "Half-elves combine what some say are the best qualities of their elf and human parents.",
    charisma: 2,
    traits: <String>["Darkvision","Fey Ancestry","Skill Versatility"]
  ),
  const Race(
    name: "Stout Halfling",
    desc: "As a stout halfling, you’re hardier than average and have some resistance to poison. The diminutive halflings survive in a world full of larger creatures by avoiding notice or, barring that, avoiding offense.",
    dexterity: 2,
    constitution: 1,
    traits: <String>["Stout Resilience","Lucky","Brave","Halfling Nimbleness"],
    image: "Halfling"
  ),
  const Race(
      name: "Lightfoot Halfling",
      desc: "As a lightfoot halfling, you can easily hide from notice, even using other people as cover. You’re inclined to be affable and get along well with others. The diminutive halflings survive in a world full of larger creatures by avoiding notice or, barring that, avoiding offense.",
      dexterity: 2,
      charisma: 1,
      traits: <String>["Naturally Stealthy","Lucky","Brave","Halfling Nimbleness"],
      image: "Halfling"
  ),
  const Race(
    name: "Half-Orc",
    desc: "Half-orcs’ grayish pigmentation, sloping foreheads, jutting jaws, prominent teeth, and towering builds make their orcish heritage plain for all to see.",
    strength: 2,
    constitution: 1,
    traits: <String>["Darkvision","Menacing","Relentless Endurance","Savage Attacks"]
  ),
  const Race(
    name: "Hobgoblin",
    desc: "War is the lifeblood of hobgoblins. Its glories are the dreams that inspire them. Its horrors don’t feature in their nightmares.",
    constitution: 2,
    intelligence: 1,
    traits: <String>["Darkvision","Martial Training","Saving Face"]
  ),
  const Race(
    name: "Human",
    desc: "Humans are the most adaptable and ambitious people among the common races. Whatever drives them, humans are the innovators, the achievers, and the pioneers of the worlds.",
    traits: <String>["Extra Language"]
  ),
  const Race(
    name: "Kenku",
    desc: "Haunted by an ancient crime that robbed them of their wings, the kenku wander the world as vagabonds and burglars who live at the edge of human society.",
    dexterity: 2,
    wisdom: 1,
    traits: <String>["Expert Forgery","Kenku Training","Mimicry"]
  ),
  const Race(
    name: "Kobold",
    desc: "Kobolds are typically timid and shy away from conflict, but they are dangerous and vicious if cornered.",
    dexterity: 2,
    strength: -2,
    traits: <String>["Darkvision","Grovel","Cower","Beg","Pack Tactics","Sunlight Sensitivity"]
  ),
  const Race(
    name: "Lizardfolk",
    desc: "Lizardfolk possess an alien and inscrutable mindset, their desires and thoughts driven by a different set of basic principles than those of warm-blooded creatures.",
    constitution: 2,
    wisdom: 1,
    traits: <String>["Bite","Cunning Artisan","Hold Breath","Hunter's Lore","Natural Armor","Hungry Jaws"]
  ),
  const Race(
    name: "Minotaur",
    desc: "Many minotaurs embrace the notion that the weak should perish and that the strong must rule.",
    strength: 2,
    constitution: 1,
    traits: <String>["Horns","Goring Rush","Hammering Horns","Menacing","Hybrid Nature"]
  ),
  const Race(
    name: "Orc",
    desc: "Orcs live a life that has no place for weakness, and every warrior must be strong enough to take what is needed by force.",
    strength: 2,
    constitution: 1,
    intelligence: -2,
    traits: <String>["Darkvision","Aggressive","Menacing","Powerful Build"]
  ),
  const Race(
    name: "Tabaxi",
    desc: "Hailing from a strange and distant land, wandering tabaxi are catlike humanoids driven by curiosity to collect interesting artifacts, gather tales and stories, and lay eyes on all the world’s wonders.",
    dexterity: 2,
    charisma: 1,
    traits: <String>["Darkvision","Feline Agility","Cat's Claws","Cat's Talent"]
  ),
  const Race(
    name: "Tiefling",
    desc: "To be greeted with stares and whispers, to suffer violence and insult on the street, to see mistrust and fear in every eye: this is the lot of the tiefling.",
    charisma: 2,
    intelligence: 1,
    traits: <String>["Darkvision","Hellish Resistance","Infernal Legacy"]
  ),
  const Race(
    name: "Tortle",
    desc: "What many tortles consider a simple life, others might call a life of adventure. They are nomad survivalists eager to explore the wilderness.",
    strength: 2,
    wisdom: 1,
    traits: <String>["Claws","Hold Breath","Natural Armor","Shell Defense","Survival Instinct"]
  ),
  const Race(
    name: "Triton",
    desc: "Long-established guardians of the deep ocean floor, in recent years the noble tritons have become increasingly active in the world above.",
    strength: 1,
    constitution: 1,
    charisma: 1,
    traits: <String>["Amphibious","Control Air and Water","Emissary of the Sea","Guardians of the Depths"]
  ),
  const Race(
    name: "Yuan-ti Pureblood",
    desc: "The serpent creatures known as yuan-ti are all that remains of an ancient, decadent human empire.",
    charisma: 2,
    intelligence: 1,
    traits: <String>["Darkvision","Innate Spellcasting","Magic Resistance","Posion Immunity"]
  ),
];

///classes

class ClassType
{
  final String name;
  final String desc;
  final int hitDie;
  final String primaryAbility;
  final String saves;

  const ClassType({
    this.name,
    this.desc,
    this.hitDie,
    this.primaryAbility,
    this.saves,
});

  static ClassType getClass(String characterClass) {
    return typeClasses.firstWhere( (tc) => tc.name.compareTo(characterClass)==0,orElse: (){return null;});
  }

//  void set(ClassType other) {
//    this.name = other.name;
//    this.desc = other.desc;
//    this.hitDie = other.hitDie;
//    this.primaryAbility = other.primaryAbility;
//    this.saves = other.saves;
//  }
}

final List<ClassType> typeClasses = <ClassType>[
  const ClassType(
    name: "Barbarian",
    desc: "A fierce warrior of primitive background who can enter a battle rage",
    hitDie: 12,
    primaryAbility: "Strength",
    saves: "Strength & Constitution"
  ),
  const ClassType(
    name: "Bard",
    desc: "An inspiring magician whose power echoes the music of creation.",
    hitDie: 8,
    primaryAbility: "Charisma",
    saves: "Dexterity & Charisma"
  ),
  const ClassType(
    name: "Cleric",
    desc: "A priestly champion who wields divine magic in service of a higher power.",
    hitDie: 8,
    primaryAbility: "Wisdom",
    saves: "Wisdom & Charisma"
  ),
  const ClassType(
    name: "Druid",
    desc: "A priest of the Old Faith, wielding the powers of nature and adopting animal forms.",
    hitDie: 8,
    primaryAbility: "Wisdom",
    saves: "Intelligence & Wisdom"
  ),
  const ClassType(
    name: "Fighter",
    desc: "A master of martial combat, skilled with a variety of weapons and armor.",
    hitDie: 10,
    primaryAbility: "Strength or Dexterity",
    saves: "Strength & Constitution"
  ),
  const ClassType(
    name: "Monk",
    desc: "A master of martial arts, harnessing the power of the body in pursuit of physical and spiritual perfection.",
    hitDie: 8,
    primaryAbility: "Dexterity & Wisdom",
    saves: "Strength & Dexterity"
  ),
  const ClassType(
    name: "Paladin",
    desc: "A holy warrior bound to a sacred oath.",
    hitDie: 10,
    primaryAbility: "Strength & Charisma",
    saves: "Wisdom & Charisma"
  ),
  const ClassType(
    name: "Ranger",
    desc: "A warrior who combats threats on the edges of civilization.",
    hitDie: 10,
    primaryAbility: "Dexterity and Wisdom",
    saves: "Strength & Dexterity"
  ),
  const ClassType(
    name: "Rogue",
    desc: "A scoundrel who uses stealth and trickery to overcome obstacles and enemies.",
    hitDie: 8,
    primaryAbility: "Dexterity",
    saves: "Dexterity & Intelligence"
  ),
  const ClassType(
    name: "Sorcerer",
    desc: "A spellcaster who draws on inherent magic from a gift or bloodline.",
    hitDie: 6,
    primaryAbility: "Charisma",
    saves: "Constitution & Charisma"
  ),
  const ClassType(
    name: "Warlock",
    desc: "A wielder of magic that is derived from a bargain with an extraplanar entity.",
    hitDie: 8,
    primaryAbility: "Charisma",
    saves: "Wisdom & Charisma"
  ),
  const ClassType (
    name: "Wizard",
    desc: "A scholarly magic-user capable of manipulating the structures of reality.",
    hitDie: 6,
    primaryAbility: "Intelligence",
    saves: "Intelligence & Wisdom"
  )
];