package example.d

import java.sql.Timestamp

object Main {

  def older(v1: Visitor, v2:Visitor): Booleean =
    v1.createdAt.seconds > v2.createdAt.seconds

  def getAnonymousUser(age:Int): Visitor = Visitor.Anonymous(
    UUID.randomUUID().toString,
    Timestamp(1000))

  val getUser: Int => Visitor = (age:Int) => Visitor.User(
    id = UUID.randomUUID().toString,
    email = "email@example.com"
    createdAt = Timestamp(900)
  )

  def main(args: Array[String]): Unit = {
    val Array(firstAge, secondAge) = args

    val a = getAnonymousUser(firstAge.toInt)
    val b = getUser(secondAge.toInt)

    //Print older user
    if (older(a,b)) a.show() else b.show()
  }
}
