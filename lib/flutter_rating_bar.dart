export 'package:flutter_rating_bar/src/rating_bar.dart';
export 'package:flutter_rating_bar/src/rating_bar_indicator.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating bAr'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ratingPopUp(context);
                },
                child: Text('oPeN Me'))
          ],
        ),
      ),
    );
  }

  Future<void> ratingPopUp(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(
            top: 20,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('RATE US'),
              const SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                unratedColor: Colors.grey,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                // glowColor: Colors.yellow,
                // allowHalfRating: true,
                // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemCount: 5,
                itemBuilder: (context, ind) => const Icon(
                  Icons.star,
                  size: 5,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  print('im rating :: $rating');
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          right: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Remind me later')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          left: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Submit')),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
        );
      },
    );
  }
}
