defmodule ApplicationEnvExample do
  def send_http_request(path, body) do
    base_url = Application.get_env(:my_app, :base_url)

    Req.post(base_url <> path, body)
  end
end
