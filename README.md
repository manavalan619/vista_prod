# README

## REST API

### Environment Variables

```
CLIENT_URL - the URI for the client app (localhost:3000 or some.domain.online)
```


### Authentication

Every `User` and `StaffMember` record has `authentication_token`. We use that to authenticate users and staff members (including branch managers and admins).
To send the authentication token we use HTTP headers:

    Authorization: Token token=UT9D9JxUPzCyTd3n8RCw1w6A

where `UT9D9JxUPzCyTd3n8RCw1w6A` is an example `authentication_token`.

Once the `authentication_token` is correct we get `200` as HTTP response status, if not, then `401`.

    $ curl -v -X GET -H 'Authorization: Token token=UT9D9JxUPzCyTd3n8RCw1w6A' http://localhost:3000/api/v1/members

Authenticated user will be hereafter called `current_user`.


demo done com
