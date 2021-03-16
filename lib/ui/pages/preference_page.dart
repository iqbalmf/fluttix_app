part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    'Horror',
    'Music',
    'Action',
    'Drama',
    'War',
    'Crime'
  ];
  final List<String> languages = [
    'Bahasa',
    'English',
    'Japanese',
    'Korean',
  ];
  final RegistrationData registrationData;

  PreferencePage(this.registrationData);

  @override
  _PrefrencePageState createState() => _PrefrencePageState();
}

class _PrefrencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguages = 'English';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrationData.password = "";
        context
            .bloc<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationData));
        return;
      },
      child: Scaffold(
          body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 56,
                    margin: EdgeInsets.only(top: 20, bottom: 4),
                    child: GestureDetector(
                        onTap: () {
                          widget.registrationData.password = "";
                          context.bloc<PageBloc>().add(
                              GoToRegistrationPage(widget.registrationData));
                        },
                        child: Icon(Icons.arrow_back))),
                Text(
                  'Select Your\nFavorite Genre',
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
                SizedBox(height: 16),
                Wrap(
                  children: generateGenreWidgets(context),
                  runSpacing: 24,
                  spacing: 24,
                ),
                SizedBox(
                  height: 24,
                ),
                Text('Movie Language\nYou Prefer',
                    style: blackTextFont.copyWith(fontSize: 20)),
                SizedBox(height: 16),
                Wrap(
                  children: generateLanguageWidgets(context),
                  runSpacing: 24,
                  spacing: 24,
                ),
                SizedBox(height: 30),
                Center(
                  child: FloatingActionButton(
                    backgroundColor: mainColor,
                    elevation: 0,
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (selectedGenres.length != 4) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: pinkColor,
                          message: 'Please select 4 genres',
                        ).show(context);
                      } else {
                        widget.registrationData.selectedGenres = selectedGenres;
                        widget.registrationData.selectedLang =
                            selectedLanguages;
                        context.bloc<PageBloc>().add(
                            GoToAccountConfirmationPage(
                                widget.registrationData));
                      }
                    },
                  ),
                ),
                SizedBox(height: 50),
              ],
            )
          ],
        ),
      )),
    );
  }

  List<Widget> generateLanguageWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.languages
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedLanguages == e,
              onTap: () {
                setState(() {
                  selectedLanguages = e;
                });
              },
            ))
        .toList();
  }

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenres.contains(e),
              onTap: () {
                onSelectGenre(e);
              },
            ))
        .toList();
  }

  void onSelectGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
