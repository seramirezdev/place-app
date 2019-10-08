import 'package:flutter/material.dart';
import 'package:places/src/core/entities/comment.dart';
import 'package:places/src/core/entities/place.dart';
import 'package:places/src/public/pages/styles/colors_app.dart';
import 'package:places/src/public/pages/styles/texts_app.dart';

class PlaceComments extends StatelessWidget {
  PlaceComments({this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text("Comentarios (${place.comments.length})",
                style: locationStyle),
            RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () => _showAlertDialog(context),
              child: Text("Comentar"),
            ),
          ],
        ),
        _showComments(),
        SizedBox(height: 10.0),
      ],
    );
  }

  void _showAlertDialog(context) {
    print("Mostrar alerta");
    showDialog(
      context: context, 
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: Colors.white,
          child: _dialogContent(),
        );
      }
    );
  }

  Widget _dialogContent() {
    return Padding(
      padding: EdgeInsets.all(20.0),
    );
  }

  Widget _showComments() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: place.comments.length,
      itemBuilder: (_, index) {
        final comment = place.comments[index];
        return _itemComment(comment);
      },
    );
  }

  Widget _itemComment(Comment comment) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(comment.user.name, style: userComment),
                  Spacer(),
                  Icon(Icons.star, color: itemStartRatingColor),
                  SizedBox(width: 5),
                  Text(place?.rating.toString()),
                ],
              ),
              SizedBox(height: 5),
              Text(comment.comment)
            ],
          ),
        ),
      ),
    );
  }
}
