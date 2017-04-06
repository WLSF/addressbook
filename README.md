[firebase-url]: https://firebase.com
[rfc-http-url]: https://www.ietf.org/rfc/rfc2616.txt
[base-url]: https://strvaddressbook.herokuapp.com/

# Backend Test Project - Addressbook

>Your task is to implement a simple AddressBook backend API. Detailed specifications for the test project are provided below. We estimate that you will not need more than a single weekend at relaxed coding speed to implement it.

This is a simple AddressBook backend API created for the STRV applyment.

## Project description

>The addressbook app will be used by your users to perform the following tasks:

>- Register new user account(s) under an organization
>- Manage contacts of the organization

>Each user should be associated with one or more organizations (can be chosen by the user himself during the registration). Every organization will have its own addressbook (list of contacts), which all of the organization's users can manage. Organizations are then managed by Admin user.

When creating a new User, it needs the following params: **[name, email, password, password_confirmation, organization_id]**

*organization_id* can be even an Integer value or an Array of Integers

Once logged-in the User can create, update and delete Contacts.

## Technical details

>Your backend should be able to serve all kinds of clients (which you do not have to implement 😀) - both mobile apps and websites using a RESTful API. The following technical requirements are placed on your implementation:

The RESTful API contains the following endpoints:

```
(POST) https://strvaddressbook.herokuapp.com/api/v1/users - Register new User

(POST) https://strvaddressbook.herokuapp.com/session - Sign-in
(DELETE) https://strvaddressbook.herokuapp.com/session - Sign-out


[These endpoints are reachable for every authenticated user]
(POST) https://strvaddressbook.herokuapp.com/api/v1/contacts - Create new Contact
(PUT) https://strvaddressbook.herokuapp.com/api/v1/contacts/:id - Edit an existing Contact
(DELETE) https://strvaddressbook.herokuapp.com/api/v1/contacts/:id - Delete an existing Contact
[end]

[These endpoints are reachable only for an authenticated admin]
(GET) https://strvaddressbook.herokuapp.com/api/v1/organizations - List all Organizations
(POST) https://strvaddressbook.herokuapp.com/api/v1/organizations - Create new Organization
(GET) https://strvaddressbook.herokuapp.com/api/v1/organizations/:id - Retrieves an Organization by id
(PUT) https://strvaddressbook.herokuapp.com/api/v1/organizations/:id - Edit an existing Organization
(DELETE) https://strvaddressbook.herokuapp.com/api/v1/organizations/:id - Delete an existing Organization
(GET) https://strvaddressbook.herokuapp.com/api/v1/organizations/:id/addressbook - List all Contacts located into the Organization addressbook
[end]
```

### API

- Use Ruby (v2.0+) with Ruby on Rails framework (v5.0+)
- HTTP responses should follow best practices in the industry (especially with regard to status code definitions and request/response headers' usage - you may consult [RFC 2616][rfc-http-url] for more information)
- API should communicate with their clients using JSON data structures
- Implement authentication that would be the best for the clients by your opinion


### User accounts

- All user account information should be stored in either a relational database (MySQL, PostgreSQL, etc.) or a NoSQL database (MongoDB, CouchDB etc., but not Firebase)
- Registrations should be done with email and password
- There should be one Admin account, which will manage organizations
- You should implement the following functionality:
  - User registration (Admin can be hard coded)
  - User login

### Contact data

- All your organizations' contacts should be stored in [Firebase][firebase-url]
- You should implement the following functionality within the app:
  - Create a new contact
  - Update or delete existing contact
  - List all contacts (of the organization)

### Bonus task

Optionally, you can add some cool feature that can make your test project dazzle us! It could be some new technology or something that would suit this app (e.g. search functionality, exports, etc.). But no worries about it - it's NOT mandatory 😉

## Review process

There are a few technical restrictions so we can see how you fare with the technologies and processes we use on a daily basis, but in general, the actual implementation is quite open-ended. The reason is we want to see how you think in terms of backend architecture, development processes and how you generally deal with the challenges you might face while implementing this app.

The following should help you determine where to put your focus, since these are the things we will be looking for while reviewing your project.

### 🔥 Code quality

Is your code well-structured? Do you keep your coding style consistent across your codebase?

### 🔥 Security

How do you store your customers' passwords? What about security of your customers' data?

### 🔥 Testability

Is your code tested? How do you write tests? Do you even write them? 😀

### API structure and usability

How do you structure API endpoints? Do you follow REST principles? Do you make use of proper response codes and HTTP headers where it makes sense?

### Development and deployment

>How hard is it to run your project locally? And how hard is it to deploy it?

All the dependencies are inside the Gemfile, to run this project locally you just need to [clone][git@github.com:WLSF/addressbook.git] this repository, and run it using rails tools.

```
git clone git@github.com:WLSF/addressbook.git
cd addressbook
bundle install
rake db:migrate
rake db:seed
rails s
```

This project uses Heroku, Terraform and Codeship.

The deploy of a new version requires a push to the repository, the Codeship takes care of the CI.

And the Terraform is responsible for the deployment of new machines.

### New language features

We always keep up with the latest trends and versions of libraries and languages! Stay updated 😉
### Documentation

Is your API documented? Is the documentation sufficient for at least basic needs in multi-platform development team?

> That's it. Good luck and we look forward to seeing your submission!
