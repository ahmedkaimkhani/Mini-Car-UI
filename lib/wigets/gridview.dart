import 'package:car_app_flutter/constrants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> carsList = [
  {
    'title': 'Lamborghini grey',
    'price': '\$100',
    'image':
        'https://c4.wallpaperflare.com/wallpaper/1011/898/396/lamborghini-cool-car-famous-brand-dark-background-black-window-wallpaper-preview.jpg'
  },
  {
    'title': 'Lamborghini',
    'price': '\$200',
    'image':
        'https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg'
  },
  {
    'title': 'Black sports car',
    'price': '\$300',
    'image':
        'https://c4.wallpaperflare.com/wallpaper/323/372/925/lamborghini-car-lamborghini-aventador-vehicle-wallpaper-preview.jpg'
  },
  {
    'title': 'Black Car',
    'price': '\$400',
    'image':
        'https://c4.wallpaperflare.com/wallpaper/757/921/129/black-car-wallpaper-preview.jpg'
  },
  {
    'title': 'BMW',
    'price': '\$500',
    'image':
        'https://c4.wallpaperflare.com/wallpaper/778/537/81/bmw-wallpaper-preview.jpg'
  },
  {
    'title': 'Black BMW sedan',
    'price': '\$600',
    'image':
        'https://c4.wallpaperflare.com/wallpaper/412/867/691/car-bmw-bmw-i8-cyan-wallpaper-preview.jpg'
  },
  {
    'title': 'BMW M3 E92',
    'price': '\$700',
    'image':
        'https://c4.wallpaperflare.com/wallpaper/876/982/478/bmw-m3-e92-white-car-front-view-wallpaper-preview.jpg'
  },
  {
    'title': 'BMW i8',
    'price': '\$800',
    'image':
        'https://c4.wallpaperflare.com/wallpaper/825/162/414/bmw-i8-concept-car-front-view-lights-wallpaper-preview.jpg'
  },
];

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 30),
      itemCount: carsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 270,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: tdAmber,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.network(
                  '${carsList.elementAt(index)['image']}',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${carsList.elementAt(index)['title']}',
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.bold, color: tdBlack))),
                    const SizedBox(
                      height: 08,
                    ),
                    Text('${carsList.elementAt(index)['price']}',
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.bold, color: tdGrey))),
                    const SizedBox(
                      height: 08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.heart)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.cart))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
