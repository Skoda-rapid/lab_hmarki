const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB({
  region: "us-east-1",
  apiVersion: "2012-08-10"
});

exports.handler = (event, context, callback) => {
    const id = event.title.replaceAll(" ", "-").toLowerCase();
    const params = {
        Item: {
        id: {
            S: id
        },
        title: {
            S: event.title
        },
        watchHref: {
            S: `http://www.pluralsight.com/courses/${id}`
        },
        authorId: {
            S: event.authorId
        },
        length: {
            S: event.length
        },
        category: {
            S: event.category
        }
        },
        TableName: "courses-3"
    };
    dynamodb.putItem(params, (err, data) => {
        if (err) {
        console.log(err);
        callback(err);
        } else {
            callback(null, {
                id: params.Item.id.S,
                title: params.Item.title.S,
                watchHref: params.Item.watchHref.S,
                authorId: params.Item.authorId.S,
                length: params.Item.length.S,
                category: params.Item.category.S
            });
        }
    });
}