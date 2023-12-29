import 'package:flutter/material.dart';
import 'package:submission_idcamp/components/theme/color.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter(
      {super.key, required this.onSearch, required this.showFilterOptions});

  final onSearch;
  final Function showFilterOptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onSearch,
              cursorColor: CustomColor.primaryColor,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: CustomColor.primaryColor,
                hintText: "Cari Movie",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          GestureDetector(
            onTap: () => showFilterOptions(),
            child: const Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}