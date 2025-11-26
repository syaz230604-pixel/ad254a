import 'package:flutter/material.dart';

class PizzaMenuPage extends StatefulWidget {
  const PizzaMenuPage({super.key});

  @override
  State<PizzaMenuPage> createState() => _PizzaMenuPageState();
}

class _PizzaMenuPageState extends State<PizzaMenuPage> {

  final List<Map<String, String>> pizzas = [
    {
      'name':'Margherita',
      'descripation':'Classic cheese and tomato base',
      'price':'RM15.00',
      'image':'https://static.vecteezy.com/system/resources/previews/026/850/474/non_2x/margherita-pizza-transparent-png.png'
    },
    {
      'name':'Pepperoni',
      'descripation':'Loaded with spicy pepperoni slices',
      'price':'RM20.00',
      'image':'https://static.vecteezy.com/system/resources/previews/036/497/986/non_2x/ai-generated-delicious-pepperoni-pizza-on-transparent-background-free-png.png'},
    {
      'name':'Veggie Delight',
      'descripation':'Topped with fresh vegetables',
      'price':'RM18.00',
      'image':'https://static.vecteezy.com/system/resources/previews/046/861/103/non_2x/delicious-veggie-pizza-isolated-on-a-transparent-background-free-png.png'
    },
    {
      'name':'BBQ Chicken',
      'descripation':'Tangy BBQ sauce with chicken',
      'price':'RM22.00',
      'image':'https://static.vecteezy.com/system/resources/previews/036/497/987/non_2x/ai-generated-savoring-the-flavorful-layers-of-bbq-chicken-pizza-on-transparent-background-free-png.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.redAccent,
      title: Text(
          'LePizza',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,

    ) ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text('🍕Explore Our Tasty Selections - Pick Your Perfect Slice !🔥'),
              SizedBox(height: 30,),
              Expanded(
                  child: ListView.builder(
                    itemCount: pizzas.length,
                      itemBuilder: ( context, index) {
                      final pizza = pizzas[index];

                      return Card(
                        color: Color(0xFFFCD8D8),
                        child: ListTile(
                          leading: Image.network(
                            pizza['image']!,
                            fit: BoxFit.cover,
                          ),
                          title: Text('${pizza['name']} Pizza'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(pizza['descripation']!),
                              SizedBox(height: 5,),
                              Text(pizza['price']!, style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 18),),
                            ],
                          ),
                          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right)),
                        ),
                      );
                      }
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
