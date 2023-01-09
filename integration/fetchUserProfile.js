/* globals request */
module.exports = function fetchUserProfile(accessToken, context, callback) {
  request.get(
    {
      url: "USERINFO_URL",
      headers: {
        Authorization: `Bearer ${accessToken}`,
      },
    },
    (error, response, body) => {
      if (error) {
        return callback(error);
      }

      if (response.statusCode >= 300) {
        return callback(new Error(`Failed status code check for user profile response. Received ${response.statusCode}.`));
      }

      let bodyParsed;
      try {
        bodyParsed = JSON.parse(body);
      } catch (jsonError) {
        return callback(new Error(`Failed JSON parsing for user profile response.`));
      }

      const profile = {
        user_id: bodyParsed.sub,
      };

      return callback(null, profile);
    }
  );
};
