from source.appllication import StorageSystemApp
import argparse

description = """
client program used to interface with a minecraft storage system. Currently only
used to see what is inside of the chests.
"""

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = description)
    parser.add_argument('websocketAddress', help = "the ip and port of the server you want to connect to")
    args = parser.parse_args()

    app = StorageSystemApp(args.websocketAddress)
    app.run()