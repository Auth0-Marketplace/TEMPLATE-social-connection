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

      if (response.statusCode !== 200) {
        return callback(new Error(body));
      }

      let bodyParsed;
      try {
        bodyParsed = JSON.parse(body);
      } catch (jsonError) {
        return callback(new Error(body));
      }

      const profile = {
        user_id: bodyParsed.sub,
      };

      return callback(null, profile);
    }
  );
};
