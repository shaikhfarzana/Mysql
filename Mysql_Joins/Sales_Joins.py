"""
@Author: Farzana Shaikh
@Date: 29-01-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 31-01-2022 04:00PM
@Title : Python Program to perform Joins Operations on MySQL Database.
"""


from tkinter import Menu
from Logger import logger
import mysql.connector as myconn
from decouple import config

API_HOST = config('HOST')
API_USERNAME = config('USER_NAME')
API_KEY = config('KEY')
API_DATABASE = config('DATABASE')


class Operations:
    """
        Description:
                This class conatins methods for performing Join operations on database.
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
            self.mydb = myconn.connect(host= API_HOST, user= API_USERNAME, password= API_KEY, database= API_DATABASE)
            if(self.mydb.is_connected()):
                logger.debug("Successfully Connected")
                #Cursor object to point the database.
                self.mycursor = self.mydb.cursor()
        except:
            logger.debug("Unable to connect")
        


    def innerJoin(self):
        """
            Description:
                Function is used to perform Inner Join on database table.
            Parameter:
                Self as a parameter required.
            Return:
                Returns nothing.
        """

        query = "SELECT a.cust_name AS Customer_Name, a.city, b.name AS Salesman, b.commission FROM customer a INNER JOIN salesman b ON a.salesman_id=b.salesman_id"
        
        self.mycursor = self.mydb.cursor()
        self.mycursor.execute(query)
        
        myresult = self.mycursor.fetchall()
        for x in myresult:
            logger.debug(x)

    def leftJoin(self):
        """
            Description:
                Function is used to perform Left Join on database table.
            Parameter:
                Self as a parameter required.
            Return:
                Returns nothing.
        """

        query = "SELECT a.cust_name,a.city,a.grade, b.name AS Salesman,b.city FROM customer a LEFT JOIN salesman b ON a.salesman_id=b.salesman_id order by a.customer_id"   
        self.mycursor = self.mydb.cursor()
        self.mycursor.execute(query)
        
        myresult = self.mycursor.fetchall()
        for x in myresult:
            logger.debug(x)

    def leftOuterJoin(self):
        """
            Description:
                Function is used to \perform Left Outer Join on database table.
            Parameter:
                Self as a parameter required.
            Return:
                Returns nothing.
        """

        query = "SELECT a.cust_name,a.city,a.grade, b.name AS Salesman, b.city FROM customer a LEFT OUTER JOIN salesman b ON a.salesman_id=b.salesman_id WHERE a.grade<300 ORDER BY a.customer_id;"
        
        self.mycursor = self.mydb.cursor()
        self.mycursor.execute(query)
        
        myresult = self.mycursor.fetchall()
        for x in myresult:
            logger.debug(x)

    def rightOuterJoin(self):
        """
            Description:
                Function is used to perform Right Outer Join on database table.
            Parameter:
                Self as a parameter required.
            Return:
                Returns nothing.
        """

        query = "SELECT a.cust_name,a.city,a.grade, b.name AS Salesman, b.city FROM customer a RIGHT OUTER JOIN salesman b ON b.salesman_id=a.salesman_id ORDER BY b.salesman_id"     
        
        self.mycursor = self.mydb.cursor()
        self.mycursor.execute(query)
        
        myresult = self.mycursor.fetchall()
        for x in myresult:
            logger.debug(x)

    def naturalJoin(self):
        """
            Description:
                Function is used to perform Natural Join on database table..
            Parameter:
                Self as a parameter required.
            Return:
                Returns nothing.
        """

        query = "SELECT * FROM orders NATURAL JOIN customer NATURAL JOIN salesman"

        self.mycursor = self.mydb.cursor()
        self.mycursor.execute(query)
        
        myresult = self.mycursor.fetchall()
        for x in myresult:
            logger.debug(x)

    def crossJoin(self):
        """
            Description:
                Function is used to perform Cross Join on database table.
            Parameter:
                Self as a parameter required.
            Return:
                Returns nothing.
        """

        query = "SELECT * FROM salesman a CROSS JOIN customer b"
          
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
            No parameter required.
        Return:
            Returns nothing.
    """
    choice=""
    while True:
        choice = int(input("Enter The Option To Perform the Join Operations.\n 1. Inner Join\n 2. Left Join\n 3. Left Outer Join\n 4. Right Outer Join\n 5. Natural Join\n 6. Cross Join\n 7. To Quit Enter 0\n"))
    
        if choice == 0:
            break
        
        elif(choice== 1):
            logger.debug("INNER JOIN: ")
            mydata.innerJoin()
                
        elif(choice== 2):
            logger.debug("LEFT JOIN: ")
            mydata.leftJoin()
            
        elif(choice== 3):
            logger.debug("LEFT OUTER JOIN")
            mydata.leftOuterJoin()      
            
        elif(choice== 4):
            logger.debug("RIGHT OUTER JOIN")
            mydata.rightOuterJoin()
            
        elif(choice== 5):
            logger.debug("NATURAL JOIN ")
            mydata.naturalJoin()
        
        elif(choice== 6):
            logger.debug("CROSS JOIN ")
            mydata.crossJoin()
        
        else:
            logger.debug("Incorrect choice, please enter the correct option again")
        
    
if __name__ == "__main__":
    mydata = Operations()
    menu()
 