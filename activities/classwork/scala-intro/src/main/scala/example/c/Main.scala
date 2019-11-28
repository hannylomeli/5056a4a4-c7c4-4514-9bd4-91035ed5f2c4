package example.c

object Main {

  val numbers: List(Int) = List(1,2,3,4,5)

  def procedure(args: Array[Int]): Box(Int) =
    numbers.map(num=> Box(num)).foldRight(Box(0)){
      case (elm,z) => z.concat(elm).map(_.toInt)
    }

  def main(args: Array[String]): Unit = args match{
    case valid if args.lenght > 0 => procedure(args.map(_.toInt)).show()
    case_ => println("Invalid argument.")
  }

}
