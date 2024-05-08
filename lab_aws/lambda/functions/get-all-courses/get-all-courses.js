const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB({
  region: "us-east-1",
  apiVersion: "2012-08-10"
});

exports.handler = (event, context, callback) => {
  const params = {
    TableName: "courses-3"
  };
  dynamodb.scan(params, (err, data) => {
    if (err) {
      console.log(err);
      callback(err);
    } else {
      const courses = data.Items.map(item => {
        return {
          id: item.id ? item.id.S : null,
          title: item.title ? item.title.S : null,
          watchHref: item.watchHref ? item.watchHref.S : null,
          authorId: item.authorId ? item.authorId.S : null,
          length: item.length ? item.length.S : null,
          category: item.category ? item.category.S : null
        };
      });
      callback(null, courses);
    }
  });
}
