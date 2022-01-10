import 'package:flutter/material.dart';

const Color _mariner = const Color(0xFFF3A646);
const Color _mediumPurple = const Color(0xFFF44242);
const Color _mySin1 = const Color(0xFFFFFFFF);
const Color _tomato = const Color(0xFF419df4);
const Color _mySin = const Color(0xFF5e2ab2);

class SectionDetail {
  const SectionDetail({this.title, this.subtitle, this.imageAsset, this.url});
  final String title;
  final String url;
  final String subtitle;
  final String imageAsset;
}

class Section {
  const Section({
    this.title,
    this.backgroundAsset,
    this.leftColor,
    this.rightColor,
    this.details,
  });
  final String title;
  final String backgroundAsset;
  final Color leftColor;
  final Color rightColor;
  final List<SectionDetail> details;

  @override
  bool operator ==(Object other) {
    if (other is! Section) return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

SectionDetail _facebookDetail(String url, String text, String sub) {
  return SectionDetail(imageAsset: 'https://smartkit.wrteam.in/smartkit/images/facebook.jpg', title: text, subtitle: sub, url: url);
}

const SectionDetail _facebookImageDetail = const SectionDetail(
  imageAsset: 'https://smartkit.wrteam.in/smartkit/images/facebook.jpg',
);

const SectionDetail _instagramDetail = const SectionDetail(imageAsset: 'https://smartkit.wrteam.in/smartkit/images/instagram.jpg', title: 'Mercedes benz', subtitle: 'click  here  ', url: 'https://www.instagram.com/download/request/');

const SectionDetail _instagramImageDetail = const SectionDetail(
  imageAsset: 'https://smartkit.wrteam.in/smartkit/images/instagram.jpg',
);

const SectionDetail _twitterDetail = const SectionDetail(imageAsset: 'https://smartkit.wrteam.in/smartkit/images/twitter.jpg', title: 'BMW', subtitle: 'click  here', url: 'https://twitter.com/settings/your_twitter_data');

const SectionDetail _twitterDetail1 = const SectionDetail(imageAsset: 'https://smartkit.wrteam.in/smartkit/images/twitter.jpg', title: 'Lionel Messi', subtitle: 'click  here', url: 'https://twitter.com/settings/your_twitter_data');

const SectionDetail google = const SectionDetail(imageAsset: 'https://smartkit.wrteam.in/smartkit/images/google.jpg', title: 'Lamborghini', subtitle: 'click  here', url: 'https://twitter.com/settings/your_twitter_data');
const SectionDetail _twitterImageDetail = const SectionDetail(
  imageAsset: 'https://smartkit.wrteam.in/smartkit/images/twitter.jpg',
);
const SectionDetail _twitterImageDetail1 = const SectionDetail(
  imageAsset: 'https://smartkit.wrteam.in/smartkit/images/twatch.jpg',
);
const SectionDetail _google = const SectionDetail(
  imageAsset: 'https://smartkit.wrteam.in/smartkit/images/google.jpg',
);

final List<Section> allSections = <Section>[
  Section(
    title: 'Lamborghini',
    leftColor: _mediumPurple,
    rightColor: _mariner,
    backgroundAsset: 'https://smartkit.wrteam.in/smartkit/images/google.jpg',
    details: <SectionDetail>[
      _google,
      google,
    ],
  ),
  Section(
    title: 'Ferrari',
    leftColor: _mySin1,
    rightColor: _mediumPurple,
    backgroundAsset: 'https://smartkit.wrteam.in/smartkit/images/facebook.jpg',
    details: <SectionDetail>[
      _facebookImageDetail,
      _facebookDetail('https://www.facebook.com/your_information/', "Ferrari let's Go.", 'Check  your activity'),
    ],
  ),
  const Section(
    title: 'Mercedes benz',
    leftColor: _tomato,
    rightColor: _mySin,
    backgroundAsset: 'https://smartkit.wrteam.in/smartkit/images/instagram.jpg',
    details: const <SectionDetail>[
      _instagramImageDetail,
      _instagramDetail,
    ],
  ),
  const Section(
    title: 'BMW',
    leftColor: _mariner,
    rightColor: _tomato,
    backgroundAsset: 'https://smartkit.wrteam.in/smartkit/images/twitter.jpg',
    details: const <SectionDetail>[
      _twitterImageDetail,
      _twitterDetail,
    ],
  ),
  const Section(
    title: 'MESSI',
    leftColor: _mySin1,
    rightColor: _tomato,
    backgroundAsset: 'https://smartkit.wrteam.in/smartkit/images/twatch.jpg',
    details: const <SectionDetail>[
      _twitterImageDetail1,
      _twitterDetail1,
    ],
  ),
];
