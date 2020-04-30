import 'package:flutter/material.dart';
import 'package:hello_world/model/movie.dart';

class Movies extends StatelessWidget {
  List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            color: Colors.white,
            elevation: 3.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(image: NetworkImage(movieList[index].images[0]), fit: BoxFit.cover),
                  ),
                  child: null,),
              ),
              title: Text(movieList[index].title),
              subtitle: Text(movieList[index].genre),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => MovieDetail(movie: movieList[index],),
                )),
            ),
          );
        }
        ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  final Movie movie;

  const MovieDetail({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Back To List"),
            onPressed: () => Navigator.pop(context),
            ),
        ),
        ),
    );
  }
}