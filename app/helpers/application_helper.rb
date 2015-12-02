module ApplicationHelper
  # Method to get a list of lists grouped by specified number of elements
  def create_list_groups(list_of_elements, group_size)
    grouped_elements = []
    list_of_elements.each_slice(group_size) do |each|
      grouped_elements << each
    end

    return grouped_elements
  end
end
