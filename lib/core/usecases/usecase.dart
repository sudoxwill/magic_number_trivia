abstract class Usecase<UseCaseType, Param> {
  Future<UseCaseType> call(Param p);
}
