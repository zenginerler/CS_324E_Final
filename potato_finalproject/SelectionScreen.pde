class SelectionScreen {
  ArrayList<Card> cards;
  ArrayList<Pokemon> pokemons;
  
  PImage background_img;
  PImage pokemon_image;
  
  Button randomPick;
  
  //Constructor
  SelectionScreen() {
    this.background_img = loadImage("retro2.jpg"); //background_poke.jpg
    this.cards = new ArrayList<Card>();
    this.pokemons = new ArrayList<Pokemon>();
    
    //initialize Cards and Pokemons using the data that is extracted from a excel file
    int counter = 0;
    for (TableRow row : excel.rows()) {
      String name = row.getString("name");
      String type1 = row.getString("type1");
      String type2 = row.getString("type2");
      int hp = row.getInt("hp");
      int attack = row.getInt("attack");
      int defense = row.getInt("defense");
      int speed = row.getInt("speed");
      println(name, "->", type1, "->", type2, "->", hp, "->", attack, "->", defense, "->", speed);
      
      String image_id = name + ".png";
      pokemon_image = loadImage(image_id);
      pokemon_image.resize(0, 100);
      
      
      int x = counter % 3;
      int y = counter / 3;
      this.cards.add(new Card(250 + (150 * x), 125 + (y * 150), 100, 100, name, pokemon_image));
      this.pokemons.add(new Pokemon(width/2, height/2, name, type1, type2, hp, attack, defense, speed, pokemon_image));
      counter++;
    }
    randomPick = new Button(100, height-100, 130, 50, "Random Pick");
    
    p1_pokemon = pokemons.get(0);
    p2_pokemon = pokemons.get(1);
    
  }

  void display() {
    image(background_img, 0,0);
    for (Card a_card : cards) {
      a_card.display();
    }
    randomPick.display();
  }
}
