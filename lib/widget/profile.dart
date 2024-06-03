import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movinfo/bloc/profile/profile_bloc.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final FocusScopeNode nameFocus = FocusScopeNode();

  final FocusScopeNode descriptionFocus = FocusScopeNode();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameFocus.dispose();
    descriptionFocus.dispose();
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('Theme Mode: ${ThemeMode.system}');
    return Dialog(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Settings Profile',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () => context.read<ProfileBloc>().add(OnChangeImage()),
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileUser) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: state.image != null
                                ? ClipOval(
                                    child: Image.file(
                                      frameBuilder: (context, child, frame,
                                          wasSynchronouslyLoaded) {
                                        if (wasSynchronouslyLoaded) {
                                          return child;
                                        } else {
                                          return AnimatedOpacity(
                                            opacity: frame == null ? 0 : 1,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeInOut,
                                            child: child,
                                          );
                                        }
                                      },
                                      state.image!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 170,
                          child: SvgPicture.asset(
                              'assets/icons/edit-circle-line.svg'),
                          height: 25,
                          width: 25,
                        )
                      ],
                    );
                  }
                  return Stack(
                    children: [
                      const SizedBox(
                        height: 200,
                        width: 200,
                        child: ClipOval(
                          child: ColoredBox(color: Color(0xff5d8274)),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 170,
                        child: SvgPicture.asset(
                          'assets/icons/edit-circle-line.svg',
                          theme: SvgTheme(
                              currentColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        height: 25,
                        width: 25,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
            child: FocusScope(
              autofocus: true,
              node: nameFocus,
              onFocusChange: (value) => nameController.text.isNotEmpty
                  ? context
                      .read<ProfileBloc>()
                      .add(OnChangeName(name: nameController.text))
                  : null,
              child: TextFormField(
                controller: nameController,
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color),
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: FocusScope(
              autofocus: true,
              node: descriptionFocus,
              onFocusChange: (value) => descriptionController.text.isNotEmpty
                  ? context.read<ProfileBloc>().add(OnChangeDescriptions(
                      description: descriptionController.text))
                  : null,
              child: TextFormField(
                controller: descriptionController,
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color),
                maxLines: 8,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
