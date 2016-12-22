## Implement service broker API methods

1. Implement the the **services** that returns the list of provided services
  ```file=~/go/src/github.com/$USER/cf-postgresql-broker/main.go
  func (h Handler) Services(context context.Context) []brokerapi.Service {
    servicesJSON := `[{
      "id": "service-id",
      "name": "postgresql",
      "description": "DBaaS",
      "bindable": true,
      "plan_updateable": false,
      "plans": [{
        "id": "plan-id",
        "name": "basic",
        "description": "Shared plan"
      }]
    }]`
    services := make([]brokerapi.Service, 0)

    // Parse services list
    if err := json.Unmarshal([]byte(servicesJSON), &services); err != nil {
      panic(err)
    }
    return services
  }
  ```

1. Implement the **provision** method that creates a DB using instance ID.
  ```file=~/go/src/github.com/$USER/cf-postgresql-broker/main.go
  func (h Handler) Provision(context context.Context, instanceID string, _ brokerapi.ProvisionDetails, _ bool) (brokerapi.ProvisionedServiceSpec, error) {
    dbname, err := h.Db.CreateDB(instanceID)

    if err != nil {
      return brokerapi.ProvisionedServiceSpec{}, err
    }

    return brokerapi.ProvisionedServiceSpec{
      IsAsync:      false,
      DashboardURL: dbname,
    }, nil
  }
  ```

1. Implement the **deprovision** method. It simply drops a DB.
  ```file=~/go/src/github.com/$USER/cf-postgresql-broker/main.go
  func (h Handler) Deprovision(context context.Context, instanceID string, _ brokerapi.DeprovisionDetails, _ bool) (brokerapi.DeprovisionServiceSpec, error) {
    if err := h.Db.DropDB(instanceID); err != nil {
      return brokerapi.DeprovisionServiceSpec{}, err
    }

    return brokerapi.DeprovisionServiceSpec{
      IsAsync:      false,
    }, nil
  }
  ```

1. Implement the **bind** method. It is needed to create DB users for bound application.
  ```file=~/go/src/github.com/$USER/cf-postgresql-broker/main.go
  func (h Handler) Bind(context context.Context, instanceID, bindingID string, _ brokerapi.BindDetails) (brokerapi.Binding, error) {
    creds, err := h.Db.CreateUser(instanceID, bindingID)

    if err != nil {
      return brokerapi.Binding{}, err
    }

    return brokerapi.Binding{
      Credentials: creds,
    }, nil
  }
  ```

1. Implement the **unbind** method. It drops users and all their privileges for a service.
  ```file=~/go/src/github.com/$USER/cf-postgresql-broker/main.go
  func (h Handler) Unbind(context context.Context, instanceID, bindingID string, _ brokerapi.UnbindDetails) error {
    if err := h.Db.DropUser(instanceID, bindingID); err != nil {
      return err
    }

    return nil
  }
  ```

1. Implement the rest methods that we won't support but still they are required.
  ```file=~/go/src/github.com/$USER/cf-postgresql-broker/main.go
  func (h Handler) LastOperation(context context.Context, instanceID string, operationData string) (brokerapi.LastOperation, error) {
    return brokerapi.LastOperation{}, errors.New("Not supported") 
  }

  func (h Handler) Update(context context.Context, instanceID string, _ brokerapi.UpdateDetails, _ bool) (brokerapi.UpdateServiceSpec, error) {
    return brokerapi.UpdateServiceSpec{}, errors.New("Not supported")
  }
  ```

For more information about service broker API go to [the official documentation page](http://docs.cloudfoundry.org/services/api.html)
