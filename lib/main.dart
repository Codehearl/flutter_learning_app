 import 'package:flutter/material.dart';
 import 'recipe.dart';
 import 'recipe_detail.dart';

void main() {
  
  runApp(const LearningApp());
}

class LearningApp extends StatelessWidget {
  const LearningApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe app',
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(

        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blueGrey,
          secondary: Colors.black
        )
      ),
      home: const MyHomePage(title: 'Learning app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.grey,
        child: SafeArea(
          child: ListView.builder(
            itemCount: Recipe.samples.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RecipeDetail(recipe: Recipe.samples[index]);
                      },
                    ),
                  );
                },
                child: buildRecipeCard(Recipe.samples[index]),
              );

            },
    ),
    ),
      ),
    );
  }
  Widget buildRecipeCard(Recipe recipe){
    return Card(
      elevation: 2.0,
      color: Colors.black26,
      shadowColor: Colors.blueGrey,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ) ,
      child:Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Image(image:AssetImage(recipe.imageUrl),),
          const SizedBox(
            height: 14.0,
          ),
          Text(
              recipe.label,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Colors.white70,
            fontFamily: 'Palantino',
          ),
          ),
        ],),
      ),
    );
  }
}
