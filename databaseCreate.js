const oracledb = require('oracledb');
const fs = require('fs');
const path = require('path');


async function executeSQLFile(filePath)
{
  let connection;
  try {
    // Use the connection string copied from the cloud console
    // and stored in connstring.txt file from Step 2 of this tutorial
    connection = await oracledb.getConnection({ user: "ADMIN", password: "cevbet-fejxAd-fajvi6", connectionString: "(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1521)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=g3072397aa48eb9_yt1zdf20cec0f0k6_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))" });
    
    // Create a table
    await connection.execute(`create table nodetab (id number, data varchar2(20))`);
    
    // Insert some rows
    const sql = `INSERT INTO nodetab VALUES (:1, :2)`;
    const binds = [ [1, "First" ], [2, "Second" ], [3, "Third" ], [4, "Fourth" ], [5, "Fifth" ], [6, "Sixth" ], [7, "Seventh" ] ];
    await connection.executeMany(sql, binds);
    connection.commit(); // uncomment to make data persistent
    
    // Now query the rows back
    const result = await connection.execute(`SELECT * FROM nodetab`);
    console.dir(result.rows, { depth: null });
  } catch (err) {
    console.error(err);
  } finally {
    if (connection)
      {
        try {
          await connection.close();
        } catch (err) {
          console.error(err);
      }
    }
  }
}
executeSQLFile('FinalCreateTable.sql');