import 'package:eshop/models/order.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  final Orderr order;

  const OrderItem({
    super.key,
    required this.order,
  });

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool showDetails = false;

  void toggleShowDetails() {
    setState(() {
      showDetails = !showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return AnimatedContainer(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      margin: EdgeInsets.only(bottom: 8),
      height:
          showDetails ? 280 + (widget.order.purchases!.length - 1) * 22 : 60,
      decoration: BoxDecoration(
        color: theme.colorScheme.onError,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          )
        ],
      ),
      duration: Duration(milliseconds: 200),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.local_shipping),
                      SizedBox(width: 10),
                      // Payment method title
                      Text(
                        widget.order.id!,
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.order.status!,
                  style: theme.textTheme.bodyMedium,
                ),
                IconButton(
                    onPressed: toggleShowDetails,
                    icon: Icon(showDetails
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down)),
              ],
            ),
            showDetails
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Purchases:',
                        style: theme.textTheme.titleMedium,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(widget.order.purchases!.length,
                            (index) {
                          return Text(
                            '${widget.order.purchases![index].product!.title}   (x${widget.order.purchases![index].quantity})',
                          );
                        }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 12),
                          // Payment method title
                          Text(
                            'Shipping adress: ${widget.order.shippingAdress!.title!}',
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Text(
                          '${widget.order.shippingAdress!.houseNumber} ${widget.order.shippingAdress!.street},\n${widget.order.shippingAdress!.city} ${widget.order.shippingAdress!.postalCode},\n${widget.order.shippingAdress!.country}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Created At: ${widget.order.createdAt!}',
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Payment: ',
                                  style: theme.textTheme.titleMedium,
                                ),
                                Text(
                                  widget.order.paymentMethod!,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            r'$' + widget.order.price!,
                            style: theme.textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
