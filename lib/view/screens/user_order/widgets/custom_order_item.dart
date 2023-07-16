import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../model/order_item.dart';

class CustomOrderItem extends StatelessWidget {
  final OrderItem orderItem;
  const CustomOrderItem({
    super.key,
    required this.orderItem,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier dragDirection = ValueNotifier(DismissDirection.none);
    ValueNotifier<int> quantity = ValueNotifier<int>(orderItem.quantity);
    return Dismissible(
      key: Key(orderItem.id.toString()),
      onUpdate: (details) {
        dragDirection.value = details.direction;
      },
      onDismissed: (direction) {},
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: const Text('R u sure to delete this item from list '),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('no'),
              ),
            ],
          ),
        );
      },
      direction: DismissDirection.horizontal,
      background: ValueListenableBuilder(
        valueListenable: dragDirection,
        builder: (context, value, child) {
          return Container(
            color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 10),
            alignment: (dragDirection.value == DismissDirection.startToEnd)
                ? AlignmentDirectional.centerStart
                : AlignmentDirectional.centerEnd,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        },
      ),
      child: SizedBox(
        height: 150,
        child: Card(
          color: Colors.grey.shade100,
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          child: Row(
            children: [
              Container(
                height: 150,
                width: 120,
                margin: const EdgeInsets.all(4),
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(orderItem.image!,
                    height: 150, fit: BoxFit.fitHeight,),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        orderItem.label!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: quantity,
                            builder: (context, value, child) => Text(
                              (NumberFormat(',#').format(orderItem.total))
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.amber),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero,),
                                    shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100),),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (orderItem.quantity != 0) {
                                      orderItem.quantity -= 1;
                                      quantity.value -= 1;
                                      orderItem.total =
                                          orderItem.price * quantity.value;
                                    }
                                  },
                                  child: const Icon(Icons.remove,
                                      size: 20, color: Colors.white,),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ValueListenableBuilder(
                                  valueListenable: quantity,
                                  builder: (BuildContext context, dynamic value,
                                      Widget? child,) {
                                    return Text(
                                      '${quantity.value}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.amber),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero,),
                                    shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100),),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    orderItem.quantity += 1;
                                    quantity.value += 1;
                                    orderItem.total =
                                        orderItem.price * orderItem.quantity;
                                  },
                                  child: const Icon(Icons.add,
                                      size: 20, color: Colors.white,),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
