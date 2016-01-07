# Advanced Cloud Foundry CLI usage

###What you are going to learn:

1. CF_TRACE
2. CLI's plugins
3. Using `cf curl` to send commands to Cloud Foundry.
4. Configure CLI's default values

### CF_TRACE

At the moment of deploying applications or sending commands to Cloud Foundry, sometimes you will need to take a look on what is going on with your requests.
The CLI provides a mode in which all the requests are shown as output. Basically, a **very** verbose mode.

To try this mode, add the `CF_TRACE=true` environment value to the command line:

Try it!

```
CF_TRACE=true cf orgs
```

Output should be something like:

```
$ CF_TRACE=true cf orgs

VERSION:
6.10.0-b78bf10

Getting orgs as my-user...


REQUEST: [2016-01-07T11:08:15-03:00]
GET /v2/organizations HTTP/1.1
Host: api.52.91.3.128.xip.io
Accept: application/json
Authorization: [PRIVATE DATA HIDDEN]
Content-Type: application/json
User-Agent: go-cli 6.10.0-b78bf10 / linux



RESPONSE: [2016-01-07T11:08:17-03:00]
HTTP/1.1 401 Unauthorized
Content-Length: 97
Content-Type: application/json;charset=utf-8
Date: Thu, 07 Jan 2016 14:08:17 GMT
Server: nginx
X-Cf-Requestid: 5aa96ca8-5cf3-492f-6620-90fa0ee343ed
X-Content-Type-Options: nosniff
X-Vcap-Request-Id: cfe546e0-c2ae-44b4-4ccd-30012dbf7a05::12d066c8-7f4e-426f-8c78-2dd48b13b21e

{
  "code": 1000,
  "description": "Invalid Auth Token",
  "error_code": "CF-InvalidAuthToken"
}


REQUEST: [2016-01-07T11:08:17-03:00]
POST /oauth/token HTTP/1.1
Host: login.52.91.3.128.xip.io
Accept: application/json
Authorization: [PRIVATE DATA HIDDEN]
Content-Type: application/x-www-form-urlencoded
User-Agent: go-cli 6.10.0-b78bf10 / linux

grant_type=refresh_token&refresh_token=eyJhbGciOiJSUzI1NiJ9.eyJqdGkiOiJlM2RjOTE4Yi0wNTFlLTQyNzYtOGUzNy04ZDc3NTY3YTYxZGYtciIsInN1YiI6IjFjMDYwNmJhLTgwNDYtNGVjNi05N2VkLWYzOTc0YTRhYmE4NyIsInNjb3BlIjpbIm9wZW5pZCIsInVhYS51c2VyIiwiY2xvdWRfY29udHJvbGxlci5yZWFkIiwicGFzc3dvcmQud3JpdGUiLCJjbG91ZF9jb250cm9sbGVyLndyaXRlIl0sImlhdCI6MTQ1MjAxMTY2MSwiZXhwIjoxNDU0NjAzNjYxLCJjaWQiOiJjZiIsImNsaWVudF9pZCI6ImNmIiwiaXNzIjoiaHR0cHM6Ly91YWEuNTIuOTEuMy4xMjgueGlwLmlvL29hdXRoL3Rva2VuIiwiemlkIjoidWFhIiwiZ3JhbnRfdHlwZSI6InBhc3N3b3JkIiwidXNlcl9uYW1lIjoibXktdXNlciIsIm9yaWdpbiI6InVhYSIsInVzZXJfaWQiOiIxYzA2MDZiYS04MDQ2LTRlYzYtOTdlZC1mMzk3NGE0YWJhODciLCJyZXZfc2lnIjoiMmI1ZjRiNWYiLCJhdWQiOlsiY2YiLCJvcGVuaWQiLCJ1YWEiLCJjbG91ZF9jb250cm9sbGVyIiwicGFzc3dvcmQiXX0.TFyCzZ11e0pblTkGNsYpqpvdR6xrbhf3CwwIGSIbsz7k7jsRF_QqJjhziCMNgkTrDRkFxKOvp9jNI10mxrmrp8VOL_FxwybYml2HfycnPuX7t_YjFvGsZKNde6gOkdu2rIXP-Z8AVxV7Pf5KZxt7haGDumSBqHfSkMw5nq8ufYU&scope=

RESPONSE: [2016-01-07T11:08:19-03:00]
HTTP/1.1 200 OK
Content-Length: 1972
Cache-Control: no-cache, no-store, max-age=0, must-revalidate
Cache-Control: no-store
Content-Type: application/json;charset=UTF-8
Date: Thu, 07 Jan 2016 14:08:19 GMT
Expires: 0
Pragma: no-cache
Pragma: no-cache
Server: Apache-Coyote/1.1
Strict-Transport-Security: max-age=31536000 ; includeSubDomains
X-Cf-Requestid: e29ea71a-dc0d-4744-6f24-55332b1b863a
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-Xss-Protection: 1; mode=block

{"access_token":"[PRIVATE DATA HIDDEN]","token_type":"bearer","refresh_token":"[PRIVATE DATA HIDDEN]","expires_in":599,"scope":"cloud_controller.read password.write cloud_controller.write openid uaa.user","jti":"ba296c32-d633-4b3c-a3d7-8552fedc0c0b"}

REQUEST: [2016-01-07T11:08:19-03:00]
GET /v2/organizations HTTP/1.1
Host: api.52.91.3.128.xip.io
Accept: application/json
Authorization: [PRIVATE DATA HIDDEN]
Content-Type: application/json
User-Agent: go-cli 6.10.0-b78bf10 / linux



RESPONSE: [2016-01-07T11:08:20-03:00]
HTTP/1.1 200 OK
Content-Length: 1500
Content-Type: application/json;charset=utf-8
Date: Thu, 07 Jan 2016 14:08:20 GMT
Server: nginx
X-Cf-Requestid: ce8b7917-1a4b-41cd-6d82-cb47835f1de8
X-Content-Type-Options: nosniff
X-Vcap-Request-Id: 27a5c3f0-06ad-4ef9-4c97-53cee23e487d::68147af0-1f31-40df-98d4-0390dda59959

{
  "total_results": 1,
  "total_pages": 1,
  "prev_url": null,
  "next_url": null,
  "resources": [
    {
      "metadata": {
        "guid": "a0d926c5-168f-493b-b2c3-029bbe5a6df8",
        "url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8",
        "created_at": "2016-01-05T16:34:09Z",
        "updated_at": null
      },
      "entity": {
        "name": "my-org",
        "billing_enabled": false,
        "quota_definition_guid": "e388b990-8182-49c6-ae4e-47a05d6f7c56",
        "status": "active",
        "quota_definition_url": "/v2/quota_definitions/e388b990-8182-49c6-ae4e-47a05d6f7c56",
        "spaces_url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8/spaces",
        "domains_url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8/domains",
        "private_domains_url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8/private_domains",
        "users_url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8/users",
        "managers_url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8/managers",
        "billing_managers_url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8/billing_managers",
        "auditors_url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8/auditors",
        "app_events_url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8/app_events",
        "space_quota_definitions_url": "/v2/organizations/a0d926c5-168f-493b-b2c3-029bbe5a6df8/space_quota_definitions"
      }
    }
  ]
}
name   
my-org 
```

This "ultra verbose mode" is useful to diagnose issues with any command you might send to Cloud Foundry.

