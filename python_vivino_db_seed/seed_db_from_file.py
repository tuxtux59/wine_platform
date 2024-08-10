import json
import psycopg2
from datetime import datetime
import os
import sys

# Usage python seed_db_from_file.py  malbec.json malbec 1234xeab db_name db_user db_pwd

print(sys.argv[1:])
filename = sys.argv[1]
grape_variety = sys.argv[2]
expert_id = sys.argv[3]
db_name = sys.argv[4]
db_user = sys.argv[5]
db_pwd = sys.argv[6]


conn = psycopg2.connect(f'dbname=wine_platform_development user=me password={db_pwd}')
cur = conn.cursor()


script_dir = os.path.dirname(os.path.abspath(__file__))
file_path = os.path.join(script_dir, filename)

with open(file_path) as f:
  data = json.load(f)

for item in data:
  name = item["name"]
  thumb = item["thumb"]
  sale_url = item["link"]
  score = item["average_rating"]
  latest_price = item["price"] if item["price"] else 4.99
  now = datetime.now()


  cur.execute("""
    INSERT INTO bottles (name, thumb, sale_url, grape_variety, created_at, updated_at)
    VALUES (%s, %s, %s, %s, %s, %s)
    RETURNING id;
  """, (name, thumb, sale_url, grape_variety, now, now))

  print(type(cur))
  for row in cur:
    print('row')
    bottle_id = row[0]

  print(f'Bottle named {name} created')

  cur.execute("""
    INSERT INTO tasting_notes (bottle_id, expert_id, score, created_at, updated_at)
    VALUES (%s, %s, %s, %s, %s);
  """, (bottle_id, expert_id, score, now, now))

  print(f'Related {score} note created')

  cur.execute("""
    INSERT INTO price_histories (bottle_id, price, recorded_at, created_at, updated_at)
    VALUES (%s, %s, %s, %s, %s);
  """, (bottle_id, latest_price, now, now, now))

  print(f'Related {latest_price} price history created')

conn.commit()

cur.close()
conn.close()