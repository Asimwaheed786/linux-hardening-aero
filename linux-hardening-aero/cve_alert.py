#!/usr/bin/env python3
import smtplib
from email.message import EmailMessage
import socket

def send_alert():
    msg = EmailMessage()
    msg.set_content("Simulated CVE alert: Vulnerability detected on host {}".format(socket.gethostname()))
    msg['Subject'] = 'CVE Alert Notification'
    msg['From'] = 'waheedasim20@gmail.com'
    msg['To'] = 'waheedasim20@gmail.com'

    try:
        with smtplib.SMTP('localhost') as server:
            server.send_message(msg)
        print("Alert sent successfully.")
    except Exception as e:
        print("Failed to send alert:", e)

if __name__ == "__main__":
    send_alert()
