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
        'https://i.pinimg.com/originals/0f/94/f1/0f94f1a8785e703b34540cd5a6bcf3e0.jpg',
  ),
  BannerPromo(
    id: '2',
    bannerUrl:
        'https://jagokata.com/images/upload/chairul-tanjung-kemenangan-bukanlah-prioritas-utama-dalam-suatu-perlombaan.jpg',
  ),
  BannerPromo(
    id: '3',
    bannerUrl:
        'https://i1.wp.com/titikdua.net/wp-content/uploads/2018/10/Kata-kata-motivasi-Islami.jpg?resize=800%2C450',
  ),
  BannerPromo(
    id: '4',
    bannerUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzxXD8Z6Q92PRHB_McMdd7q7h_KeTXSwf4mu18YLXmN4Hf5LETb24b9e3S9IoPoxjjxNs&usqp=CAU',
  ),
];
