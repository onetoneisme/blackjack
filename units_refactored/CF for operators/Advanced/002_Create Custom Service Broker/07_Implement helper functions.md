## Implement helper functions

1. The **appName** function determines the application name from environment or returns a default value
  ```
  func appName(envJSON string, defaultName string) string {
    env := struct {
      ApplicationName string `json:"application_name"`
    }{}

    if envJSON == "" {
      goto DEFAULT
    }

    if err := json.Unmarshal([]byte(envJSON), &env); err != nil {
      panic(err)
    }

    if env.ApplicationName == "" {
      goto DEFAULT
    }

    return env.ApplicationName

  DEFAULT:
    return defaultName
  }
  ```

1. The **newHandler** function is an important one. It creates a handler instance, connects it to the database and parses json services that our broker provides.
  ```
  func newHandler(source string, servicesJSON string, GUID string) (*Handler, error) {
    conn, err := pgp.New(source)

    if err != nil {
      return nil, err
    }

    services := make([]brokerapi.Service, 0)

    // Parse services list
    if err := json.Unmarshal([]byte(servicesJSON), &services); err != nil {
      return nil, err
    }

    replace := func(str string) string {
      return strings.Replace(str, "{GUID}", GUID, 1)
    }

    // Replace GUID with runtime value
    for i := 0; i < len(services); i++ {
      services[i].ID = replace(services[i].ID)

      for j := 0; j < len(services[i].Plans); j++ {
        services[i].Plans[j].ID = replace(services[i].Plans[j].ID)
      }
    }

    return &Handler{conn, services}, nil
  }
  ```
