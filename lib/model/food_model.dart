class Food {
  String name;
  String description;
  double price;
  String image;
  FoodTypes foodType;
  Food({this.name, this.description, this.price, this.image,  this.foodType});
}

 



enum FoodTypes {
  ALL,
  APPETIZER,
  SOUPS,
  MAIN_MENU,
  FRIED_CHICKEN,
  HAMBURGERS,
  DESSERTS,
  DAILY_MENU,
  DRINKS,
  BEERS,
  WINE,
  COFFEE
}

List<Food> foods = [
  Food(
    name: 'Meat/Vegetarian Empanadas',
    description: 'Empanadas with meat, onion, paprika and potato patty. Accompanied with sweet and sour sauce',
    price: 15,
    image: 'https://1.bp.blogspot.com/-XOlF5Vk3IKw/Xm7QNrOBMhI/AAAAAAAAO10/g4bX8qYctNE_S7hImPCcoCV7sN2iRE9GQCNcBGAsYHQ/s1600/Empanadas.jpg',
    foodType: FoodTypes.APPETIZER,
  ),
  Food(
    name: 'Stuffed potato',
    description: 'Potato stuffed with ground meat, onion, paprika, egg and curry',
    price: 12.49,
    image: 'https://1.bp.blogspot.com/-uO9oUhRTNig/Xm7QNnlicJI/AAAAAAAAO14/r1CzEph1iQQPXzHubHyFSy8M_Mn3Lzp0gCNcBGAsYHQ/s1600/Papa%2B%2BRellena%2B-%2BStuffed%2BPotato.jpg',
    foodType: FoodTypes.APPETIZER,
  ),
  Food(
    name: 'Chicken soup',
    description: 'Chicken, onion, potatoes, carrots and fresh coriander',
    price: 9.99,
    image: 'https://1.bp.blogspot.com/-dxHjTjk2s4c/Xm2Aj0p5leI/AAAAAAAAOro/nUtQhYvfdysEqmmZDgv3I4zkkgA9XSJCACNcBGAsYHQ/s1600/Sopa%2Bde%2BPollo%2B-%2BChicken%2BSoup.jpg',
    foodType: FoodTypes.SOUPS,
  ),
  Food(
    name: 'Bean Soup',
    description: 'Red beans with tomato, black pepper, potato and coriander',
    price: 7.49,
    image: 'https://1.bp.blogspot.com/-tT9VEYvuPhE/Xm2Ar61cnfI/AAAAAAAAOrw/zi8gATCwbCswKrpIFPTzfw88MOIkF31bACNcBGAsYHQ/s1600/Sopa%2Bde%2BFrijol%2B-%2BBeans%2BSoup.jpg',
    foodType: FoodTypes.WINE,
  ),
];
