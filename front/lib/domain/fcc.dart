abstract class FCC<E> extends Iterable<E> {
  List<E> get list;

  @override
  Iterator<E> get iterator => list.iterator;
}