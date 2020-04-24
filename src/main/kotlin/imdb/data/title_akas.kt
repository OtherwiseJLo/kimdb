package imdb.imdb.data

data class title_akas(val titleId: String,
                      val ordering: Int,
                      val title: String,
                      val region: String,
                      val language: String,
                      val types: List<String>,
                      val attributes: List<String>,
                      val isOriginalTitle: Boolean)