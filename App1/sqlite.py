#! python

import sqlite3 as lite
import sys


def readImage(image):

    try:
        fin = open(image, "rb")
        img = fin.read()
        return img
        
    except IOError, e:

        print "Error %d: %s" % (e.args[0],e.args[1])
        sys.exit(1)

    finally:
        
        if fin:
            fin.close()


try:
    #Connect to Database
	conn = lite.connect('countries.db')
	print "Countries DB connected"

	#Create a Cursor to access the Database
	c = conn.cursor()

	#Create Table
	c.execute('''DROP TABLE IF EXISTS countries''')

	c.execute('''CREATE TABLE countries(name text PRIMARY KEY, capital text, size text, population text, flag BLOB)''')

	imageName = 'canadaFlag.png'
	data = readImage(imageName)
	binary = lite.Binary(data)
	c.execute("INSERT INTO countries(name,capital,size,population,flag) VALUES (?,?,?,?,?)", ('Canada','Ottawa','3854,085','35,675,834',binary) )
	
	imageName = 'usaFlag.png'
	data = readImage(imageName)
	binary = lite.Binary(data)
	c.execute("INSERT INTO countries(name,capital,size,population,flag) VALUES (?,?,?,?,?)", ('USA','Washington D.C.','3,805,927','320,206,000',binary) )

	imageName = 'mexicoFlag.png'
	data = readImage(imageName)
	binary = lite.Binary(data)
	c.execute("INSERT INTO countries(name,capital,size,population,flag) VALUES (?,?,?,?,?)", ('Mexico','Mexico City','761,606','118,395,054',binary) )

	conn.commit()    
    
except lite.Error, e:
    
    if conn:
        conn.rollback()
        
    print "Error %s:" % e.args[0]
    sys.exit(1)
    
finally:
    
    if conn:
        conn.close()  

