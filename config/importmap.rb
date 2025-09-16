# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

### pin "name_used_in_import", to: "path_to_file"
pin "bootstrap", to: "bootstrap.bundle.min.js"


### And remember, it was soo difficult downloading the file from
### the official website and adding it to the folder
### and then having to 'pin' it so that the import works
