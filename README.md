# Campfire

## `GET /stories`

Get a list of stories:

```
[
  {
    "id":3,
    "url": "https://www.youtube.com/watch?v=-xFF5KF-KpE",
    "is_featured": false,
    "user": {
      "name": "Jason L Perry",
      "avatar_url": "https://..."
    },
    "tags": [
      { "name": "frontend", "is_primary":true },
      { "name": "react", "is_primary": false }
    ],
    "created_at": "2017-01-19T19:05:24.798Z"
  },
  ...
]
```

You can also do:

`GET /stories?featured&limit=6`

`GET /stories?page=2&per=10`

## `POST /stories`

Create a story.

Request:

```
{
  "url": "https://www.youtube.com/watch?v=-xFF5KF-KpE",
  "primary_tag": "javascript",
  "tag_list": "react react-native mobile flexbox"
}
```

## `GET /stories/1`

## `GET /stories/1/comments`

## `POST /stories/1/comments`

Request:

```
{
  "message": "Ayy LMAO!"
}
```

## `GET /tags`

Get all tags:

```
[
  { "name": "frontend", "is_primary":true },
  { "name": "backend", "is_primary":true },
  { "name": "react", "is_primary": false }
]
```


## `GET /tags?primary=1`

Get all primary tags:

```
[
  { "name": "frontend", "is_primary":true },
  { "name": "backend", "is_primary":true },
  { "name": "gadgets", "is_primary":true },
  { "name": "humor", "is_primary":true },
  { "name": "programming", "is_primary":tru e}
]
```
