import 'package:flutter/material.dart';
import 'package:hello_world/model/movie.dart';

class Movies extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade700,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Stack(
                children: <Widget>[
                  movieCard(movieList[index], context),
                  Positioned(
                    top: 30,
                    child: movieImage(movieList[index].images[0]),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return Container(
      height: 135,
      margin: EdgeInsets.only(left: 30.0, right: 2.0),
      child: InkWell(
        child: Card(
          color: Colors.blueGrey.shade900,
          elevation: 3.0,
          child: Padding(
            padding: EdgeInsets.only(
                left: 54.0, right: 25.0, top: 30.0, bottom: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(movie.title,
                            style: customTextStyle(17.0, Colors.white,
                                weight: FontWeight.w500)),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating} / 10",
                        style: customTextStyle(13.0, Colors.orange),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      movie.released,
                      style: customTextStyle(14.0, Colors.grey,
                          weight: FontWeight.w400),
                    ),
                    Text(
                      movie.runtime,
                      style: customTextStyle(14.0, Colors.grey,
                          weight: FontWeight.w400),
                    ),
                    Text(
                      movie.country,
                      style: customTextStyle(14.0, Colors.grey,
                          weight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => MovieDetail(movie: movie))),
      ),
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0,
              spreadRadius: 2.0,
              color: Colors.blueGrey.shade900),
        ],
        image: DecorationImage(
          image: NetworkImage(imageUrl ??
              "https://bitsofco.de/content/images/2018/12/broken-1.png"),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  TextStyle customTextStyle(double size, Color color,
      {FontWeight weight = FontWeight.normal}) {
    return TextStyle(fontSize: size, color: color, fontWeight: weight);
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
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailThumbnail(
            thumbnailUrl: movie.images[0],
          ),
          MovieDetailHeadersWithPoster(movie: movie),
          MovieDetailFields(movie: movie),
          MovieMorePosters(posters: movie.images),
        ],
      ),
    );
  }
}

class MovieDetailThumbnail extends StatelessWidget {
  final String thumbnailUrl;

  const MovieDetailThumbnail({Key key, this.thumbnailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(thumbnailUrl), fit: BoxFit.cover),
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 70,
              color: Colors.white,
            ),
          ],
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00f5f5f5),
                Color(0xfff5f5f5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        )
      ],
    );
  }
}

class MovieDetailHeadersWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailHeadersWithPoster({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MoviePoster(posterUrl: movie.images[0]),
          SizedBox(
            width: 16,
          ),
          MovieHeader(movie: movie),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String posterUrl;

  const MoviePoster({Key key, this.posterUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(posterUrl),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class MovieHeader extends StatelessWidget {
  final Movie movie;

  const MovieHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("(${movie.year}) - ${movie.genre}",
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
              )),
          Text(movie.title,
              style: TextStyle(
                color: Colors.blueGrey.shade900,
                fontSize: 32.0,
                fontWeight: FontWeight.w700,
              )),
          SizedBox(
            height: 8.0,
          ),
          Text.rich(TextSpan(
            style: TextStyle(fontSize: 14.0),
            children: <TextSpan>[
              TextSpan(
                text: movie.plot,
              ),
              TextSpan(
                text: " more ...",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class MovieDetailFields extends StatelessWidget {
  final Movie movie;

  const MovieDetailFields({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(fieldName: "Director", fieldValue: movie.director),
          MovieField(fieldName: "Writer", fieldValue: movie.writer),
          MovieField(fieldName: "Actors", fieldValue: movie.actors),
          MovieField(fieldName: "Language", fieldValue: movie.language),
          MovieField(fieldName: "Awards", fieldValue: movie.awards),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const MovieField({Key key, this.fieldName, this.fieldValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 100,
              child: Text(
                fieldName,
                style: TextStyle(
                  color: Colors.blueGrey.shade700,
                ),
              ),
            ),
            Expanded(
                child: Text(fieldValue,
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontWeight: FontWeight.w500,
                    ))),
          ],
        ),
        HorizontalLine(),
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 0.5,
      color: Colors.grey.shade300,
    );
  }
}

class MovieMorePosters extends StatelessWidget {
  final List<String> posters;

  const MovieMorePosters({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Other Posters",
            style: TextStyle(
              color: Colors.blueGrey.shade900,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8.0),
              itemCount: posters.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(posters[index]),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
