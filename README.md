# Team Diary
---------------

`Team Diary` is a web app to help team using record the team growing up.

The principles are:

- Easily to deploy.
- Easy to integrate with other systems.  
- The contents posted to the system are simple and brief.

See the [TODO list](https://github.com/maomaoliu/team-diary/issues).


To integrate with other system, can use api here:

- To like a team member:
  Method: `GET`
  Url: `http://host/api/users/like?user_name=username`
- To post an event:
  Method: `POST`
  Url: `http://host/api/users/like?user_name=username`
  Content-Type: `application/x-www-form-urlencoded`
  Form Data: `event[message]=message+content`