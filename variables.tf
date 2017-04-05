variable "heroku_key" {
    description = "The Heroku api-key"
}

variable "heroku_email" {
    description = "The email of the heroku user"
}

variable "heroku_region" {
    description = "The Heroku region to create things in."
    default = "us"
}

variable "heroku_app" {
    description = "The name of the Heroku app to manage/create."
}

variable "heroku_git" {
    description = "The git repository of the Heroku app, to deploy new versions."
}
