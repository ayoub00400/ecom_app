import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import '../../../utils/extensions/build_context.dart';
import '../../common/custom_button.dart';
import '../../components/confirmation_dialog.dart';
import 'cubit/user_order_cubit.dart';
import 'cubit/user_order_state.dart';
import 'widgets/custom_order_item.dart';

class UserOrderScreen extends StatelessWidget {
  const UserOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserOrderCubit()..loadOrder(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text('Cart'),
              const SizedBox(
                width: 4,
              ),
              BlocBuilder<UserOrderCubit, UserCartState>(
                builder: (context, state) {
                  if (BlocProvider.of<UserOrderCubit>(context)
                      .orderItems
                      .isNotEmpty) {
                    return Text(
                        '(${BlocProvider.of<UserOrderCubit>(context).orderItems.length.toString()})');
                  } else {
                    return const Text('(0)');
                  }
                },
              )
            ],
          ),
          actions: [
            BlocBuilder<UserOrderCubit, UserCartState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () async {
                    // if (BlocProvider.of<UserOrderCubit>(context).orderItems == null) {}
                    if (BlocProvider.of<UserOrderCubit>(context)
                        .orderItems
                        .isEmpty) return;

                    bool result = await showDialog(
                      context: context,
                      builder: (_) => CustomDialog(
                        title: "",
                        content: 'R u sure to delete All items from Cart? ',
                      ),
                    );

                    if (result) {
                      BlocProvider.of<UserOrderCubit>(context).deleteAllItems();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.smallPadding,
                    ),
                    child:
                        Icon(Icons.delete_outline, size: 30, color: Colors.red),
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: Constants.smallPadding),
            child: BlocBuilder<UserOrderCubit, UserCartState>(
              builder: (context, state) {
                final orderCubit = BlocProvider.of<UserOrderCubit>(context);

                if (state is UserCartLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (orderCubit.orderItems.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      orderCubit.loadOrder();
                    },
                    child: ListView(
                      children: [
                        const SizedBox(height: 300),
                        Container(
                            alignment: AlignmentDirectional.center,
                            child: Text(context.loc.emptyData)),
                      ],
                    ),
                  );
                }

                if (state is UserCartLoadingFailed) {
                  return Center(
                    child: Text(context.loc.fetchDataFailed),
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          orderCubit.loadOrder();
                        },
                        child: ListView.builder(
                          itemCount: orderCubit.orderItems.length,
                          itemBuilder: (context, index) {
                            return CustomOrderItem(
                              orderItem: orderCubit.orderItems[index],
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: Constants.mediumPadding),
                      alignment: AlignmentDirectional.center,
                      child: CustomButton(
                        isLoading: false,
                        width: 300,
                        labelColor: Colors.black,
                        height: 45,
                        onPressed: () {},
                        buttonLabel:
                            '${context.loc.checkout.toUpperCase()} (${orderCubit.total.toString()} \$ )',
                        buttColor: Colors.amber,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
