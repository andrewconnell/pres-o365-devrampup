Azure AD & Office 365 Cheat Sheet
=================================

Azure AD Authorization Token Endpoint (code only)
-------------------------------------------------
````
https://login.windows.net/<tenant-id>/oauth2/authorize
?client_id=
&redirect_uri=
&state=
&response_type=code
````

Azure AD Authorization Token Endpoint (OpenId)
----------------------------------------------
````
https://login.windows.net/<tenant-id>/oauth2/authorize
?client_id=
&response_mode=form_post
&redirect_uri=
&state=
&nonce=
&response_type=code+id_token
````

Sample OpenID Token:
--------------------
````
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik1uQ19WWmNBVGZNNXBPWWlKSE1iYTlnb0VLWSJ9.eyJhdWQiOiI5YjI3NWFiOS0yN2M4LTQ3MGEtYTVlMS03Y2E4ZTU1NDkxN2MiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9jYzQ5OTEzZi0xNzFmLTQ4ZDUtYmNjOS1kYjM5NjdhY2ZiZWQvIiwiaWF0IjoxNDI5MDkxNTI0LCJuYmYiOjE0MjkwOTE1MjQsImV4cCI6MTQyOTA5NTQyNCwidmVyIjoiMS4wIiwidGlkIjoiY2M0OTkxM2YtMTcxZi00OGQ1LWJjYzktZGIzOTY3YWNmYmVkIiwib2lkIjoiNjEzNjljNWItYjgwYi00NTAyLWEwM2MtYjBmYjc3YjRhY2IzIiwidXBuIjoiYW5kcmV3LmNvbm5lbGxAYWNpbzM2NTAzLm9ubWljcm9zb2Z0LmNvbSIsInN1YiI6Ikt2R1dIcGtqUnlQRm1sUXp4eEZOc1VBektZRU9zTWRqTzM5U3VDQk12QW8iLCJnaXZlbl9uYW1lIjoiQW5kcmV3IiwiZmFtaWx5X25hbWUiOiJDb25uZWxsIiwibmFtZSI6IkFuZHJldyBDb25uZWxsIiwiYW1yIjpbInB3ZCJdLCJ1bmlxdWVfbmFtZSI6ImFuZHJldy5jb25uZWxsQGFjaW8zNjUwMy5vbm1pY3Jvc29mdC5jb20iLCJub25jZSI6IjYzNTY0Njg4NjE4MjY3MzAzMi5Zamc0TldSbU5qSXROMk5tTkMwME5UVmxMVGs1TmpNdFpEVmhZV1EyWkRZelpUUmpaV0ptTW1abVl6SXRaR1prTUMwME5URTJMVGhpTW1NdE1qZzJZakZqTWpnME9HRmkiLCJjX2hhc2giOiJYbElpYXEzNDE1RWRobEhlWGdLNkN3IiwicHdkX2V4cCI6IjYyMzA4NjUzIiwicHdkX3VybCI6Imh0dHBzOi8vcG9ydGFsLm1pY3Jvc29mdG9ubGluZS5jb20vQ2hhbmdlUGFzc3dvcmQuYXNweCJ9.MJKjcQxaPbCEmSeJmIQFBpsRE89wGHKfZajj8PUPCLS28FN3d5Fn73wOOl9FSsqNYNy5oHwnB4QhA7ZYLjK8tdPsTxxcY8wnkkNFOhCRDiD5cE3IMj7GDABhtdUpD3dMuUNEkhlUkqoVdL_wxpGG0Gr1eQHFPANG8uKuOJCx8jmIdzIae9FIGiXi64bYW9YsQCguUWTMQor3ja3YpdVIAMsRoZ_XE8VzieGQhDe9NK64tOUcIxQI6AUQuOUHVzF8L-jICLSCqzKd5ZEBWfOGa9-3P5AabsggLj9D6-mxyPLX2OeI9XgJ5_YXVhf4JYqavmhubzcjYyR4xEggNDMpjw
````

Azure AD Access Token Endpoint
------------------------------
````
https://login.windows.net/<tenant-id>/oauth2/token
````

headers:
````
Accept: application/json
Content-Type: application/x-www-form-urlencoded
````

body:
````
grant_type=authorization_code
&redirect_uri=
&client_id=
&client_secret=
&resource=
&code=
````

Resource ID's and Endpoints
---------------------------
Azure AD Graph
- Resource ID: `https://graph.windows.net`
- Endpoint: `https://graph.windows.net`

Office 365 Discovery Service
- Resource ID: `https://api.office.com/discovery/`
- Endpoint: `https://api.office.com/discovery/v1.0/me/`