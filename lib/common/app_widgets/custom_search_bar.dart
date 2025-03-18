import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final TextEditingController? searchController;
  final FocusNode? searchFocus;
  final bool? active;
  final bool clearVisible;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onClearTapped;

  const CustomSearchBar(
      {super.key,
      this.hintText = '',
      this.searchController,
      this.searchFocus,
      this.onTap,
      this.onChanged,
      this.active = true,
      this.clearVisible = false,
      this.onClearTapped,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              active!
                  ? IconButton(
                      onPressed: () {
                        final homeNotifier =
                            Provider.of<HomeNotifier>(context, listen: false);
                        homeNotifier.clearFilter();
                        homeNotifier.setVisibleFilter(false);
                        Navigator.pop(context);
                      },
                      icon:
                          Icon(Icons.arrow_back_outlined, color: Colors.black),
                    )
                  : Icon(Icons.search, color: Colors.black),
              SizedBox(width: 8),
              Expanded(
                child: active!
                    ? TextField(
                        autofocus: true,
                        onTap: onTap,
                        onChanged: onChanged,
                        onSubmitted: onSubmitted,
                        focusNode: searchFocus,
                        controller: searchController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: hintText,
                          border: InputBorder.none,
                          hintStyle: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.onSecondaryFixed),
                        ),
                      )
                    : Text(
                        hintText!,
                        style: theme.textTheme.titleMedium!.copyWith(
                            color: theme.colorScheme.onSecondaryFixed),
                      ),
              ),
              (active! && clearVisible)
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: onClearTapped ?? () {},
                        icon: Icon(Icons.clear),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
