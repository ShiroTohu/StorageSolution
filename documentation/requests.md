# Sending Requests to the Storage System
In order to effectively send information to the storage system in order to make
it do something you will need to make a request. Requests are made over the
websockets are are exchanged between the websocket server and the minecraft
server running the system.

## What Requests Look Like
Requests are formatted in JSON format, this means that when using a programming
language such as python you will need to change the object type to JSON before
parsing it over to the storage system where it will be parsed and deserialised.
Here is an example of a JSON Request to the storage system would look like.

This is the most common use case of the input command
```json
{
    "command": "input",
    "data": "all"
}
```

This can be a use case, but at the moment it isn't the case due to the current
scope of this project unfortunately.
```json
{
    "command": "input",
    "data": {
        "minecraft:cobblestone": 64,
        "minecraft:dirt": 64
    }
}
```
### Command Types
Currently there are three command types, `input`, `output`, and `search`. It is
possible that more command types will be added in the future, but at the moment
it is just three.

### Data
The Data that can be transmitted is usually a dictionary containing the name of
the item or block like `minecraft:dirt_block` or if it is a modded item,
something like `computercraft:computer`, this is then usually specified by the
number you want to input.

## Example Requests
```json
    "command": "input",
    "data": "all"
```

```json
    "command": "output",
    "data": {
        "minecraft:cobblestone": 128,
        "minecraft:dirt": 64
    }
```

```json
    "command": "serach",
    "data": [
        "minecraft:cobblestone", 
        "minecraft:dirt", 
        "computer", 
        "dirt"
    ]
```