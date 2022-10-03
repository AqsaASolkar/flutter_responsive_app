extension ImagePath on String {
  String get toPng => 'images/$this.png';
}

const mobileWidth = 600;
const tabletWidth = 800;

List<String> headerList = ['Home', 'Explore', 'Product', 'Premium'];
