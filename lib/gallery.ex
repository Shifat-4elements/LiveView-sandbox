defmodule Gallery do
  @moduledoc """
  Gallery keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @unsplash_url "https://images.unsplash.com"

  @ids [
    "photo-1562971179-4ad6903a7ed6",
    "photo-1552673597-e3cd6747a996",
    "photo-1561133036-61a7ed56b424",
    "photo-1530717449302-271006cdc1bf"
  ]

  def image_ids, do: @ids

  def image_url(image_id, params) do
    URI.parse(@unsplash_url)
    |> URI.merge(image_id)
    |> Map.put(:query, URI.encode_query(params))
    |> URI.to_string()
  end

  def thumb_url(id),
    do: image_url(id, %{w: 100, h: 100, fit: "crop"})

  def large_url(id),
    do: image_url(id, %{h: 500, fit: "crop"})

  def first_id(ids \\ @ids), do: List.first(ids)

  def next_image_id(ids\\@ids, id) do
    Enum.at(ids, next_index(ids, id), first_id(ids))
  end

  defp next_index(ids, id) do
    ids
    |> Enum.find_index(& &1 == id)
    |> Kernel.+(1)
  end

  def prev_image_id(ids\\@ids, id) do
    Enum.at(ids, prev_index(ids, id))
  end


  defp prev_index(ids, id) do
    ids
    |> Enum.find_index(& &1 == id)
    |> Kernel.-(1)
  end
end
