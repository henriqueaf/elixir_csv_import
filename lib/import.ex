defmodule Csv.Import do
  alias Csv.RecordStream

  def call(input_path, schema: schema, headers: headers, repo: repo) do
    {:ok, device} = File.open(input_path)
    {:ok, stream} = RecordStream.new(device, headers: headers, schema: schema)

    # stream |> Enum.each(&Csv.Repo.insert/1) #sync approach

    # stream
    # |> Stream.filter(fn(%{Period: period}) -> period == "2016.01" end)
    # |> Task.async_stream(repo, :insert, [], [max_concurrency: 5, timeout: 1000]) #async approach
    # |> Task.async_stream(&(IO.puts inspect &1), [max_concurrency: 100, timeout: 1000]) #async approach
    # |> Enum.to_list

    Stream.chunk_every(stream, 4500)
    |> Stream.map(fn(buildings) ->
      buildings_map_array = Enum.map(buildings, &schema_struct_to_map/1)

      # Ecto.Multi.new()
      # |> Ecto.Multi.insert_all(:insert_all, schema, buildings_map_array)
      # |> repo.transaction()

      repo.insert_all(schema, buildings_map_array)
    end)
    |> Enum.to_list()
  end

  defp schema_struct_to_map(schema_struct) do
    schema_struct
    |> Map.from_struct
    |> Map.drop([:__meta__, :id])
  end
end
