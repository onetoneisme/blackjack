#### Viewing variables

To view the environmental variables available to your application, use:

```sh
cf env my-app
```

The output should be similart to this:

```
$ cf env my-app
Getting env variables for app my-app in org my-org / space my-first-space as my-user...
OK

System-Provided:


{
 "VCAP_APPLICATION": {
  "application_id": "6d6911ed-ec44-40ca-92fa-14d14798686b",
  "application_name": "my-app",
  "application_uris": [
   "my-app.{{echo $CF_DOMAIN}}.xip.io"
  ],
  "application_version": "a372ae9a-c3ec-4201-a1bb-30ea45b0ad26",
  "limits": {
   "disk": 1024,
   "fds": 16384,
   "mem": 64
  },
  "name": "my-app",
  "space_id": "67622917-e943-47fb-8c06-f12ae5694327",
  "space_name": "my-first-space",
  "uris": [
   "my-app.{{echo $CF_DOMAIN}}.xip.io"
  ],
  "users": null,
  "version": "a372ae9a-c3ec-4201-a1bb-30ea45b0ad26"
 }
}

No user-defined env variables have been set

No running env variables have been set

No staging env variables have been set
```
