# Configuration to Heroku provider

# Setup 1 application or manage it if already exists.
provider "heroku" {
    email = "${var.heroku_email}"
    api_key = "${var.heroku_key}"
}

resource "heroku_app" "default" {
    name    = "${var.heroku_app}"
    region  = "${var.heroku_region}"

    config_vars = {
      RAILS_ENV = "production"
      FIREBASE_URI = "https://addressbook-contacts.firebaseio.com"
      FIREBASE_SECERT_KEY = "AIzaSyCsS2AcN4yZY8iQwJGtph29PWHcQd3tsl4"
    }
}

resource "heroku_addon" "database" {
    app = "${var.heroku_app}"
    plan = "heroku-postgresql:hobby-dev"
}
