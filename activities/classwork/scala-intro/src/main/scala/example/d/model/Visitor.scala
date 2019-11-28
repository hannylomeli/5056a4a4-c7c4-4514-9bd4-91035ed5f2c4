package example.d.model

import java.sql.Timestamp

sealed trait Visitor {
  def id:String
  def createdAt: Timestamp

  def getAgeInSeconds: Int = createdAt.getSeconds

  def show() : Unit = this match {
    case Visitor.Anonymous(id, createdAt) => printLn (s"Anonymous user with id $id")
    case Visitor.User(_, email, _) =>
      println(s"User with email $email")
  }

  def getEmail: Option[String]
}

object Visitor {
  final case class Anonymous(id:String, created: Timestamp) extends Visitor {
    override def getEmail: Option[String] = None
  }
  final case class User(id:String, email: String, created: Timestamp) extends Visitor {
    override def getEmail: Option[String] = Some(email)
  }
}