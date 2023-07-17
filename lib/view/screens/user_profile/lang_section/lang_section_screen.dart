import 'package:ecom_app/config/language/cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangSectionScreen extends StatelessWidget {
  const LangSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: BlocBuilder<LangCubit, LangState>(
          builder: (context, state) {
            return Column(children: [
              RadioListTile(
                  value: 'en',
                  groupValue: BlocProvider.of<LangCubit>(context).appLocal,
                  onChanged: (value) {
                    BlocProvider.of<LangCubit>(context).changeLang(value!);
                  },
                  title: const Text('English')),
              RadioListTile(
                  value: 'ar',
                  groupValue: BlocProvider.of<LangCubit>(context).appLocal,
                  onChanged: (value) {
                    BlocProvider.of<LangCubit>(context).changeLang(value!);
                  },
                  title: const Text('العربية')),
            ]);
          },
        ),
      ),
    );
  }
}
