import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/custom_button.dart';
import 'cubit/user_order_cubit.dart';
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
                        return Text('(${BlocProvider.of<UserOrderCubit>(context).orderItems.length.toString()})');
                      },
                    )
                  ],
                ),
                actions: [
                  BlocBuilder<UserOrderCubit, UserCartState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<UserOrderCubit>(context).deleteAllItems(),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                      );
                    },
                  ),
                ],),
            body: SafeArea(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BlocBuilder<UserOrderCubit, UserCartState>(
                    builder: (context, state) {
                      if (BlocProvider.of<UserOrderCubit>(context).orderItems.isEmpty) {
                        return const Center(
                          child: Text('Empty section'),
                        );
                      }
                      if (state is UserCartLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is UserCartLoadingFailed) {
                        return const Center(
                          child: Text('Failed when fetching cart'),
                        );
                      }

                      return Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: BlocProvider.of<UserOrderCubit>(context).orderItems.length,
                                itemBuilder: (context, index) {
                                  return CustomOrderItem(
                                      orderItem: BlocProvider.of<UserOrderCubit>(context).orderItems[index],);
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsetsDirectional.only(bottom: 10),
                              alignment: AlignmentDirectional.center,
                              child: CustomButton(
                                  width: 300,
                                  labelColor: Colors.black,
                                  height: 45,
                                  onPressed: () {},
                                  buttonLabel:
                                      'CHECKOUT (\$ ${BlocProvider.of<UserOrderCubit>(context).total.toString()} )',
                                  buttColor: Colors.amber,),
                            )
                          ],
                        ),
                      );
                    },
                  ),),
            ),),);
  }
}