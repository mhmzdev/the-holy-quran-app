part of '../surah_index_screen.dart';

class SurahTile extends StatelessWidget {
  final Chapter? chapter;

  const SurahTile({
    Key? key,
    this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PageScreen(
                chapter: chapter,
              ),
            ),
          );
        },
        onLongPress: () => showDialog(
          context: context,
          builder: (context) => _SurahInformation(
            chapterData: chapter,
          ),
        ),
        child: Padding(
          padding: Space.all(1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(chapter!.number!.toString()),
              Space.x1!,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapter!.englishName!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    chapter!.englishNameTranslation!,
                    style: AppText.b2,
                  )
                ],
              ),
              Expanded(
                child: Text(
                  chapter!.name!,
                  style: AppText.b1b,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
