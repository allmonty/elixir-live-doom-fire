defmodule LiveDoomFireWeb.DoomFire do
  def create_fire_data_structure(width, height) do
    fire_data =
      Enum.reduce(0..(width - 1), %{}, fn x, acc ->
        Enum.reduce(0..(height - 1), acc, fn y, acc ->
          Map.put(acc, {x, y}, 0)
        end)
      end)

    {fire_data, width, height}
  end

  def create_fire_source(fire_data, width, height) do
    Enum.reduce(0..(width - 1), fire_data, fn x, acc ->
      Map.put(acc, {x, height - 1}, 36)
    end)
  end

  def calculate_fire_propagation(fire_data, width, height) do
    Enum.reduce(0..(height - 1), fire_data, fn y, acc ->
      Enum.reduce(0..(width - 1), acc, fn x, acc ->
        update_fire_intensity_per_pixel(acc, x, y, width)
      end)
    end)
  end

  defp update_fire_intensity_per_pixel(fire, x, y, width) do
    case fire[{x, y + 1}] do
      nil ->
        fire

      intensity ->
        decay = :rand.uniform(3) - 1
        new_intensity = max(intensity - decay, 0)
        Map.put(fire, find_position(decay, x, y, width), new_intensity)
    end
  end

  defp find_position(offset, x, y, width) do
    absolute_pos = x + y * width
    new_position = absolute_pos - offset
    new_y = Integer.floor_div(new_position, width)
    new_x = rem(new_position, width)
    {new_x, new_y}
  end
end
