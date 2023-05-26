package sql;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
@SuppressWarnings({"all"})
public class BookCRUD {
    static Scanner scanner = new Scanner(System.in);
    static String tableName2 = "book";  //表示表名
    public static void add() { //添加
        Statement stmt;
        try {
            System.out.print("请输入你要插入的图书编号:");
            String newID = scanner.next() ;  //存放 id(图书编号)

            System.out.print("请输入您要插入的图书名字:");
            String newName = scanner.next(); //新的书名

            System.out.print("请输入您要插入的图书作者:");
            String newAuthor = scanner.next(); //新的图书作者

            int insID = 0;
            while (true) {
                try {
                    System.out.print("请输入你要插入的图书库存：");
                    insID = Integer.parseInt(scanner.next());
                    break;
                } catch (Exception e) {
                    System.out.println("你输入的id格式有误，请重新输入");
                }
            }

            String sql = "insert into " + tableName2 + " values (\'" +
                    newID + "\',\'" +
                    newName + "\',\'" +
                    newAuthor + "\',\'" +
                    insID + "\')";

            stmt = Conn.con.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
            System.out.println("insert success!");
            return;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void delete() { //删除
        Statement stmt;
        try {
            if (Conn.con.isClosed()) {
                Conn.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/books?useUnicode=true&characterEncoding=gbk", Conn.user, Conn.password);
            }
            stmt = Conn.con.createStatement();
            int deleteID = 0;  //存放 id(图书id)
            if(Borrow.scanBookID()) {
                String sql = "delete from " + tableName2 + " where Book_id=" + Borrow.bookID;  //根据id来进行删除
                stmt.executeUpdate(sql);
                stmt.close();
                System.out.println("delete success!");
                return;
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void upDate() { //更新
        Statement stmt;
        try {
            if(Borrow.scanBookID()) {
                System.out.print("请输入你要更新的图书编号:");
                String newID = scanner.next(); //图书编号

                System.out.print("请输入您要更新的书名:");
                String newName = scanner.next(); //新的书名

                System.out.print("请输入您要更新的图书作者:");
                String newAuthor = scanner.next(); //新的性别

                int upInv = 0;  //库存(图书库存)
                while (true) {
                    try {
                        System.out.print("请输入你要更新图书库存:");
                        upInv = Integer.parseInt(scanner.next());
                        break;
                    } catch (Exception e) {
                        System.out.println("你输入的格式有误，请重新输入");
                    }
                }

                stmt = Conn.con.createStatement();
                String sql = "update " + tableName2 +
                        " set Book_id=\'" + newID + "\'," +
                        "Name=\'" + newName +"\'," +
                        "Author=\'" + newAuthor + "\'," +
                        "Inventery=\'" + upInv + "\'" +
                        " where Book_id=\'" + Borrow.bookID + "\'";
                stmt.executeUpdate(sql);
                stmt.close();
                System.out.println("change success!");
                return;
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }



    public static void showStudent() {  //查询
        Statement stmt;
        System.out.print("请输入您要查询的字段(Name、或'*'):");
        String field = scanner.next();
        try {
            stmt = Conn.con.createStatement();
            if(field.equals("Name")) {
                System.out.print("请输入你要查询的图书名:");
                String name = scanner.next();
                ResultSet rs = stmt.executeQuery("select * from " + tableName2 + " where Name=\'" + name + "\'");//创建数据对象
                System.out.println("====查询到的记录====");
                if(rs.next()) {
                    System.out.print(rs.getString(1) + "\t\t\t");
                    System.out.print(rs.getString(2) + " \t\t");
                    System.out.print(rs.getString(3) + "\t\t");
                    System.out.print(rs.getString(4) + "\n");
                }
            } else if(field.equals("*")) {
                String sql = "select " + field + " from " + tableName2;    //要执行的SQL
                ResultSet rs = stmt.executeQuery(sql);//创建数据对象
                System.out.println("图书编号 \t书名 \t\t作者 \t\t库存");
                while (rs.next()) {
                    System.out.print(rs.getString(1) + "\t\t\t");
                    System.out.print(rs.getString(2) + " \t\t");
                    System.out.print(rs.getString(3) + "\t\t");
                    System.out.print(rs.getString(4));
                    System.out.println();
                }
            } else {
                System.out.println("你输入的字段有误！");
            }


            stmt.close();
            return;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
