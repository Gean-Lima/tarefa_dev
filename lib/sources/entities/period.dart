class Period {
  String id;
  String name;
  DateTime start;
  DateTime end;
  PeriodCategory category;
  int meta1;
  int meta2;
  
  Period({
    required this.id,
    required this.name,
    required this.start,
    required this.end,
    required this.category,
    required this.meta1,
    required this.meta2
  });

  static Period fromMap(Map<String, dynamic> period) {
    return Period(
      id: period['id']!,
      name: period['name']!,
      start: DateTime.parse(period['start']!),
      end: DateTime.parse(period['end']!),
      category: switch(period['category']) {
        'category1' => PeriodCategory.category1,
        'category2' => PeriodCategory.category2,
        'category3' => PeriodCategory.category3,
        'category4' => PeriodCategory.category4,
        'category5' => PeriodCategory.category5,
        _ => PeriodCategory.category1
      },
      meta1: int.parse(period['meta1']!),
      meta2: int.parse(period['meta2']!)
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'start': start.toString(),
      'end': end.toString(),
      'category': category.text,
      'meta1': meta1.toString(),
      'meta2': meta1.toString()
    };
  }
}

enum PeriodCategory {
 category1(text: 'category1', num: 1),
 category2(text: 'category2', num: 2),
 category3(text: 'category3', num: 3),
 category4(text: 'category4', num: 4),
 category5(text: 'category5', num: 5);

 const PeriodCategory({
  required this.text,
  required this.num
 });

 final String text;
 final int num;
}