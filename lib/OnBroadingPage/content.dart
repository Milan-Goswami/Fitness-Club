
class UnbroadingContent{
    String image;
    String title;
    String discription;

    UnbroadingContent({required this.image,required this.title,required this.discription});
}

List<UnbroadingContent> content =[

  UnbroadingContent(
    title: 'Have a good health',
    image: 'assets/image/body.gif',
    discription: 'good health as a state of complete physical'
        ', mental, and social well-being'
        ', not just the absence of disease.'
  ),

  UnbroadingContent(
      title: 'Be stronger',
      image: 'assets/image/Strong.jpg',
      discription: 'having, showing, or able to exert great bodily or muscular power'
          ' physically vigorous or robust a strong boy.'
  ),

  UnbroadingContent(
      title: 'Have nice body',
      image: 'assets/image/Body.jpg',
      discription: 'good body is about cultivating a body that feels good,'
          ' rather than just looking good. '
          'Others say that having a good body is important because it allows for development and success, '
          'and can lead to a better quality of life.'
  ),

];