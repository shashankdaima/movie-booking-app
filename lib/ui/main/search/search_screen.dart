import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_booking_app/utils/api_response.dart';
import 'package:movie_booking_app/utils/no_overscroll_behaviour.dart';

import '../../../models/responses/search_results.dart';
import '../../../services/api_services/api_service.dart';
import '../../../utils/easy_debouncer.dart';
import '../../widgets/gradiant_button.dart';
import 'search_view_model.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        ref.read(searchViewModelProvider.notifier).searchQuery();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(searchViewModelProvider.select((value) => value.status));
    final list =
        ref.watch(searchViewModelProvider.select((value) => value.list));
    final hasMorePages =
        ref.watch(searchViewModelProvider.select((value) => value.hasMore));
    debugPrint(list.length.toString());
    return ScrollConfiguration(
      behavior: NoOverscrollBehaviour(),
      child: ListView.builder(
        controller: controller,
        itemBuilder: ((context, index) {
          if (index == 0) {
            return const SizedBox(
              height: 16,
            );
          } else if (index == 1) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Search(),
            );
          } else if (index == 2) {
            return const SizedBox(
              height: 12,
            );
          } else if (index == 3) {
            if (list.isNotEmpty)
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Movies",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600, fontSize: 26),
                ),
              );
            else {
              return const Center();
            }
          } else if (index == list.length + 4) {
            return (list.isNotEmpty &&
                    hasMorePages &&
                    state == SearchScreenStatus.loading)
                ? const Center(child: CircularProgressIndicator())
                : Container();
          } else {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
              child: MovieOverview2(
                item: list[index - 4],
              ),
            );
          }
        }),
        itemCount: list.length + 5,
      ),
    );
  }
}

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Color(0xFF2F2C44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search for Movies, Genre, Theater'),
          onChanged: (text) {
            EasyDebounce.debounce(
                'search_debounce',
                const Duration(milliseconds: 500),
                () => ref
                    .read(searchViewModelProvider.notifier)
                    .searchQuery(str: text));
          },
        ),
      ),
    );
  }
}

class MovieOverview2 extends StatelessWidget {
  const MovieOverview2({required this.item, super.key});
  final SearchResultItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              width: 150,
              height: 210,
              fit: BoxFit.cover,
              imageUrl: ApiService.getImageUrl(item.posterPath) ??
                  "http://via.placeholder.com/350x150",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text("4.5/5"),
                GradiantButton(
                  onPressed: () {},
                  height: 32,
                  borderRadius: BorderRadius.circular(10),
                  child: Text("Book This"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
