## Implement service broker API methods

1. Implement the the **services** that returns the list of provided services
  ```go
  func (h Handler) Services() []brokerapi.Service {
    return h.services
  }
  ```

1. Implement the **provision** method that creates a DB using instance ID.
  ```go
  func (h Handler) Provision(instanceID string, _ brokerapi.ProvisionDetails, _ bool) (brokerapi.ProvisionedServiceSpec, error) {
    dbname, err := h.CreateDB(instanceID)

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
  ```go
  func (h Handler) Deprovision(instanceID string, _ brokerapi.DeprovisionDetails, _ bool) (brokerapi.IsAsync, error) {
    if err := h.DropDB(instanceID); err != nil {
      return false, err
    }

    return false, nil
  }
  ```

1. Implement the **bind** method. It is needed to create DB users for bound application.
  ```go
  func (h Handler) Bind(instanceID, bindingID string, _ brokerapi.BindDetails) (brokerapi.Binding, error) {
    creds, err := h.CreateUser(instanceID, bindingID)

    if err != nil {
      return brokerapi.Binding{}, err
    }

    return brokerapi.Binding{
      Credentials: creds,
    }, nil
  }
  ```

1. Implement the **unbind** method. It drops users and all their privileges for a service.
  ```go
  func (c Handler) Unbind(instanceID, bindingID string, _ brokerapi.UnbindDetails) error {
    if err := c.DropUser(instanceID, bindingID); err != nil {
      return err
    }

    return nil
  }
  ```

1. Implement the rest methods that we won't support but still they are required.
  ```go
  func (Handler) LastOperation(instanceID string) (brokerapi.LastOperation, error) {
    return brokerapi.LastOperation{}, ErrAsyncNotSupported
  }

  func (Handler) Update(instanceID string, _ brokerapi.UpdateDetails, _ bool) (brokerapi.IsAsync, error) {
    return false, ErrUpdatingNotSupported
  }
  ```

For more information about service broker API go to [the official documentation page](http://docs.cloudfoundry.org/services/api.html)
