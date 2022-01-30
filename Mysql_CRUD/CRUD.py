"""
@Author: Farzana Shaikh
@Date: 27-01-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 29-01-2022 04:00PM
@Title : Python Program to perform CRUD Operations on MySQL Database With User  Input.
"""

from Logger import logger
import mysql.connector as myconn

       
class Operations:
    """
        Description:
                This class conatins methods for performing CRUD operations on database.
    """

    def __init__(self):
        """
            Description:
                Function is used to initialize the Database Connection.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """
        try:
            #To connect with database.
            self.mydb = myconn.connect(host= "127.0.0.1", user="demo", password= "welcome123", database="school")
            if(self.mydb.is_connected()):
                logger.debug("Successfully Connected To Database.")
                 #cursor object to point the database.
                self.mycursor = self.mydb.cursor()

        except:
            logger.debug("Unable to connect to database")
       

    def displayTable(self):
        """
            Description:
                Function is used to Display Tables in Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """
        sql="select * from Persons"
        try:
            self.mycursor.execute(sql)
            data=self.mycursor.fetchall()
            for x in data:
                logger.debug(x)
            logger.debug("Successfully Displayed")
        except:
            logger.debug("Error occured")
    

    def createTable(self):
        """
            Description:
                Function is used to Create New Table in Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """
        try:
            person="CREATE TABLE Persons (PersonID int,FirstName varchar(255),LastName varchar(255),Phone_no varchar(255),City varchar(255))"
            self.mycursor.execute(person)
            self.mydb.commit()
            logger.debug(self.mycursor.rowcount, "Records Inserted")
            mydata.displayTable()
        except Exception as e:
            logger.debug(e)


    def insertData(self):
        """
            Description:
                Function is used to Insert Data in Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """
        pid=str(input("Enter Person Id:"))
        fname=str(input("Enter your First Name:"))
        lname=str(input("Enter your Last Name:"))
        phone_no=str(input("Enter your Phone number:"))
        city=str(input("Enter your City:"))
    
        sql="INSERT into Persons (PersonID, FirstName, LastName, Phone_no, City) values(%s,%s,%s,%s,%s)"
        val=(pid,fname,lname,phone_no,city)
        try:
            self.mycursor.execute(sql,val)
            self.mydb.commit()
            logger.debug("Successfully Inserted Data")
            mydata.displayTable()
        except Exception as e: 
            logger.debug(e)


    def updateData(self):
        """
            Description:
                Function is used to Update Rows in Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """
        ch=input("Do u have row id?(Y/N)").lower()
        if(ch=='y'):
            pid=input("Enter your row id")
            sql="SELECT * from Persons where PersonID =%s"
            val=(pid,)
            try:
                self.mycursor.execute(sql,val)
                data=self.mycursor.fetchall()
                for x in data:
                    fname=x[1]
                    lname=x[2]
                    phone_no=x[3]
                    city=x[4]
                logger.debug("\n 1.UPDATE First Name\n 2.UPDATE Last Name\n 3.UPDATE Phone_no\n 4.UPDATE City")
                ch=int(input("Enter your choice"))
                if(ch==1):
                    fname=input("Enter your First Name")
                elif(ch==2):
                    lname=input("Enter your Last Name")
                elif(ch==3):
                    phone_no=input("Enter your Phone_no")
                elif(ch==4):
                    city=input("Enter your City")
                else:
                    logger.debug("Wrong Input")
                
                sql="UPDATE Persons set FirstName=%s,LastName=%s,Phone_no=%s, City=%s where PersonID=%s"
                val=(fname,lname,phone_no,city,pid)
                try:
                    self.mycursor.execute(sql,val)
                    self.mydb.commit()
                    logger.debug("Successfully Updated Data")
                    mydata.displayTable()
                
                except Exception as e:
                    logger.debug(e)
                
            except Exception as e:
                logger.debug(e)


    def deleteData(self):
        """
            Description:
                Function is used to Delete Rows from Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """
        ch=str(input("Do u have row id?(Y/N)")).lower()
        if(ch=='y'):
            pid=input("Enter your row id")
            sql="DELETE from Persons where PersonID=%s"
            val=(pid,)
            try:
                self.myself.mycursor.execute(sql,val)
                self.mydb.commit()
                logger.debug("Successfully Deleted Data")
                mydata.displayTable()
            except:
                logger.error("Error")
            else:
                logger.debug("Go to read section and get your id")
    

def menu():
    """
        Description:
            This Function is a main function to call other functions.
        Parameter:
            No parameters required.
        Return:
            Returns nothing.
    """
  
    choice=""
    while True:
        choice = int(input("Enter The Option To Perform the corresponding action.\n 1. To Display Tables\n 2. To Create Table\n 3. To Insert Data\n 4. To Update Data \n 5. To Delete Data \n 7. To Delete Table\n 8. To Quit Enter 0\n"))
    
        if choice == 0:
            break
        
        elif(choice== 1):
            mydata.displayTable()
                
        elif(choice== 2):
            logger.debug("New Table is:\n")
            mydata.createTable() 
            
        elif(choice== 3):
            mydata.insertData()       
            
        elif(choice== 4):
            mydata.updateData()
            logger.debug("Updated Successfully")
            
        elif(choice== 5):
            mydata.deleteData()

        else:
            logger.debug("Incorrect choice, please enter the correct option again")


if __name__ == "__main__":
    mydata = Operations()
    menu()            

    