// import { $CombinedState } from "redux";

export const fetchSearchGiphys = searchTerm => (
  $.ajax({
    method: 'GET',
    url: 'http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=e10ELIjDhDd4ophVDhSWvJtk38B90kgl&limit=2'
  })
)

