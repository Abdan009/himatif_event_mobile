part of 'models.dart';

class BannerPromo extends Equatable {
  final String id;
  final String bannerUrl;
  BannerPromo({
    @required this.id,
    @required this.bannerUrl,
  });
  @override
  List<Object> get props => [id, bannerUrl];
}

List<BannerPromo> mockBanner = [
  BannerPromo(
    id: '1',
    bannerUrl:
        'https://ecs7.tokopedia.net/img/blog/seller/2020/10/SC2-768x400.jpg',
  ),
  BannerPromo(
    id: '2',
    bannerUrl:
        'https://ecs7.tokopedia.net/img/blog/seller/2020/10/SC2-768x400.jpg',
  ),
  BannerPromo(
    id: '3',
    bannerUrl:
        'https://img.freepik.com/free-vector/sale-banner-template-design_74379-121.jpg?size=626&ext=jpg&ga=GA1.2.1588707983.1618358400',
  ),
  BannerPromo(
    id: '4',
    bannerUrl:
        'https://img.freepik.com/free-vector/sale-banner-template-design_74379-121.jpg?size=626&ext=jpg&ga=GA1.2.1588707983.1618358400',
  ),
];
