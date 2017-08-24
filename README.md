# Happy Camper

Happy Camper is a campground search and reservation web application. Users are able to find campgrounds by name or location, view their detail, amenities, and reviews, and visit the reservation site for the campground they have selected.

### Installing

For local install:

```
bundle install
```

```
rails db:create && rails db:migrate && rails db:seed
```

To view the app at localhost:3000

```
rails s
```

## Running the tests

To run tests:

```
rails rspec
```

## Built With

* [Ruby on Rails](http://rubyonrails.org/) - Web framework used
* [Bootstrap](http://getbootstrap.com/) - CSS framework
* [Google API](https://developers.google.com/places/) - API used for mapping campground locations, reviews, and photos
* [Active Access API](http://developer.active.com/docs/read/Campground_APIs) - API used for campground information

## Contributing

We love pull requests! Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details.

## Authors

* **[Erika Boren](https://github.com/erikasboren)** * **[Katy McCloskey](https://github.com/katymccloskey)** * **[Mitchell Hendee](https://github.com/kunomaclis)**




## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to the [Supercamp](https://github.com/davekrupinski/supercamp) Gem, the wrapper for our Active Access API
* Thanks to [DevBootcamp](https://github.com/Devbootcamp) for everything!
