part of 'widgets.dart';

class CacheImageCustom extends StatelessWidget {
  final String url;
  final Function(BuildContext, ImageProvider<Object>) imageBuilder;
  final double sizeLoadingDefault;
  // final Widget loading;
  CacheImageCustom(
      {@required this.url,
      @required this.imageBuilder,
      // this.loading,
      this.sizeLoadingDefault});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        loading(4.0),
        CachedNetworkImage(
          imageUrl: url,
          imageBuilder: imageBuilder,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ],
    );
  }
}
