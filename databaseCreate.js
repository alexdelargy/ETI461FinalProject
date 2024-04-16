const oracledb = require('oracledb');
const fs = require('fs');
const path = require('path');


async function executeSQLFile(filePath)
{
  let connection;
  try {
    
    const sqlFullText = fs.readFileSync(filePath, 'utf8');
    const sqlStatements = sqlFullText.split(';').map(statement => statement.trim()).filter(statement => statement.length);

    connection = await oracledb.getConnection({ user: "ADMIN", password: "cevbet-fejxAd-fajvi6", connectionString: "(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1521)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=g3072397aa48eb9_yt1zdf20cec0f0k6_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))" });
    
    for (let sql of sqlStatements) {
        await connection.execute(sql);
    }    
    await connection.commit();

   
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
const sqlFilePath = path.join(__dirname, 'FinalCreateTable.sql');
executeSQLFile(sqlFilePath);