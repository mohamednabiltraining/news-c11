class Source {
  String id;
  String name;
  bool isSelected;
  Source({required this.id, required this.name ,this.isSelected= false});
  static List<Source> getSources() {
    return [
      Source(id: 'CNN', name: 'CNN',),
      Source(id: 'BBC', name: 'BBC'),
      Source(id: 'ALJAZERA', name: 'ALJAZERA'),
      Source(id: 'BBC', name: 'BBC'),
      Source(id: 'ALJAZERA', name: 'ALJAZERA'),
      Source(id: 'CNN', name: 'CNN'),
      Source(id: 'BBC', name: 'BBC'),
      Source(id: 'ALJAZERA', name: 'ALJAZERA'),
      Source(id: 'BBC', name: 'BBC'),
      Source(id: 'ALJAZERA', name: 'ALJAZERA'),
    ];
  }
}
