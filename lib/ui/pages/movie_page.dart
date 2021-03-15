part of 'pages.dart';

class MoviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // note: Header
        Container(
          decoration: BoxDecoration(
              color: accentColor2,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xFF5F558B), width: 1)),
                      child: Stack(
                        children: [
                          SpinKitFadingCircle(color: accentColor, size: 50),
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (userState.users.profilPicture ==
                                              ""
                                          ? AssetImage('assets/user_pic.png')
                                          : NetworkImage(
                                              userState.users.profilPicture)),
                                      fit: BoxFit.cover)))
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(
                            userState.users.name,
                            style: whiteTextFont.copyWith(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                            NumberFormat.currency(
                                    locale: 'id_ID',
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(userState.users.balance),
                            style: yellowNumber.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ],
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentColor,
                  size: 50,
                );
              }
            },
          ),
        )
      ],
    );
  }
}
