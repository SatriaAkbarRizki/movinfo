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
    return Dialog(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Settings Profile',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 18),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () => context.read<ProfileBloc>().add(OnChangeImage()),
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileImage) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: state.image != null
                                ? ClipOval(
                                    child: Image.file(
                                      fit: BoxFit.cover,
                                      state.image!,
                                    ),
                                  )
                                : ClipOval(
                                    child: ColoredBox(color: Color(0xff5d8274)),
                                  ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: SvgPicture.asset(
                              'assets/icons/edit-circle-line.svg'),
                          height: 25,
                          width: 25,
                        )
                      ],
                    );
                  }
                  return SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipOval(
                      child: ColoredBox(color: Color(0xff5d8274)),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FocusScope(
              node: nameFocus,
              onFocusChange: (value) => context
                  .read<ProfileBloc>()
                  .add(OnChangeName(name: nameController.text)),
              child: TextFormField(
                controller: nameController,
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color),
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FocusScope(
              node: descriptionFocus,
              onFocusChange: (value) => context.read<ProfileBloc>().add(
                  OnChangeDescriptions(
                      description: descriptionController.text)),
              child: TextFormField(
                controller: descriptionController,
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color),
                maxLines: 8,
                decoration: InputDecoration(
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
