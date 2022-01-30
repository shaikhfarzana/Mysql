"""
@Author: Farzana Shaikh
@Date: 27-01-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 29-01-2022 04:00PM
@Title : Python Program to perform CRUD Operations on MySQL Database.
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
                logger.debug("Successfully Connected")
                 #Cursor object to point the database.
                self.mycursor = self.mydb.cursor()
        except:
            logger.debug("Unable to connect")
       
        

    def displayTable(self):
        """
            Description:
                Function is used to Display Tables in Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """
        self.mycursor.execute("SHOW TABLES")
        for table in self.mycursor:
             logger.debug(table)

    
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
            query ="CREATE TABLE Persons (PersonID int,FirstName varchar(255),LastName varchar(255),Phone_no varchar(255),City varchar(255))"
            self.mycursor = self.mydb.cursor()
            self.mycursor.execute(query)
            self.mydb.commit()
            logger.debug(self.mycursor.rowcount, "Records Inserted")
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
        try:
            student="INSERT INTO students (student_id,first_name,last_name,standard,section) VALUES (07,'Veena','Desai',8,'A')"
            self.mycursor = self.mydb.cursor()
            self.mycursor.execute(student)
            self.mydb.commit()
            logger.debug(self.mycursor.rowcount, "Records Inserted")
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
        try:
            sql = "UPDATE students SET last_name = 'Ray' WHERE student_id = 3"
            self.mycursor = self.mydb.cursor()
            self.mycursor.execute(sql)
            self.mydb.commit()
            logger.debug(self.mycursor.rowcount, "record(s) Affected") 
        except Exception as e:
            logger.debug(e)
    

    def selectData(self):
        """
            Description:
                Function is used to Select Rows from Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """

        query="SELECT * FROM Persons"
        self.mycursor = self.mydb.cursor()
        self.mycursor.execute(query)
        
        myresult = self.mycursor.fetchall()
        for x in myresult:
            logger.debug(x)


    def deleteData(self):
        """
            Description:
                Function is used to Delete Rows from Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """

        try:
            query = "DELETE FROM students WHERE student_id=7"
            self.mycursor = self.mydb.cursor()
            self.mycursor.execute(query)
            logger.debug(self.mycursor.rowcount, "record(s) Deleted")
        except Exception as e:
            logger.debug(e)

    
    def deleteAllData(self):
        """
            Description:
                Function is used to Delete Table from Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """
        try:
            self.mycursor.execute("truncate table Persons;")
            self.mydb.commit()
        except Exception as e:
            logger.error(e)


    def alterData(self):
        """
            Description:
                Function is used to Alter Data from Database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """

        query="ALTER TABLE Persons ADD Address VARCHAR(255) AFTER City"
        self.mycursor = self.mydb.cursor()
        self.mycursor.execute(query)
        
        myresult = self.mycursor.fetchall()
        for x in myresult:
            logger.debug(x)

    def renameColumn(self):
        """
            Description:
                Function is used to Rename Column/Attribute/Field of database.
            Parameter:
                No parameters required.
            Return:
                Returns nothing.
        """

        query="ALTER TABLE Persons RENAME COLUMN FirstName To First_Name"
        self.mycursor = self.mydb.cursor()
        self.mycursor.execute(query)
        
        myresult = self.mycursor.fetchall()
        for x in myresult:
            logger.debug(x)



def menu():
    """
        Description:
            This Function is a main function to call other functions.
        Parameter:
            No parameters required.
        Return:
            Returns nothing.
    """
    mydata = Operations()
    choice=""
    while True:
        choice = int(input("Enter The Option To Perform the corresponding action.\n 1. To Display Tables\n 2. To Create Table\n 3. To Insert Data\n 4. To Update Data \n 5. To Select Data \n 6. To Delete Student Id \n 7. To Delete Table\n 8. To Alter Table\n 9. To Rename Attribute\n 10. To Quit Enter 0\n"))
    
        if choice == 0:
            break
        
        elif(choice== 1):
            logger.debug("Tables are:\n")
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
            mydata.selectData()

        elif(choice== 6):
            mydata.deleteData()
            logger.debug( "Removed Successfully")

        elif(choice== 7):
            mydata.deleteAllData()
            logger.debug("Removed Successfully")  

        elif(choice== 8):
            mydata.alterData()
            logger.debug("Altered Successfully")  
        
        elif(choice== 9):
            mydata.renameColumn()
            logger.debug("Renamed Successfully")  
 
        else:
          logger.debug("Incorrect choice, please enter the correct option again")


if __name__ == "__main__":
    menu()
 