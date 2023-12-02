import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final String slug;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        image,
        slug,
      ];
}
