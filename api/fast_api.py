from fastapi import FastAPI
import mysql.connector
from mysql.connector import Error
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)

def connect_to_database():
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="admin",
            passwd="Admin123!",
            database="knjige"
        )
        if conn.is_connected():
            return conn
    except Error as e:
        print("Error connecting to MySQL:", e)
        return None


@app.get("/books/")
def get_books():
    books = []
    conn = connect_to_database()

    if conn:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT naziv_knjige, zanr FROM knjiga")
        books_db = cursor.fetchall()
        for book in books_db:
            yield book
            print(book)

        # for book in books_db:
        #     author_id = book["author_id"]
        #     cursor.execute("SELECT author_name, birth_date FROM author WHERE author_id = %s", (author_id,))
        #     author = cursor.fetchone()
        #     if author:
        #         books.append({
        #             "book_id": book["book_id"],
        #             "book_name": book["book_name"],
        #             "author": {
        #                 "author_name": author["author_name"],
        #                 "birth_date": author["birth_date"],
        #             }
        #         })

        cursor.close()
        conn.close()

    return books
