defmodule Scurvy.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    markup = """
    <html>
      <head>
        <title>Don't cross the streams!</title>
      </head>
      <body>
        <h1>Here's you</h1>
        <div>
          <img src="video.mjpg" />
        </div>
        <p>I like you.</p>
      </body>
    </html>
    """

    conn
    |> put_resp_header("Content-Type", "text/html")
    |> send_resp(200, markup)
  end

  forward "/video.mjpg", to: Scurvy.Streamer
end
