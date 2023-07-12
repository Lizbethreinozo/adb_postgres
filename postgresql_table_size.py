import psycopg2


if __name__ == "__main__":
    try:
        url = "host='{0}' dbname='{1}' user='{2}' password='{3}'".format('localhost', 'postgres', 'postgres', '12345')


        conn = psycopg2.connect(url)


        cursor = conn.cursor()

        sql = """
    SELECT table_name, pg_size_pretty(pg_total_relation_size(table_name)) AS size
    FROM information_schema.tables
    WHERE table_schema = 'public'
    ORDER BY pg_total_relation_size(table_name) DESC;
"""
        cursor.execute(sql)

        for row in cursor:
              print("\t",row[0],"\t",row[1],"\t",row[2])


        cursor.close()
    except (Exception, psycopg2.DatabaseError) as e:
        print(e)
