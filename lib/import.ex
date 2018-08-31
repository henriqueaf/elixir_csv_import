defmodule Csv.Import do
  alias Csv.RecordStream

  def call(input_path, schema: schema, headers: headers, repo: repo) do
    {:ok, device} = File.open(input_path)
    {:ok, stream} = RecordStream.new(device, headers: headers, schema: schema)

    # stream |> Enum.each(&Csv.Repo.insert/1) #sync approach
    stream
    |> Task.async_stream(repo, :insert, [], max_concurrency: 10) #async approach
    |> Enum.to_list
  end
end
