
import argparse
import random
import time

from pythonosc import udp_client

import quandl
import pandas   

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("--ip", default="localhost",
                        help="The ip of the OSC server")
    parser.add_argument("--port", type=int, default=5005,
                        help="The port the OSC server is listening on")
    args = parser.parse_args()
    client = udp_client.SimpleUDPClient(args.ip, args.port)

    client.send_message("/amp", 1)
    time.sleep(1)
    client.send_message("/amp", 0.2)

    # full_data = quandl.get("WIKI/AAPL", rows=10)
    # checking that it worked !
    # print(full_data)

    # full_data = pandas.read_csv("aapl.csv")

    # data_pct = full_data['Open'].pct_change()
    # print(data_pct.head())

    # full_data['pct'] = data_pct

    # print(full_data.head())
    # for index, row in full_data.iterrows():
    #     print(row['Open'])
    #     client.send_message("/amp", 400+row['pct'])
    #     time.sleep(1)
