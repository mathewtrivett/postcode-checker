# Documentation

## Managing the service areas list

If you set up the app using the instructions in [Getting started](#getting-started) it will create the following service areas:

- Southwark - With the associated example allowed_post_code `SE17QD`
- Lambeth - With the associated example allowed_post_code `SE17QA`

At this stage you updates to the service areas list involve directly updating the database. You can edit the script in the `db/seeds.rb` file or add them to the database manually using rails console.

```ruby
$ rails c # Launches an interactive rails console
2.7.2 :001 > ServiceArea.create(name: 'Service area name')
```

> Delete or update `ServiceArea`s using the rails console and the [ActiveModel query interface](https://guides.rubyonrails.org/active_record_querying.html).

## Managing allowed post codes list

The app will create the following allowed post codes:

- SH241AA
- SH241AB

Managing the allowed postcode list involves updating the database in the same way as [Managing service areas](#managing-the-service-areas-list).

```ruby
$ rails c # Launches an interactive rails console
2.7.2 :001 > AllowedPostCode.create(postcode: 'An allowed postcode')
```

> Delete or update `AllowedPostCode`s using the rails console and the [ActiveModel query interface](https://guides.rubyonrails.org/active_record_querying.html).
