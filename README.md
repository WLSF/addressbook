[firebase-url]: https://firebase.com
[rfc-http-url]: https://www.ietf.org/rfc/rfc2616.txt
[base-url]: https://strvaddressbook.herokuapp.com/

# Backend Test Project - Addressbook

## Project description

This is a simple AddressBook backend API created for the STRV applyment.

When creating a new User, it needs the following params: **[name, email, password, password_confirmation, organization_id]**

*organization_id* can be even an Integer value or an Array of Integers

Once logged-in the User can create, update and delete Contacts.

### Bonus task

- The API was made using versioning concepts and RESTful principles.
- The tests were made using libraries that make it very easy to write and read.
- The Infrastructure was planned to be something scalable using Terraform, Kubernetes, some of the CI tool, to manage deployment of code and Infrastructure, unfortunately AWS and Heroku free versions are very limited.
- This repository contains **master** and **development** branches, to deploy a new version, just use *git push* into master.

### 🔥 Security

The user has been created with the rails authentication password_digest and has_secure_password methods.

This project uses JWT as token authentication

and:
```
authority
rolify
```
for authorization

This Application uses the Heroku SSL certification, to protect the requests data.

### 🔥 Testability

The tests were created using:
```
RSpec-rails
factory_girl_rails
faker
shoulda-matchers
```

### API structure and usability

The RESTful API contains the following endpoints:

```
(POST)    https://strvaddressbook.herokuapp.com/api/v1/users - Register new User

(POST)    https://strvaddressbook.herokuapp.com/session - Sign-in
(DELETE)  https://strvaddressbook.herokuapp.com/session - Sign-out


[These endpoints are reachable for every authenticated user]
(POST)    https://strvaddressbook.herokuapp.com/api/v1/contacts - Create new Contact
(PUT)     https://strvaddressbook.herokuapp.com/api/v1/contacts/:id - Edit an existing Contact
(DELETE)  https://strvaddressbook.herokuapp.com/api/v1/contacts/:id - Delete an existing Contact
[end]

[These endpoints are reachable only for an authenticated admin]
(GET)     https://strvaddressbook.herokuapp.com/api/v1/organizations - List all Organizations
(POST)    https://strvaddressbook.herokuapp.com/api/v1/organizations - Create new Organization
(GET)     https://strvaddressbook.herokuapp.com/api/v1/organizations/:id - Retrieves an Organization by id
(PUT)     https://strvaddressbook.herokuapp.com/api/v1/organizations/:id - Edit an existing Organization
(DELETE)  https://strvaddressbook.herokuapp.com/api/v1/organizations/:id - Delete an existing Organization
(GET)     https://strvaddressbook.herokuapp.com/api/v1/organizations/:id/addressbook - List all Contacts located into the Organization addressbook
[end]
```

How do you structure API endpoints? Do you follow REST principles? Do you make use of proper response codes and HTTP headers where it makes sense?

### Development and deployment

All the dependencies are inside the Gemfile, to run this project locally you just need to [clone][https://github.com/WLSF/addressbook] this repository, and run it using rails tools.

```
git clone git@github.com:WLSF/addressbook.git
cd addressbook
bundle install
rake db:migrate
rake db:seed
rails s
```

This project uses **Heroku**, **Terraform** and **Codeship**.

**Heroku** to host the application (The free version with SSL).
**Codeship** to CI, deployments of new versions requires just a git push on the repository
*I have 2 years of experience using Jenkins as well, both of the tools are amazing to control the versions which can be released to the server without breaking the currently App, and they make the deployment very easier for developers.*

**Terraform** to IaC, deployment of new machines.
*Terraform is a cool tool for IaC, that can be used alongside of Kubernetes to deploy new servers and take care of auto-scaling. These DevOps techniques can be very useful for micro-services projects, or even multi-layered applications*
