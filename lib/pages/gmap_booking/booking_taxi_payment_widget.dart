part of 'gmap_booking_view.dart';

class BookingTaxiPaymentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingTaxiBloc, BookingTaxiState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0)
            )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Payment Methods",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left
                )
              ),
              Container(    
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFD5DDE0),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0), // shadow direction: bottom right
                    ),
                    BoxShadow(
                      color: Color(0xFFD5DDE0),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(0, 0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Material(
                        child: Image(
                            image: AssetImage('assets/images/ic_mastercard.png'),
                            fit: BoxFit.scaleDown, // use this
                          ),
                        ),   
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "**** 3704"
                        ),
                      )
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          color: Color(0xFFD5DDE0),
                          size: 30.0,
                        ),
                        onPressed: () => context.read<BookingTaxiBloc>().add(BookingPaymentSetUp(PaymentMethod.mastercard)),
                      )
                    ),
                  ],
                ),
              ),
              Container(    
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFD5DDE0),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0), // shadow direction: bottom right
                    ),
                    BoxShadow(
                      color: Color(0xFFD5DDE0),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(0, 0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      child: Material(
                        child: Image(
                          image: AssetImage('assets/images/ic_visa.png'),
                          fit: BoxFit.scaleDown, // use this
                        ),
                      )        
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "**** 8462"
                        )
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          color: Color(0xFFD5DDE0),
                          size: 30.0,
                        ),
                        onPressed: () => context.read<BookingTaxiBloc>().add(BookingPaymentSetUp(PaymentMethod.visa)),
                      )
                    ),
                  ],
                ),
              ),
              Container(    
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFD5DDE0),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0), // shadow direction: bottom right
                    ),
                    BoxShadow(
                      color: Color(0xFFD5DDE0),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(0, 0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      child: Material(
                        child: Image(
                          image: AssetImage('assets/images/ic_cash.png'),
                          fit: BoxFit.scaleDown, // use this
                        ),
                      )        
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Cash"
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          color: Color(0xFFD5DDE0),
                          size: 30.0,
                        ),
                        onPressed: () => context.read<BookingTaxiBloc>().add(BookingPaymentSetUp(PaymentMethod.cash)),
                      )
                    )
                  ],
                ),
              ),
            ]
          )
        );
      }
    );
  }
}