const http = require('http');
const express = require('express');
const path = require('path');
const oracledb = require('oracledb');
const app = express();
const PORT = 3000;

const dbConfig = {user: "ADMIN", password: "cevbet-fejxAd-fajvi6", connectionString: "(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1521)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=g3072397aa48eb9_yt1zdf20cec0f0k6_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))" };

app.use(express.json());
app.use(express.static("express"));

app.get('/api/movies', async (req, res) => {
  let connection;
  try {
      connection = await oracledb.getConnection(dbConfig);
      const result = await connection.execute(`SELECT * FROM Movies`); // Adjust SQL as needed
      res.json(result.rows.map(row => {
        return {
            MOVIEID: row[0],
            MOVIENAME: row[1],
            DIRECTOR: row[2],
            DESCRIPTION: row[3],
            AVERAGERATING: row[4],
            RUNTIME: row[5],
            RELEASEDATE: row[6],
            GENRE: row[7],
            MOVIEFILE: row[8],
            IMAGEFILE: row[9]
        };
      }));
  } catch (err) {
      console.error(err);
      res.status(500).send('Error fetching movies from Oracle DB');
  } finally {
      if (connection) {
          try {
              connection.close();
          } catch (err) {
              console.error(err);
          }
      }
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

