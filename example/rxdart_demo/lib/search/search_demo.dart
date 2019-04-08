import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'recipeWeb.dart';

class SearchDemo extends StatefulWidget {
  static String tag = 'recipie-page';

  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  List<Recipe> _items = new List();

  final subject = new PublishSubject<String>();

  bool _isLoading = false;

  TextEditingController controller = new TextEditingController(text: '');

  void _textChange(String text) async {
    if (text.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      _clearList();
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _clearList();

    print('text: $text');

    String url = 'http://www.recipepuppy.com/api/?q=$text';
    HttpClient httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(Utf8Decoder()).join();
        print('json: $json');
        var data = jsonDecode(json);
        print('data: $data');
        List results = data['results'];
        print('results: $results');
        setState(() {
          _isLoading = false;
          results.forEach(_addItem);
        });
      }
    } catch (e) {
      print('e: $e');
    }
  }

  void _onError(dynamic d) {
    print('error: $d');
    setState(() {
      _isLoading = false;
    });
  }

  void _clearList() {
    setState(() {
      _items.clear();
    });
  }

  void _addItem(item) {
    setState(() {
      _items.add(Recipe.fromJson(item));
    });
  }

  @override
  void initState() {
    super.initState();

    subject.stream
        .debounce(new Duration(milliseconds: 600))
        .listen(_textChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(600.0),
        child: const Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            top: 16.0, right: 8.0, bottom: 8.0, left: 8.0),
        child: Column(
          children: <Widget>[
            _createSearchBar(context),
            Expanded(
              child: Card(
                child: _isLoading
                    ? Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: _items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _createRecipeItem(context, _items[index]);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSearchBar(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => clearData(),
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16.0),
                hintText: '搜索',
              ),
              onChanged: (string) => (subject.add(string)),
            ),
          ),
        ],
      ),
    );
  }

  clearData() {
    subject.add('');
    controller.clear();
  }

  Widget _createRecipeItem(BuildContext context, Recipe recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RecipeWeb(url: recipe.href, item: recipe.title)));
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Image.network(
                  recipe.thumbnail,
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.fitHeight,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 80.0,
                    child: _createRecipeItemDescriptionSection(context, recipe),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createRecipeItemDescriptionSection(
      BuildContext context, Recipe recipe) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          recipe.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          recipe.ingredients,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }
}

class Recipe {
  String title, thumbnail, href, ingredients;
  Recipe({
    this.title,
    this.href,
    this.ingredients,
    this.thumbnail,
  });

  Recipe.fromJson(dynamic recipe) {
    try {
      this.title = recipe['title'];
      this.href = recipe['href'];
      this.ingredients = recipe['ingredients'];
      this.thumbnail = (recipe['thumbnail']);
      if (recipe['thumbnail'].toString().length == 0) {
        this.thumbnail =
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/No_image_available_600_x_450.svg/600px-No_image_available_600_x_450.svg.png';
      }
    } catch (e) {
      print("something happened" + e.toString());
    }
  }
}
